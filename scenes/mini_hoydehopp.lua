-- Minispill: høydehopp (lagt til 2026-09-28).
-- Still lista med "Bar up" / "Bar down" (5 cm om gangen). Trykk fort for
-- tilløpsfart, hold inne for å lade hoppet (kraftmåleren går opp og ned, full etter 0,4 s)
-- og slipp for å hoppe. Hele marken må over lista. Tre forsøk per høyde,
-- som i ekte høydehopp. Høyeste klarte høyde er rekorden.

local composer = require( "composer" )
local sport = require( "lib.minisport" )

local scene = composer.newScene()

local START = 120
local LISTE = START + 700
local PX_PER_M_H = 90           -- oppover: 90 px per meter
local G = 1100
local MIN, MAKS, STEG = 0.50, 2.60, 0.05

local tilstand, x, h, v, vx, vy, kraft, kraftRetning, sist
local hoyde, bom, klarte, beste
local verden, mark, liste, stolpe, maaler, maalerFyll, info, status, fart
local opp, ned
local lytter

local function listeY()
	return sport.BAKKE_Y - hoyde * PX_PER_M_H
end

local function visStatus()
	local merke = ""
	for i = 1, bom do merke = merke .. " X" end
	status.text = string.format( "Bar: %.2f m", hoyde ) .. "   Misses:" .. ( merke == "" and " -" or merke ) ..
		( beste and string.format( "   Best: %.2f m", beste ) or "" )
end

local function nyttForsok()
	tilstand = "klar"
	x, h, v = START, 0, 0
	kraft, kraftRetning = 0, 1
	mark:strekk( false )
	mark.rotation = 0
	maaler.isVisible = false
	liste.rotation = 0
	liste.x, liste.y = LISTE, listeY()
	liste.alpha = 1
	opp.isVisible, ned.isVisible = true, true
	info.text = "Set the bar. Tap fast to roll, hold to charge, let go to jump."
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
		if sport.nyRekord( "hoydehopp", hoyde, true ) then
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
	timer.performWithDelay( 1800, function()
		if tilstand == "vent" then nyttForsok() end
	end )
end

local function riv()
	klarte = false
	transition.to( liste, { time = 500, y = sport.BAKKE_Y - 6, rotation = 25, transition = easing.inQuad } )
end

local function hopp()
	mark:strekk( false )
	maaler.isVisible = false
	vy = kraft * ( 300 + 0.62 * v )
	vx = math.max( 120, v * 0.5 )
	klarte = true
	tilstand = "flyr"
end

