-- "Games"-steinen på startskjermen fører hit (lagt til 2026-09-27, med
-- ekte minispill fra 2026-09-28). Idrettsøvelser for marken, hver med
-- sin egen scene og rekord (lib/minisport.lua):
--   High jump -> scenes/mini_hoydehopp.lua
--   Long jump -> scenes/mini_lengdehopp.lua
--   100 m     -> scenes/mini_100m.lua

local composer = require( "composer" )
local sport = require( "lib.minisport" )

local scene = composer.newScene()

local bredde = display.contentWidth
local hoyde = display.contentHeight

local function gaaTil( navn )
	local ok, err = pcall( composer.gotoScene, navn, { effect = "fade", time = 500 } )
	if not ok then
		print( "CRASH going to " .. navn .. " (minispill): " .. tostring( err ) )
	end
end

function scene:create( event )
	local grp = self.view

	sport.bakgrunn( grp, true )

	local panel = display.newImageRect( grp, "pausemenu.png", 640, 330 )
	panel.x = bredde / 2
	panel.y = hoyde / 2 + 10

	sport.tekst( grp, "Games", bredde / 2, panel.y - 205, 40 )
	sport.tekst( grp, "Worm athletics", panel.x, panel.y - 110, 24, { 0.92, 0.9, 0.86 } )

	local function rekord( navn, format )
		local r = sport.rekord( navn )
		if r == nil then return "Record: -" end
		return "Record: " .. string.format( format, r )
	end

	local ovelser = {
		{ "knapp_hoydehopp.png", "scenes.mini_hoydehopp", rekord( "hoydehopp_fysikk", "%.2f m" ) },
		{ "knapp_lengdehopp.png", "scenes.mini_lengdehopp", rekord( "lengdehopp_fysikk", "%.2f m" ) },
		{ "knapp_100m.png", "scenes.mini_100m", rekord( "100m_fysikk", "%.2f s" ) },
	}
	for i, o in ipairs( ovelser ) do
		local x = panel.x + ( i - 2 ) * 170
		sport.knapp( grp, o[1], x, panel.y - 30, function() gaaTil( o[2] ) end )
		sport.tekst( grp, o[3], x, panel.y + 15, 17, { 0.85, 0.85, 0.85 } )
	end

	sport.knapp( grp, "pausemenumainmenu.png", panel.x, panel.y + 95, function() gaaTil( "scenes.gotomenu" ) end )
end

function scene:hide( event )
	if event.phase == "did" then
		composer.removeScene( "scenes.minispill" )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )

return scene
