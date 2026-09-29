-- Felles deler for idrettsminispillene (lagt til 2026-09-28):
-- scenes/mini_100m.lua, scenes/mini_lengdehopp.lua og
-- scenes/mini_hoydehopp.lua.
--
-- Marken er den ekte marken fra banene med samme fysikk
-- (lib/markfysikk.lua), og styres likt: slipp = ring som ruller, hold =
-- strekker seg ut, dobbelttrykk = slapp, ett trykk = stram igjen.
-- Øvelsene er bygget rundt det marken faktisk kan (målt i en kopi av
-- fysikken, se KODEBASE.md): den ruller bare nedover av seg selv, strekk
-- før en kant gir lengre og høyere hopp, og slapp glir gjennom trange
-- sprekker med is.
--
-- Banene er i "verdenspiksler" som i Box2D-oppsettet i banene, og
-- kameraet er det samme som i banene (M.kamera).

local composer = require( "composer" )
local physics = require( "physics" )
local perspective = require( "lib.perspective" )
local GGData = require( "lib.GGData" )

local M = {}

M.B = display.contentWidth
M.H = display.contentHeight
M.STEIN = 3.0                  -- friksjon på stein, som i banene
M.IS = 0.05                    -- friksjon på is, som i banene

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

-- Bakgrunn. meny = true: startskjermen flatet ut til ett bilde
-- (meny_bg.jpg), fast på skjermen. Ellers hulepanoramaet (arena_bg.jpg),
-- to bilder etter hverandre som ruller sakte bak banen: kall
-- bg:rull( kameraX ) hvert bilde. Begge lages av
-- Util/knapper/lag_knapper.py.
function M.bakgrunn( forelder, meny )
	local g = display.newGroup()
	forelder:insert( g )
	if meny then
		local bg = display.newImageRect( g, "meny_bg.jpg", 1920, 1080 )
		bg.x, bg.y = M.B / 2, M.H / 2
		function g:rull() end
		return g
	end
	-- dekker hele skjermhøyden, også på skjermer som er høyere enn 16:9
	local hoyde = display.actualContentHeight + 20
	local BB = 1200 * hoyde / 540
	for i = 0, 2 do
		local bg = display.newImageRect( g, "arena_bg.jpg", BB, hoyde )
		bg.anchorX = 0
		bg.x, bg.y = display.screenOriginX + ( i - 1 ) * BB, display.contentCenterY
	end
	function g:rull( kx )
		g.x = -( ( kx * 0.3 ) % BB )
	end
	return g
end

local KANT = { 72 / 255, 33 / 255, 6 / 255 }
local KROPP = { 38 / 255, 14 / 255, 1 / 255 }
local ISFARGE = { 36 / 255, 96 / 255, 118 / 255 }

