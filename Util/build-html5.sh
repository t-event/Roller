#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."
WORKSPACE=${GITHUB_WORKSPACE:="$(pwd)"}
export WORKSPACE

[ "${S2D_BUILD_NAME}" ] || { echo "S2D_BUILD_NAME is not set (e.g. 2026.3731)" 1>&2; exit 1; }
S2D_BUILD_NUMBER="$(echo "$S2D_BUILD_NAME." | cut -d. -f2)"
export S2D_BUILD_NUMBER

# The Solar2D disk image must NOT be downloaded/mounted anywhere under the
# project directory: CoronaBuilder's HTML5 packager treats projectPath as
# the asset source and copies everything in it into the game bundle. A
# mount point inside the repo (the original Util/S2D layout) made it try
# to pull the whole several-hundred-MB SDK (Android/iOS tools, JREs, ...)
# in as "game assets", which looked like a hang but was really a very slow,
# very wrong copy. Keep it outside the checkout entirely.
S2D_DIR="${RUNNER_TEMP:-/tmp}/S2D"
export S2D_DIR
mkdir -p "$S2D_DIR"

S2D_DMG="${S2D_DIR}/S2D-${S2D_BUILD_NUMBER}.dmg"
if [ ! -f "${S2D_DMG}" ]
then
	echo "Downloading Solar2D ${S2D_BUILD_NAME}"
	curl -L "https://github.com/coronalabs/corona/releases/download/${S2D_BUILD_NUMBER}/Solar2D-macOS-${S2D_BUILD_NAME}.dmg" -o "${S2D_DMG}"
fi

S2D_MOUNT="${S2D_DIR}/mnt"
hdiutil attach "${S2D_DMG}" -noautoopen -mount required -mountpoint "$S2D_MOUNT"

echo "Building HTML5"
# dstPath must also live outside the project tree for the same reason as
# S2D_DIR above: it's a subdirectory of projectPath that the build would
# otherwise try to bundle into itself while still writing it.
OUTPUT_DIR="${RUNNER_TEMP:-/tmp}/Output"
export OUTPUT_DIR
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"
BUILDER="${S2D_MOUNT}/Corona-${S2D_BUILD_NUMBER}/Native/Corona/mac/bin/CoronaBuilder.app/Contents/MacOS/CoronaBuilder"

# Give it a generous but finite ceiling so a genuine hang still surfaces as
# a clear timeout with whatever it printed, instead of eating the whole
# job's time budget silently.
"$BUILDER" build --lua "Util/recipe-html5.lua" &
BUILD_PID=$!
(
	sleep 600
	if kill -0 "$BUILD_PID" 2>/dev/null; then
		echo "CoronaBuilder did not finish within 10 minutes, killing it (probably hung)" 1>&2
		kill -9 "$BUILD_PID" 2>/dev/null
	fi
) &
WATCHDOG_PID=$!
set +e
wait "$BUILD_PID"
BUILD_STATUS=$?
set -e
kill "$WATCHDOG_PID" 2>/dev/null || true
wait "$WATCHDOG_PID" 2>/dev/null || true

hdiutil detach "$S2D_MOUNT"

exit "$BUILD_STATUS"
