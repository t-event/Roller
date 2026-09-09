#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."
WORKSPACE=${GITHUB_WORKSPACE:="$(pwd)"}
export WORKSPACE

[ "${S2D_BUILD_NAME}" ] || { echo "S2D_BUILD_NAME is not set (e.g. 2026.3731)" 1>&2; exit 1; }
S2D_BUILD_NUMBER="$(echo "$S2D_BUILD_NAME." | cut -d. -f2)"
export S2D_BUILD_NUMBER

S2D_DMG="Util/S2D-${S2D_BUILD_NUMBER}.dmg"
if [ ! -f "${S2D_DMG}" ]
then
	echo "Downloading Solar2D ${S2D_BUILD_NAME}"
	curl -L "https://github.com/coronalabs/corona/releases/download/${S2D_BUILD_NUMBER}/Solar2D-macOS-${S2D_BUILD_NAME}.dmg" -o "${S2D_DMG}"
fi

hdiutil attach "${S2D_DMG}" -noautoopen -mount required -mountpoint Util/S2D

echo "Building HTML5"
mkdir -p "$WORKSPACE/Output"
BUILDER="Util/S2D/Corona-${S2D_BUILD_NUMBER}/Native/Corona/mac/bin/CoronaBuilder.app/Contents/MacOS/CoronaBuilder"

# CoronaBuilder has been seen to hang indefinitely (no output, no error)
# instead of failing fast, e.g. if it tries to phone home for an activation
# check. Give it a hard ceiling so a hang surfaces as a clear timeout with
# whatever it printed, instead of eating the whole job's time budget.
"$BUILDER" build --lua "Util/recipe-html5.lua" &
BUILD_PID=$!
(
	sleep 480
	if kill -0 "$BUILD_PID" 2>/dev/null; then
		echo "CoronaBuilder did not finish within 8 minutes, killing it (probably hung)" 1>&2
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

hdiutil detach Util/S2D

exit "$BUILD_STATUS"
