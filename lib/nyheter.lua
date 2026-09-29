-- "What's new": kort oppsummering for spillerne etter en oppdatering
-- (lagt til 2026-09-29).
--
-- Vises én gang på startskjermen når det finnes en oppføring spilleren
-- ikke har sett (lagret med GGData "nyheter"). Første gang noen spiller
-- vises bare den nyeste. Kalles fra scenes/menu.lua.
--
-- NY OPPDATERING: legg en ny oppføring ØVERST i NYHETER med neste
-- nummer. Kort og for spillerne, 1-4 linjer, på engelsk som resten av
-- spillet.

local GGData = require( "lib.GGData" )

local M = {}

M.NYHETER = {
	{ nr = 1, dato = "2026-09-29", linjer = {
		"Levels 5-9 are brand new caves, harder the deeper you go: ice, big jumps and narrow icy cracks.",
		"The stone in the top left corner shows which level you are on.",
		"Controls: learn how to move the worm from the start screen or the pause menu.",
		"Games: Worm athletics with high jump, long jump and 100 m, with the real worm.",
	} },
}

local data = GGData:new( "nyheter" )
local vistDenneGangen = false

local bredde = display.contentWidth
local hoyde = display.contentHeight

function M.visHvisNy( forelder )
	if vistDenneGangen then return end
	vistDenneGangen = true
	local sett = data.sett or ( M.NYHETER[1].nr - 1 )
	local nye = {}
	for _, n in ipairs( M.NYHETER ) do
		if n.nr > sett then nye[#nye + 1] = n end
	end
	if #nye == 0 then return end
	data.sett = M.NYHETER[1].nr
	data:save()

	local g = display.newGroup()
	forelder:insert( g )
	local hinne = display.newRect( g, bredde / 2, hoyde / 2, bredde * 3, hoyde * 3 )
	hinne:setFillColor( 0, 0, 0, 0.5 )
	hinne:addEventListener( "touch", function() return true end )
	hinne:addEventListener( "tap", function() return true end )

	local panel = display.newImageRect( g, "pausemenu.png", 760, 420 )
	panel.x, panel.y = bredde / 2, hoyde / 2
	local tittel = display.newText( { parent = g, text = "What's new", x = panel.x, y = panel.y - 170,
		font = native.systemFontBold, fontSize = 30 } )
	tittel:setFillColor( 0.95, 0.85, 0.7 )

	local y = panel.y - 120
	local vist = 0
	for _, n in ipairs( nye ) do
		for _, l in ipairs( n.linjer ) do
			if vist < 6 then
				local t = display.newText( { parent = g, text = "- " .. l, x = panel.x - 310, y = y,
					width = 620, font = native.systemFontBold, fontSize = 18, align = "left" } )
				t.anchorX, t.anchorY = 0, 0
				t:setFillColor( 0.92, 0.9, 0.86 )
				y = y + t.height + 10
				vist = vist + 1
			end
		end
	end

	local ok = display.newImageRect( g, "knapp_ok.png", 109, 45 )
	ok.x, ok.y = panel.x, panel.y + 165
	ok:addEventListener( "tap", function()
		display.remove( g )
		return true
	end )
end

return M