function scene:create( event )
	local grp = self.view
	local bakgrunn = sport.bakgrunn( grp )
	hoyde, bom = 1.00, 0

	verden = display.newGroup()
	grp:insert( verden )
	sport.bakke( verden, -400, LISTE + 1400 )

	-- matta: myk og lys, bak lista
	local matte = display.newRoundedRect( verden, LISTE + 170, sport.BAKKE_Y - 16, 300, 40, 10 )
	matte:setFillColor( 0.5, 0.33, 0.18 )
	matte.strokeWidth = 3
	matte:setStrokeColor( 0.25, 0.13, 0.05 )

	-- stativet: en stolpe med høydemerker, og lista som en stripe
	stolpe = display.newRect( verden, LISTE + 34, sport.BAKKE_Y - 140, 8, 280 )
	stolpe:setFillColor( 0.55, 0.45, 0.35 )
	for m = 0.5, 2.5, 0.5 do
		local y = sport.BAKKE_Y - m * PX_PER_M_H
		local s = display.newRect( verden, LISTE + 34, y, 18, 3 )
		s:setFillColor( 0.9, 0.82, 0.7 )
		local t = display.newText( { parent = verden, text = string.format( "%.1f", m ), x = LISTE + 64, y = y,
			font = native.systemFontBold, fontSize = 14 } )
		t:setFillColor( 0.9, 0.82, 0.7 )
	end
	liste = display.newRect( verden, LISTE, 0, 76, 7 )
	liste:setFillColor( 0.95, 0.9, 0.8 )
	liste.strokeWidth = 2
	liste:setStrokeColor( 0.6, 0.25, 0.1 )

	mark = sport.mark( verden )
	maaler = display.newGroup()
	verden:insert( maaler )
	local mb = display.newRect( maaler, 0, 0, 12, 80 )
	mb:setFillColor( 0.16, 0.16, 0.16, 0.9 )
	maalerFyll = display.newRect( maaler, 0, 38, 8, 76 )
	maalerFyll.anchorY = 1
	maalerFyll:setFillColor( 0.62, 0.36, 0.2 )

	sport.tekst( grp, "High jump", sport.B / 2, 30, 30 )
	status = sport.tekst( grp, "", sport.B / 2, 68, 21, { 0.92, 0.9, 0.86 } )
	info = sport.tekst( grp, "", sport.B / 2, 130, 20 )
	fart = sport.fartsmaler( grp )

	sport.trykkflate( grp, {
		trykk = function()
			if tilstand == "klar" then
				tilstand = "loper"
				opp.isVisible, ned.isVisible = false, false
				info.text = "Jump a little before the bar!"
				v = sport.gass( v )
			elseif tilstand == "loper" then
				v = sport.gass( v )
			end
		end,
		hold = function()
			if tilstand == "loper" then
				tilstand = "lader"
				kraft, kraftRetning = 0, 1
				mark:strekk( true )
				maaler.isVisible = true
			end
		end,
		slipp = function()
			if tilstand == "lader" then hopp() end
		end,
	} )
	opp = sport.knapp( grp, "knapp_opp.png", display.screenOriginX + 90, sport.H / 2 - 50, function() endreHoyde( STEG ) end )
	ned = sport.knapp( grp, "knapp_ned.png", display.screenOriginX + 90, sport.H / 2 + 5, function() endreHoyde( -STEG ) end )
	sport.tilbake( grp )
	nyttForsok()

	lytter = function()
		local naa = system.getTimer()
		local dt = sist and math.min( 0.05, ( naa - sist ) / 1000 ) or 0
		sist = naa
		if tilstand == "loper" or tilstand == "lader" then
			v = sport.brems( v, dt )
			x = x + v * dt
			mark:rull( v * dt )
			if tilstand == "lader" then
				kraft = kraft + kraftRetning * dt / 0.4
				if kraft > 1 then kraft, kraftRetning = 1, -1 end
				if kraft < 0 then kraft, kraftRetning = 0, 1 end
			end
			if x + sport.R > LISTE - 10 then
				mark:strekk( false )
				maaler.isVisible = false
				riv()
				ferdigForsok( false, "You ran into the bar." )
			end
		elseif tilstand == "flyr" then
			x = x + vx * dt
			h = h + vy * dt
			vy = vy - G * dt
			mark:rull( vx * dt )
			-- hele ringen må over lista mens den passerer
			if klarte and math.abs( x - LISTE ) < sport.R * 0.8 and h < hoyde * PX_PER_M_H then
				riv()
			end
			-- matta er 36 px høy
			local gulv = ( x > LISTE + 20 and x < LISTE + 320 ) and 36 or 0
			if h <= gulv and vy < 0 then
				h = gulv
				if x < LISTE then
					ferdigForsok( false, "Too early, you came down before the bar." )
				elseif klarte then
					ferdigForsok( true, string.format( "Cleared %.2f m!", hoyde ) )
				else
					ferdigForsok( false, "The bar fell." )
				end
			end
		end
		mark.x = x
		mark.y = sport.BAKKE_Y - sport.R - h
		maaler.x, maaler.y = x - 45, mark.y - 30
		maalerFyll.yScale = math.max( 0.01, kraft )
		fart:sett( v / sport.VMAKS )
		-- kameraet følger marken, men stopper så lista alltid synes
		verden.x = -math.max( 0, math.min( x - 300, LISTE + 420 - sport.B ) )
		bakgrunn:rull( -verden.x )
	end
	Runtime:addEventListener( "enterFrame", lytter )
end

function scene:hide( event )
	if event.phase == "will" then
		Runtime:removeEventListener( "enterFrame", lytter )
		tilstand = "borte"
	elseif event.phase == "did" then
		composer.removeScene( "scenes.mini_hoydehopp" )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )

return scene
