local root = os.getenv('GITHUB_WORKSPACE') or os.getenv('WORKSPACE') or "."
local buildNumber = os.getenv('S2D_BUILD_NUMBER')

-- CoronaBuilder.app doesn't bundle webtemplate.zip itself; it normally finds
-- it via a ~/Library/Application Support/Corona/Native symlink that only
-- gets created when Solar2D has been installed/launched normally. On a
-- fresh CI runner that symlink doesn't exist, so point straight at the
-- copy that ships inside the mounted disk image instead.
local webtemplate = root .. "/Util/S2D/Corona-" .. buildNumber
	.. "/Corona Simulator.app/Contents/Resources/webtemplate.zip"

return {
	platform = "HTML5",
	appName = "Roller",
	appVersion = os.getenv('APP_VERSION_NAME') or "1.0",
	projectPath = root,
	dstPath = root .. "/Output",
	webtemplate = webtemplate,
}
