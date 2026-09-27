-- "Games"-steinen på startskjermen fører hit (lagt til 2026-09-27).
-- Minispillene for marken finnes ikke ennå, så dette er en plassholder
-- med vei tilbake til menyen. Panelet og knappen er de samme bildene som
-- pausemenyen bruker.

local composer = require( "composer" )

local scene = composer.newScene()

local bredde = display.contentWidth
local hoyde = display.contentHeight

local function tilMenyen()
	local ok, err = pcall( composer.gotoScene, "scenes.gotomenu", { effect = "fade", time = 500 } )
	if not ok then
		print( "CRASH going to gotomenu (minispill): " .. tostring( err ) )
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

	local tittel = display.newText( { parent = grp, text = "Games", x = bredde / 2, y = panel.y - 190,
		font = native.systemFontBold, fontSize = 40 } )
	tittel:setFillColor( 0.95, 0.85, 0.7 )

	local tekst = display.newText( { parent = grp, text = "Coming soon", x = panel.x, y = panel.y - 30,
		font = native.systemFontBold, fontSize = 30 } )
	tekst:setFillColor( 0.2, 0.2, 0.2 )

	local menyknapp = display.newImageRect( grp, "pausemenumainmenu.png", 109, 45 )
	menyknapp.x = panel.x
	menyknapp.y = panel.y + 45
	menyknapp:addEventListener( "tap", tilMenyen )
end

function scene:hide( event )
	if event.phase == "did" then
		composer.removeScene( "scenes.minispill" )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )

return scene
