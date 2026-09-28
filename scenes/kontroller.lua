-- "Controls"-steinen på startskjermen fører hit (lagt til 2026-09-28).
-- Viser forklaringen fra lib/kontroller.lua over hulebakgrunnen, og OK
-- går tilbake til startskjermen.

local composer = require( "composer" )
local kontroller = require( "lib.kontroller" )

local scene = composer.newScene()

local bredde = display.contentWidth
local hoyde = display.contentHeight

function scene:create( event )
	local grp = self.view
	local bakgrunn = display.newImageRect( grp, "background/bg1.png", 2880, 1620 )
	bakgrunn.width, bakgrunn.height = 1920, 1080
	bakgrunn.x, bakgrunn.y = bredde / 2, hoyde / 2
	kontroller.vis( grp, function()
		local ok, err = pcall( composer.gotoScene, "scenes.gotomenu", { effect = "fade", time = 500 } )
		if not ok then
			print( "CRASH going to gotomenu (kontroller): " .. tostring( err ) )
		end
	end )
end

function scene:hide( event )
	if event.phase == "did" then
		composer.removeScene( "scenes.kontroller" )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )

return scene
