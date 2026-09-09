local root = os.getenv('GITHUB_WORKSPACE') or os.getenv('WORKSPACE') or "."
local buildNumber = os.getenv('S2D_BUILD_NUMBER')
local s2dDir = os.getenv('S2D_DIR')
local outputDir = os.getenv('OUTPUT_DIR')

-- CoronaBuilder.app doesn't bundle webtemplate.zip itself; it normally finds
-- it via a ~/Library/Application Support/Corona/Native symlink that only
-- gets created when Solar2D has been installed/launched normally. On a
-- fresh CI runner that symlink doesn't exist, so point straight at the
-- copy that ships inside the mounted disk image instead.
local webtemplate = s2dDir .. "/mnt/Corona-" .. buildNumber
	.. "/Corona Simulator.app/Contents/Resources/webtemplate.zip"

return {
	platform = "HTML5",
	appName = "Roller",
	appVersion = os.getenv('APP_VERSION_NAME') or "1.0",
	-- projectPath is copied wholesale into the game bundle as "assets", so
	-- it must be the checkout root (where main.lua etc actually live) and
	-- dstPath must live OUTSIDE that tree, or the build tries to bundle its
	-- own (still being written) output, and previously the mounted Solar2D
	-- SDK, back into the game. See build-html5.sh for the S2D side of this.
	projectPath = root,
	dstPath = outputDir,
	webtemplate = webtemplate,
}
