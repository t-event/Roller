-- Minispill: høydehopp (lagt til 2026-09-28, ekte markfysikk fra samme
-- dag). Marken ruller ned tilløpet og kastes opp av en hoppkant. Lista
-- står like etter kanten og stilles med "Bar up" / "Bar down" (5 cm om
-- gangen). Hele marken må over lista. Tre forsøk per høyde.
--
-- Målt i en kopi av fysikken (se KODEBASE.md): uten å gjøre noe kommer
-- marken ca. 0,4 m over lista. Strekker man den ut (holder inne) litt før
-- kanten, farer den opp kanten som en stiv pinne og kan komme over 3 m,
-- men det er følsomt for når man trykker, som hoppene i banene.
-- 100 px = 1 m, målt fra kanten.

local composer = require( "composer" )
local physics = require( "physics" )
local sport = require( "lib.minisport" )
local markfysikk = require( "lib.markfysikk" )

local scene = composer.newScene()

local GRADER, LENGDE, UT, R = 35, 3000, 45, 450
local PX_PER_M = 100
local MIN, MAKS, STEG = 0.00, 3.50, 0.05
local TAN = math.tan( math.rad( GRADER ) )

-- tilløpet og hoppkanten (en bue fra bakken og opp til UT grader)
local function lagBane()
	local pkt = { { -300, -300 * TAN + 230 }, { LENGDE, LENGDE * TAN + 230 } }
	local a0 = math.rad( GRADER )
	local x, y = pkt[2][1], pkt[2][2]
	local cx, cy = x + R * math.sin( a0 ), y - R * math.cos( a0 )
	local n = 24
	for i = 1, n do
		local a = -a0 + ( a0 + math.rad( UT ) ) * i / n
		pkt[#pkt + 1] = { cx + R * math.sin( a ), cy + R * math.cos( a ) }
	end
	return pkt, pkt[#pkt]
end

local BANE, LEPP = lagBane()
local LISTEX = LEPP[1] + 200
local GULVY = LEPP[2] + 400

local tilstand, mark, hoyde, bom, beste, lavest, stilleTid, flyTid
local kamera, verden, bakgrunn, liste, info, status, opp, ned
local lytter

local function listeY()
	return LEPP[2] - hoyde * PX_PER_M
end

local function visStatus()
	local merke = ""
	for i = 1, bom do merke = merke .. " X" end
	status.text = string.format( "Bar: %.2f m", hoyde ) .. "   Misses:" .. ( merke == "" and " -" or merke ) ..
		( beste and string.format( "   Best: %.2f m", beste ) or "" )
end

local function nyttForsok()
	tilstand = "klar"
	physics.pause()
	if mark then mark:fjern() end
	mark = markfysikk.lag( verden, 0, 0 )
	-- mens lista stilles, står kameraet slik at kanten og lista synes
	-- (fokus vises øverst til venstre, som i banene)
	kamera:setFocus( { x = LISTEX - 900, y = LEPP[2] - 600 } )
	lavest, stilleTid, flyTid = nil, 0, 0
	transition.cancel( liste )
	liste.rotation = 0
	liste.x, liste.y = LISTEX, listeY()
	opp.isVisible, ned.isVisible = true, true
	info.text = "Set the bar, then tap to start. Hold before the ramp to fly higher."
	visStatus()
end

local function endreHoyde( d )
	if tilstand ~= "klar" then return end
	hoyde = math.max( MIN, math.min( MAKS, math.floor( ( hoyde + d ) * 100 + 0.5 ) / 100 ) )
	bom = 0
	liste.y = listeY()
	visStatus()
end

local function ferdigForsok( klart, tekst )
	tilstand = "vent"
	if klart then
		bom = 0
		if beste == nil or hoyde > beste then beste = hoyde end
		if sport.nyRekord( "hoydehopp_fysikk", hoyde, true ) then
			tekst = tekst .. "  New record!"
		end
	else
		bom = bom + 1
		if bom >= 3 then
			tekst = tekst .. "  Three misses: lower the bar or try again."
			bom = 0
		end
	end
	info.text = tekst
	visStatus()
	timer.performWithDelay( 2200, function()
		if tilstand == "vent" then nyttForsok() end
	end )
end

local function riv()
	transition.to( liste, { time = 600, y = GULVY - 10, rotation = 30, transition = easing.inQuad } )
end

function scene:create( event )
	local grp = self.view
	physics.start()
	hoyde, bom = 0.30, 0
	bakgrunn = sport.bakgrunn( grp )

	kamera, verden = sport.kamera( grp, bakgrunn )

	sport.terreng( verden, BANE )
	-- matta under og bak lista
	sport.terreng( verden, { { LEPP[1] - 150, GULVY }, { LEPP[1] + 2500, GULVY } },
		{ farge = { 0.55, 0.36, 0.2 } } )

	-- stativet med høydemerker, og lista som en stripe
	local stolpe = display.newRect( verden, LISTEX + 70, ( GULVY + LEPP[2] - 380 ) / 2, 14, GULVY - LEPP[2] + 380 )
	stolpe:setFillColor( 0.55, 0.45, 0.35 )
	for m = 0, 3.5, 0.5 do
		local y = LEPP[2] - m * PX_PER_M
		local s = display.newRect( verden, LISTEX + 70, y, 36, 6 )
		s:setFillColor( 0.9, 0.82, 0.7 )
		local t = display.newText( { parent = verden, text = string.format( "%.1f", m ), x = LISTEX + 130, y = y,
			font = native.systemFontBold, fontSize = 30 } )
		t:setFillColor( 0.9, 0.82, 0.7 )
	end
	liste = display.newRect( verden, LISTEX, 0, 150, 14 )
	liste:setFillColor( 0.95, 0.9, 0.8 )
	liste.strokeWidth = 4
	liste:setStrokeColor( 0.6, 0.25, 0.1 )

	sport.tekst( grp, "High jump", sport.B / 2, 30, 30 )
	status = sport.tekst( grp, "", sport.B / 2, 68, 21, { 0.92, 0.9, 0.86 } )
	info = sport.tekst( grp, "", sport.B / 2, 110, 19 )

	sport.trykkflate( grp, function() return mark end, function()
		if tilstand == "klar" then
			tilstand = "tillop"
			kamera:setFocus( mark.punkt )
			opp.isVisible, ned.isVisible = false, false
			info.text = ""
			physics.start()
			return false
		end
		return tilstand == "tillop" or tilstand == "flyr"
	end )
	opp = sport.knapp( grp, "knapp_opp.png", display.screenOriginX + 90, sport.H / 2 - 50, function() endreHoyde( STEG ) end )
	ned = sport.knapp( grp, "knapp_ned.png", display.screenOriginX + 90, sport.H / 2 + 5, function() endreHoyde( -STEG ) end )
	sport.tilbake( grp )
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
				ferdigForsok( false, "The worm stopped. Only hold near the ramp." )
			elseif mx > LEPP[1] - R * 0.3 then
				tilstand = "flyr"
			end
		elseif tilstand == "flyr" then
			flyTid = flyTid + dt
			-- laveste del som passerer lista (bunnen av delen, over kanten)
			for _, d in ipairs( mark.deler ) do
				if math.abs( d.x - LISTEX ) < 14 then
					local h = LEPP[2] - ( d.y + 9 )
					if lavest == nil or h < lavest then lavest = h end
				end
			end
			if mx > LISTEX + 300 or my > GULVY - 60 or flyTid > 8 then
				if lavest == nil then
					ferdigForsok( false, "The worm did not reach the bar." )
				elseif lavest >= hoyde * PX_PER_M then
					ferdigForsok( true, string.format( "Cleared %.2f m!", hoyde ) )
				else
					riv()
					ferdigForsok( false, "The bar fell." )
				end
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
		composer.removeScene( "scenes.mini_hoydehopp" )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )

return scene