local function flat( pkt )
	local ut = {}
	for _, p in ipairs( pkt ) do
		ut[#ut + 1] = p[1]
		ut[#ut + 1] = p[2]
	end
	return ut
end

-- Stein langs pkt (liste med {x, y}, fra venstre mot høyre). opp = true
-- gir tak (steinen fylles oppover i stedet for nedover). Tegnes i
-- fargene fra banene, med en fysisk kjede langs overflata.
function M.terreng( verden, pkt, valg )
	valg = valg or {}
	local dybde = valg.dybde or ( valg.opp and 260 or 1400 )
	-- steinen følger overflata dybde px nedover (eller oppover for tak),
	-- så den ser ut som en masse og ikke en kloss
	local fyll = {}
	for _, p in ipairs( pkt ) do fyll[#fyll + 1] = { p[1], p[2] } end
	local retning = valg.opp and -1 or 1
	for i = #pkt, 1, -1 do
		fyll[#fyll + 1] = { pkt[i][1], pkt[i][2] + retning * dybde }
	end
	local minx, maxx, miny, maxy = math.huge, -math.huge, math.huge, -math.huge
	for _, p in ipairs( fyll ) do
		minx, maxx = math.min( minx, p[1] ), math.max( maxx, p[1] )
		miny, maxy = math.min( miny, p[2] ), math.max( maxy, p[2] )
	end
	local poly = display.newPolygon( verden, ( minx + maxx ) / 2, ( miny + maxy ) / 2, flat( fyll ) )
	poly:setFillColor( unpack( KROPP ) )
	local linje = display.newLine( verden, pkt[1][1], pkt[1][2], pkt[2][1], pkt[2][2] )
	for i = 3, #pkt do linje:append( pkt[i][1], pkt[i][2] ) end
	linje:setStrokeColor( unpack( valg.farge or ( valg.is and ISFARGE ) or KANT ) )
	linje.strokeWidth = valg.is and 22 or 30
	-- fysikken: en kjede langs overflata, fra et usynlig ankerpunkt i (0, 0)
	local anker = display.newRect( verden, 0, 0, 1, 1 )
	anker.isVisible = false
	physics.addBody( anker, "static", { chain = flat( pkt ), connectFirstAndLast = false,
		friction = valg.is and M.IS or M.STEIN } )
	return anker
end

-- Merke i verden (en liten stolpe med tekst over bakken i x, y).
function M.merke( verden, x, y, tekst, storrelse )
	local p = display.newRect( verden, x, y - 30, 8, 60 )
	p:setFillColor( 0.55, 0.45, 0.35 )
	local t = display.newText( { parent = verden, text = tekst, x = x, y = y - 90,
		font = native.systemFontBold, fontSize = storrelse or 40 } )
	t:setFillColor( 0.9, 0.82, 0.7 )
	return t
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

-- Hele skjermen tar imot trykk og sender dem til marken, som i banene
-- (began = trykk, ended = slipp). vedTrykk kalles i tillegg ved hvert
-- trykk, så scenen kan starte løpet.
function M.trykkflate( forelder, hentMark, vedTrykk )
	local flate = display.newRect( forelder, M.B / 2, M.H / 2, M.B * 3, M.H * 3 )
	flate.isVisible = false
	flate.isHitTestable = true
	flate:addEventListener( "touch", function( e )
		local mark = hentMark()
		if e.phase == "began" then
			if vedTrykk and vedTrykk() == false then return true end
			if mark then mark:trykk() end
		elseif e.phase == "ended" or e.phase == "cancelled" then
			if mark then mark:slipp() end
		end
		return true
	end )
	return flate
end

-- Kamera, på samme måte som i banene: lib/perspective.lua med demping
-- 10, kameraet skalert 0,6 inni en gruppe som også er skalert 0,6, og
-- fokus på "punkt" (sveiset til marken, mark.punkt). Returnerer kameraet
-- og verdensgruppa (i lag 1) som alt i øvelsen legges i.
-- Kall kamera:setFocus( mark.punkt ) når marken er laget.
function M.kamera( forelder, bakgrunn )
	local ytre = display.newGroup()
	forelder:insert( ytre )
	local kamera = perspective.createView()
	ytre:insert( kamera )
	kamera.xScale, kamera.yScale = 0.6, 0.6
	ytre.xScale, ytre.yScale = 0.6, 0.6
	-- I banene havner fokuset øverst til venstre (0,36 x midten av
	-- skjermen), fordi bakken der går nedover mot høyre. Øvelsene er
	-- flate, så hele kameraet flyttes til marken står litt til venstre
	-- for midten og litt under, med bakken synlig foran.
	ytre.x = M.B * 0.33 - display.contentCenterX * 0.36
	ytre.y = M.H * 0.6 - display.contentCenterY * 0.36
	local verden = display.newGroup()
	kamera:add( verden, 1, false )
	-- banene setter grenser rundt hele banen; her er løypene i
	-- negative koordinater også, så ingen grenser
	kamera:setBounds( -1e7, 1e7, -1e7, 1e7 )
	kamera.damping = 10
	kamera:track()
	if bakgrunn then
		local lag1 = kamera:layer( 1 )
		kamera.bakgrunnLytter = function()
			if lag1.x then bakgrunn:rull( -lag1.x * 0.36 ) end
		end
		Runtime:addEventListener( "enterFrame", kamera.bakgrunnLytter )
	end
	function kamera:stopp()
		kamera:cancel()
		if kamera.bakgrunnLytter then
			Runtime:removeEventListener( "enterFrame", kamera.bakgrunnLytter )
		end
	end
	return kamera, verden
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
