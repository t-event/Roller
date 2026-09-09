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
"$BUILDER" build --lua "Util/recipe-html5.lua"

hdiutil detach Util/S2D
