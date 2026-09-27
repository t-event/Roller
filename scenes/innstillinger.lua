-- "Settings"-steinen på startskjermen fører hit (lagt til 2026-09-27).
-- Foreløpig bare lyd av/på, se lib/innstillinger.lua. Panelet og
-- knappene er de samme bildene som pausemenyen bruker.

local composer = require( "composer" )
local innstillinger = require( "lib.innstillinger" )

local scene = composer.newScene()

local bredde = display.contentWidth
local hoyde = display.contentHeight

local function tilMenyen()
	local ok, err = pcall( composer.gotoScene, "scenes.gotomenu", { effect = "fade", time = 500 } )
	if not ok then
		print( "CRASH going to gotomenu (innstillinger): " .. tostring( err ) )
	end
	return true
end

function scene:create( event )
	local grp = self.view

	local bakgrunn = display.newRect( grp, bredde / 2, hoyde / 2, bredde * 2, hoyde * 2 )
	bakgrunn:setFillColor( 0.44, 0.25, 0.14 )

	local panel = display.newImageRect( grp, "pausemenu.png", 600, 300 )
	panel.x = bredde / 2
	panel.y = hoyde / 2

	local tittel = display.newText( { parent = grp, text = "Settings", x = bredde / 2, y = panel.y - 190,
		font = native.systemFontBold, fontSize = 40 } )
	tittel:setFillColor( 0.95, 0.85, 0.7 )

	local lydknapp = display.newImageRect( grp, "pausemenusound.png", 109, 45 )
	lydknapp.x = panel.x - 90
	lydknapp.y = panel.y - 10

	local lydtekst = display.newText( { parent = grp, text = "", x = lydknapp.x, y = lydknapp.y + 45,
		font = native.systemFontBold, fontSize = 22 } )
	lydtekst:setFillColor( 0.2, 0.2, 0.2 )

	local function visLyd()
		if innstillinger.lydPaa() then
			lydtekst.text = "On"
			lydknapp.alpha = 1
		else
			lydtekst.text = "Off"
			lydknapp.alpha = 0.45
		end
	end
	visLyd()

	lydknapp:addEventListener( "tap", function()
		innstillinger.byttLyd()
		visLyd()
		return true
	end )

	local menyknapp = display.newImageRect( grp, "pausemenumainmenu.png", 109, 45 )
	menyknapp.x = panel.x + 90
	menyknapp.y = panel.y - 10
	menyknapp:addEventListener( "tap", tilMenyen )
end

function scene:hide( event )
	if event.phase == "did" then
		composer.removeScene( "scenes.innstillinger" )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )

return scene
