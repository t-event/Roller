-- Felles deler for idrettsminispillene (lagt til 2026-09-28):
-- scenes/mini_100m.lua, scenes/mini_lengdehopp.lua og
-- scenes/mini_hoydehopp.lua.
--
-- Styringen er den samme som i banene, så minispillene øver på det
-- samme: marken ruller som en ring, TRYKK fort for å rulle fortere, HOLD
-- inne for å strekke marken ut (lade hoppet), SLIPP for å hoppe.
--
-- Grafikken er spillets egen: hulebakgrunnen fra startskjermen, bakken i
-- fargene fra banene, marken som ring (mark.png) eller strukket ut
-- (hale.png, del1.png, hode.png), og steinknappene fra pausemenyen.

local composer = require( "composer" )
local GGData = require( "lib.GGData" )

local M = {}

M.B = display.contentWidth
M.H = display.contentHeight
M.BAKKE_Y = M.H - 105          -- toppen av bakken på skjermen
M.R = 27                       -- radius på marken som ring
M.PX_PER_M = 40                -- bortover: 40 px per meter
M.VMAKS = 600                  -- px/s

-- Rekorder, lagret mellom hver gang spillet startes.
local data = GGData:new( "minispill" )

function M.rekord( navn )
	return data[navn]
end

-- Lagrer verdien hvis den er bedre. storreErBedre: true for hopp, false
-- for tid. Returnerer true hvis det er ny rekord.
function M.nyRekord( navn, verdi, storreErBedre )
	local gammel = data[navn]
	local bedre = gammel == nil or ( storreErBedre and verdi > gammel ) or ( not storreErBedre and verdi < gammel )
	if bedre then
		data[navn] = verdi
		data:save()
	end
	return bedre
end

-- Hulebakgrunnen fra startskjermen, fast på skjermen.
function M.bakgrunn( forelder )
	local bg = display.newImageRect( forelder, "background/bg1.png", 2880, 1620 )
	bg.width, bg.height = 1920, 1080
	bg.x, bg.y = M.B / 2, M.H / 2
	local skygge = display.newRect( forelder, M.B / 2, M.H / 2, M.B * 3, M.H * 3 )
	skygge:setFillColor( 0.08, 0.03, 0, 0.35 )
	return bg
end

-- Bakke fra x0 til x1 i verdensgruppa, i fargene fra banene (lys kant
-- øverst, mørk kropp).
function M.bakke( verden, x0, x1, farge )
	local b = x1 - x0
	local kropp = display.newRect( verden, ( x0 + x1 ) / 2, M.BAKKE_Y + 150, b, 300 )
	kropp:setFillColor( 38 / 255, 14 / 255, 1 / 255 )
	local kant = display.newRect( verden, ( x0 + x1 ) / 2, M.BAKKE_Y + 14, b, 28 )
	if farge then
		kant:setFillColor( unpack( farge ) )
	else
		kant:setFillColor( 72 / 255, 33 / 255, 6 / 255 )
	end
	local strek = display.newRect( verden, ( x0 + x1 ) / 2, M.BAKKE_Y + 1, b, 3 )
	strek:setFillColor( 10 / 255, 2 / 255, 0 )
	-- noen små steiner i bakken, så man ser at det går fort
	for x = x0 + 60, x1, 173 do
		local s = display.newImageRect( verden, "rock.png", 50, 28 )
		s.x = x + ( x * 7 ) % 90
		s.y = M.BAKKE_Y + 40 + ( x * 13 ) % 110
		s.alpha = 0.55
		s.rotation = ( x * 31 ) % 360
	end
end

-- Merke langs banen (en liten stolpe med tekst).
function M.merke( verden, x, tekst )
	local p = display.newRect( verden, x, M.BAKKE_Y - 14, 4, 28 )
	p:setFillColor( 0.55, 0.45, 0.35 )
	local t = display.newText( { parent = verden, text = tekst, x = x, y = M.BAKKE_Y - 40,
		font = native.systemFontBold, fontSize = 16 } )
	t:setFillColor( 0.9, 0.82, 0.7 )
end

function M.tekst( forelder, t, x, y, storrelse, farge )
	local o = display.newText( { parent = forelder, text = t, x = x, y = y,
		font = native.systemFontBold, fontSize = storrelse or 22 } )
	o:setFillColor( unpack( farge or { 0.95, 0.85, 0.7 } ) )
	return o
end

-- Knappene reagerer på "touch", ikke "tap": da tar knappen hele trykket,
-- så det ikke også går videre til trykkflata under og starter løpet.
local function paaTrykk( o, trykk )
	o:addEventListener( "touch", function( e )
		if e.phase == "began" then
			display.getCurrentStage():setFocus( o )
		elseif e.phase == "ended" or e.phase == "cancelled" then
			display.getCurrentStage():setFocus( nil )
			if e.phase == "ended" then
				trykk()
			end
		end
		return true
	end )
end
M.paaTrykk = paaTrykk

function M.knapp( forelder, bilde, x, y, trykk )
	local k = display.newImageRect( forelder, bilde, 109, 45 )
	k.x, k.y = x, y
	paaTrykk( k, trykk )
	return k
