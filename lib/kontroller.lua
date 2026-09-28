-- Forklaring av styringen (lagt til 2026-09-28).
--
-- Vises fra "Controls"-steinen på startskjermen (scenes/kontroller.lua)
-- og fra "Controls"-knappen i pausemenyen (scenes/pausemenu1.lua).
-- Pausemenyen er selv en overlay, og Composer tillater bare én overlay
-- om gangen, så forklaringen er en vanlig gruppe som legges oppå det
-- som allerede vises, ikke en egen scene.
--
-- Styringen, slik den er i banefilene (trykk_knapp):
--   slipp skjermen   -> motorene går til +30, marken ruller seg til en ring
--   hold inne        -> motorene snur, marken strekker seg ut
--   dobbelttrykk     -> motorene slås av, marken blir slapp
--   ett trykk (slapp) -> stram igjen
--
--     local kontroller = require( "lib.kontroller" )
--     kontroller.vis( gruppe, function() ... end )   -- funksjonen kalles ved OK

local M = {}

local bredde = display.contentWidth
local hoyde = display.contentHeight

-- Rett mark: hale, fire midtbiter og hode på rad, som i banene.
local function rettMark( forelder, x, y )
	local g = display.newGroup()
	forelder:insert( g )
	local biter = { { "hale.png", 44, 28 }, { "del1.png", 30, 15 }, { "del1.png", 30, 15 },
		{ "del1.png", 30, 15 }, { "del1.png", 30, 15 }, { "hode.png", 30, 22 } }
	local px = 0
	for i, b in ipairs( biter ) do
		local d = display.newImageRect( g, b[1], b[2], b[3] )
		d.x = px + b[2] / 2
		px = px + b[2] - 6
	end
	g.x = x - px / 2
	g.y = y
	return g
end

-- Slapp mark: de samme bitene hengende i en bue.
local function slappMark( forelder, x, y )
	local g = display.newGroup()
	forelder:insert( g )
	local biter = { "hale.png", "del1.png", "del1.png", "del1.png", "del1.png", "hode.png" }
	local n = #biter
	for i, navn in ipairs( biter ) do
		local t = ( i - 1 ) / ( n - 1 )
		local vinkel = math.pi * ( 1 - t )
		local b = display.newImageRect( g, navn, navn == "hale.png" and 40 or 30,
			navn == "hode.png" and 22 or ( navn == "hale.png" and 26 or 15 ) )
		b.x = math.cos( vinkel ) * 62
		b.y = math.sin( vinkel ) * 26
		b.rotation = math.deg( math.atan2( math.cos( vinkel ) * 26, -math.sin( vinkel ) * 62 ) )
	end
	g.x = x
	g.y = y - 6
	return g
end

local function tekst( forelder, t, x, y, bredde, storrelse )
	local o = display.newText( { parent = forelder, text = t, x = x, y = y, width = bredde,
		font = native.systemFontBold, fontSize = storrelse or 17, align = "left" } )
	o.anchorX = 0
	o:setFillColor( 0.92, 0.9, 0.86 )
	return o
end

function M.vis( forelder, vedLukk )
	local g = display.newGroup()
	forelder:insert( g )

	-- Mørk hinne som tar imot alle trykk, så ingenting bak kan trykkes.
	local hinne = display.newRect( g, bredde / 2, hoyde / 2, bredde * 3, hoyde * 3 )
	hinne:setFillColor( 0, 0, 0, 0.55 )
	hinne:addEventListener( "touch", function() return true end )
	hinne:addEventListener( "tap", function() return true end )

	local panel = display.newImageRect( g, "pausemenu.png", 800, 470 )
	panel.x, panel.y = bredde / 2, hoyde / 2

	local tittel = display.newText( { parent = g, text = "Controls", x = bredde / 2, y = panel.y - 188,
		font = native.systemFontBold, fontSize = 32 } )
	tittel:setFillColor( 0.95, 0.85, 0.7 )

	local ix = panel.x - 285
	local tx = panel.x - 200
	local tb = 470

	local ring = display.newImageRect( g, "mark.png", 52, 60 )
	ring.x, ring.y = ix, panel.y - 115
	tekst( g, "Let go: the worm curls up into a ring and rolls down the cave.",
		tx, ring.y, tb )

	rettMark( g, ix, panel.y - 38 )
	tekst( g, "Hold the screen: the worm stretches out straight. Use it to reach across gaps and to push off.",
		tx, panel.y - 38, tb )

	slappMark( g, ix, panel.y + 42 )
	tekst( g, "Double tap: the worm goes limp and can slide through narrow, icy cracks. Tap once to make it firm again.",
		tx, panel.y + 42, tb )

	tekst( g, "Roll down through the cave and out to the right. The stone at the top left shows the level, the ring shows your lives.",
		panel.x - 320, panel.y + 125, 640, 15 )

	local ok = display.newImageRect( g, "knapp_ok.png", 109, 45 )
	ok.x, ok.y = panel.x, panel.y + 185
	ok:addEventListener( "tap", function()
		display.remove( g )
		if vedLukk then vedLukk() end
		return true
	end )
	return g
end

return M
