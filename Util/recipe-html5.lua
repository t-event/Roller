local root = os.getenv('GITHUB_WORKSPACE') or os.getenv('WORKSPACE') or "."

return {
	platform = "HTML5",
	appName = "Roller",
	appVersion = os.getenv('APP_VERSION_NAME') or "1.0",
	projectPath = root,
	dstPath = root .. "/Output",
}