end

-- Pil tilbake til minispillmenyen, samme bilde som i banevalget.
function M.tilbake( forelder )
	local p = display.newImageRect( forelder, "tilbake.png", 200, 150 )
	p.width, p.height = 80, 60
	p.x, p.y = display.screenOriginX + 55, 42
	paaTrykk( p, function()
		local ok, err = pcall( composer.gotoScene, "scenes.minispill", { effect = "fade", time = 400 } )
		if not ok then
			print( "CRASH going to minispill: " .. tostring( err ) )
		end
	end )
	return p
end

-- Marken: en ring som ruller, eller strukket ut når man holder inne.
function M.mark( forelder )
	local g = display.newGroup()
	forelder:insert( g )
	local ring = display.newImageRect( g, "mark.png", 121, 141 )
	ring.width, ring.height = 2 * M.R + 6, ( 2 * M.R + 6 ) * 141 / 121
	local rett = display.newGroup()
	g:insert( rett )
	local biter = { { "hale.png", 44, 28 }, { "del1.png", 30, 15 }, { "del1.png", 30, 15 },
		{ "del1.png", 30, 15 }, { "del1.png", 30, 15 }, { "hode.png", 30, 22 } }
	local px = 0
	for _, b in ipairs( biter ) do
		local d = display.newImageRect( rett, b[1], b[2], b[3] )
		d.x = px + b[2] / 2
		px = px + b[2] - 6
	end
	rett.anchorChildren = true
	rett.x, rett.y = 0, M.R - 8
	rett.isVisible = false

	g.vinkel = 0
	function g:strekk( paa )
		ring.isVisible = not paa
		rett.isVisible = paa
	end
	-- Ruller ringen: vinkelen følger strekningen, så den ser ut til å rulle.
	function g:rull( dx )
		g.vinkel = g.vinkel + math.deg( dx / M.R )
		ring.rotation = g.vinkel
	end
	return g
end

-- Hele skjermen tar imot trykk: tapp gir fart, hold lader, slipp hopper.
-- lyttere = { trykk = function(), hold = function(), slipp = function(holdtid) }
-- Et trykk som varer lenger enn HOLDGRENSE sekunder regnes som hold.
M.HOLDGRENSE = 0.16
function M.trykkflate( forelder, lyttere )
	local flate = display.newRect( forelder, M.B / 2, M.H / 2, M.B * 3, M.H * 3 )
	flate.isVisible = false
	flate.isHitTestable = true
	local start, holder, timerId = nil, false, nil
	flate:addEventListener( "touch", function( e )
		if e.phase == "began" then
			start = system.getTimer()
			holder = false
			if lyttere.trykk then lyttere.trykk() end
			timerId = timer.performWithDelay( M.HOLDGRENSE * 1000, function()
				if start then
					holder = true
					if lyttere.hold then lyttere.hold() end
				end
			end )
		elseif e.phase == "ended" or e.phase == "cancelled" then
			if timerId then timer.cancel( timerId ) timerId = nil end
			if start and holder and lyttere.slipp then
				lyttere.slipp( ( system.getTimer() - start ) / 1000 )
			end
			start, holder = nil, false
		end
		return true
	end )
	return flate
end

-- Farten avtar av seg selv; hvert trykk gir mer.
function M.brems( v, dt )
	return math.max( 0, v - ( 55 + 0.33 * v ) * dt )
end

function M.gass( v )
	return math.min( M.VMAKS, v + 52 )
end

-- Fartsmåler nederst: en stein-farget stolpe som fylles.
function M.fartsmaler( forelder )
	local g = display.newGroup()
	forelder:insert( g )
	local x0, y = M.B / 2 - 150, M.H - 30
	local bunn = display.newRoundedRect( g, M.B / 2, y, 304, 18, 8 )
	bunn:setFillColor( 0.16, 0.16, 0.16, 0.9 )
	local fyll = display.newRoundedRect( g, x0, y, 300, 14, 7 )
	fyll.anchorX = 0
	fyll:setFillColor( 0.62, 0.36, 0.2 )
	local t = M.tekst( g, "Speed", x0 - 40, y, 16 )
	function g:sett( andel )
		fyll.xScale = math.max( 0.01, math.min( 1, andel ) )
	end
	g:sett( 0 )
	return g
end

-- Resultatpanel (steinpanelet fra pausemenyen) med knapper.
function M.resultat( forelder, linjer, igjen )
	local g = display.newGroup()
	forelder:insert( g )
	local panel = display.newImageRect( g, "pausemenu.png", 520, 260 )
	panel.x, panel.y = M.B / 2, M.H / 2 - 20
	for i, l in ipairs( linjer ) do
		M.tekst( g, l[1], panel.x, panel.y - 85 + ( i - 1 ) * 38, l[2] or 24, l[3] )
	end
	M.knapp( g, "knapp_igjen.png", panel.x - 70, panel.y + 80, function()
		display.remove( g )
		igjen()
	end )
	M.knapp( g, "knapp_games.png", panel.x + 70, panel.y + 80, function()
		composer.gotoScene( "scenes.minispill", { effect = "fade", time = 400 } )
	end )
	return g
end

return M
