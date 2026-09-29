-- Minispill: lengdehopp (lagt til 2026-09-28, ekte markfysikk fra
-- samme dag). Marken ruller ned tilløpsbakken av seg selv og hopper ut
-- fra kanten. Holder man inne rett før kanten, strekker marken seg og
-- hopper lenger; for tidlig stopper den i bakken, for sent hjelper lite.
-- Lengden måles fra kanten til der marken først treffer gropa. Tre hopp.
--
-- Målt i en kopi av fysikken (se KODEBASE.md): passivt ca. 530 px, med
-- strekk ca. 40 px før kanten opptil ca. 600 px. 70 px = 1 m.

local composer = require( "composer" )
local physics = require( "physics" )
local sport = require( "lib.minisport" )
local markfysikk = require( "lib.markfysikk" )

local scene = composer.newScene()

local GRADER, LENGDE, FALL = 26, 2400, 250
local PX_PER_M = 70
local FORSOK = 3
local TAN = math.tan( math.rad( GRADER ) )
local KANTX = LENGDE + 80
local KANTY = LENGDE * TAN + 230

local tilstand, mark, forsok, beste, stilleTid, flyTid
local kamera, verden, bakgrunn, info, status, merker
local lytter

local function nyMark()
	if mark then mark:fjern() end
	mark = markfysikk.lag( verden, 0, 0 )
	kamera:setFocus( mark.punkt )
end

local function nyttForsok()
	tilstand = "klar"
	physics.pause()
	nyMark()
	stilleTid, flyTid = 0, 0
	info.text = "Tap to start. Hold just before the edge to stretch out and jump further."
	status.text = string.format( "Jump %d of %d", forsok, FORSOK ) ..
		( beste and string.format( "    Best: %.2f m", beste ) or "" )
end

local function slutt()
	tilstand = "ferdig"
	local linjer = { { "Long jump", 30 } }
	if beste then
		local ny = sport.nyRekord( "lengdehopp_fysikk", beste, true )
		linjer[2] = { string.format( "Best jump: %.2f m", beste ), 28, { 0.92, 0.9, 0.86 } }
		linjer[3] = { ny and "New record!" or string.format( "Record: %.2f m", sport.rekord( "lengdehopp_fysikk" ) ), 24 }
	else
		linjer[2] = { "No valid jumps", 28, { 0.92, 0.9, 0.86 } }
		local r = sport.rekord( "lengdehopp_fysikk" )
		linjer[3] = { r and string.format( "Record: %.2f m", r ) or "", 24 }
	end
	info.text = ""
	sport.resultat( scene.view, linjer, function()
		forsok, beste = 1, nil
		for _, m in ipairs( merker ) do display.remove( m ) end
		merker = {}
		nyttForsok()
	end )
end

local function videre( tekst )
	tilstand = "vent"
	info.text = tekst
	timer.performWithDelay( 2200, function()
		if tilstand ~= "vent" then return end
		if forsok >= FORSOK then
			slutt()
		else
			forsok = forsok + 1
			nyttForsok()
		end
	end )
end

local function landet( x )
	local lengde = ( x - KANTX ) / PX_PER_M
	local m = display.newCircle( verden, x, KANTY + FALL + 4, 14 )
	m:setFillColor( 0.2, 0.1, 0.03 )
	merker[#merker + 1] = m
	if beste == nil or lengde > beste then beste = lengde end
	videre( string.format( "%.2f m", lengde ) )
end

function scene:create( event )
	local grp = self.view
	physics.start()
	bakgrunn = sport.bakgrunn( grp )

	kamera, verden = sport.kamera( grp, bakgrunn )

	-- tilløpsbakke og kanten (planken)
	sport.terreng( verden, { { -300, -300 * TAN + 230 }, { LENGDE, KANTY }, { KANTX, KANTY } } )
	local brett = display.newRect( verden, KANTX - 30, KANTY + 8, 60, 16 )
	brett:setFillColor( 0.92, 0.9, 0.84 )
	sport.merke( verden, KANTX - 30, KANTY, "Board", 36 )
	-- gropa: myk, lys jord, FALL px under kanten
	local grop = sport.terreng( verden, { { KANTX, KANTY + FALL }, { KANTX + 2600, KANTY + FALL } },
		{ farge = { 0.62, 0.42, 0.24 } } )
	for m = 4, 10 do
		sport.merke( verden, KANTX + m * PX_PER_M, KANTY + FALL, m .. "", 34 )
	end
	merker = {}

	grop:addEventListener( "collision", function( e )
		if e.phase == "began" and tilstand == "flyr" and e.other and e.other.erMark then
			tilstand = "landet"
			local x = e.other.x
			timer.performWithDelay( 1, function() landet( x ) end )
		end
	end )

	sport.tekst( grp, "Long jump", sport.B / 2, 30, 30 )
	status = sport.tekst( grp, "", sport.B / 2, 68, 22, { 0.92, 0.9, 0.86 } )
	info = sport.tekst( grp, "", sport.B / 2, 110, 19 )

	sport.trykkflate( grp, function() return mark end, function()
		if tilstand == "klar" then
			tilstand = "tillop"
			info.text = ""
			physics.start()
			return false        -- starttrykket skal ikke strekke marken
		end
		return tilstand == "tillop" or tilstand == "flyr"
	end )
	sport.tilbake( grp )
	forsok = 1
	nyttForsok()

	local sist = system.getTimer()
	lytter = function()
		local naa = system.getTimer()
		local dt = math.min( 0.05, ( naa - sist ) / 1000 )
		sist = naa
		if not mark then return end
		-- sentrum av hele marken, ikke én del: den går rundt i ringen
		local mx, my = mark:senter()
		if not mx then return end
		if tilstand == "tillop" then
			if mark:fart() < 8 then stilleTid = stilleTid + dt else stilleTid = 0 end
			if stilleTid > 2 then
				videre( "The worm stopped. Let go on the run-up, it only rolls as a ring." )
			elseif mx > KANTX then
				tilstand = "flyr"
			end
		elseif tilstand == "flyr" then
			flyTid = flyTid + dt
			if flyTid > 6 or my > KANTY + FALL + 600 then
				videre( "No landing." )
			end
		end
	end
	Runtime:addEventListener( "enterFrame", lytter )
end

function scene:hide( event )
	if event.phase == "will" then
		Runtime:removeEventListener( "enterFrame", lytter )
		kamera:stopp()
		tilstand = "borte"
	elseif event.phase == "did" then
		mark = nil
		physics.start()
		composer.removeScene( "scenes.mini_lengdehopp" )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )

return scene
