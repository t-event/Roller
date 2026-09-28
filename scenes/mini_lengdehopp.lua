-- Minispill: lengdehopp (lagt til 2026-09-28).
-- Trykk fort for tilløpsfart. Hold inne for å strekke marken ut: da
-- viser en pil hoppvinkelen, som går opp og ned. Slipp for å hoppe.
-- Hoppet må skje før planken, ellers er det overtråkk. Lengden måles
-- fra planken, som i ekte lengdehopp. Tre hopp, det beste teller.

local composer = require( "composer" )
local sport = require( "lib.minisport" )

local scene = composer.newScene()

local START = 120
local BRETT = START + 36 * sport.PX_PER_M
local GROP0 = BRETT + 40
local GROP1 = GROP0 + 11 * sport.PX_PER_M
local G = 1100
local FORSOK = 3

local tilstand, x, h, v, vx, vy, vinkel, vinkelRetning, sist
local forsok, beste
local verden, mark, pil, info, status, fart, merker
local lytter

local function nyttForsok()
	tilstand = "klar"
	x, h, v = START, 0, 0
	vinkel, vinkelRetning = 0, 1
	mark:strekk( false )
	pil.isVisible = false
	info.text = "Tap fast to roll. Hold to aim, let go to jump before the board."
	status.text = string.format( "Jump %d of %d", forsok, FORSOK ) ..
		( beste and string.format( "    Best: %.2f m", beste ) or "" )
end

local function slutt()
	tilstand = "ferdig"
	local linjer = { { "Long jump", 30 } }
	if beste then
		local ny = sport.nyRekord( "lengdehopp", beste, true )
		linjer[2] = { string.format( "Best jump: %.2f m", beste ), 28, { 0.92, 0.9, 0.86 } }
		linjer[3] = { ny and "New record!" or string.format( "Record: %.2f m", sport.rekord( "lengdehopp" ) ), 24 }
	else
		linjer[2] = { "No valid jumps", 28, { 0.92, 0.9, 0.86 } }
		local r = sport.rekord( "lengdehopp" )
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
	timer.performWithDelay( 1600, function()
		if tilstand ~= "vent" then return end
		if forsok >= FORSOK then
			slutt()
		else
			forsok = forsok + 1
			nyttForsok()
		end
	end )
end

local function overtrakk()
	mark:strekk( false )
	pil.isVisible = false
	videre( "No jump! You went over the board." )
end

local function hopp()
	mark:strekk( false )
	pil.isVisible = false
	if x + sport.R * 0.5 > BRETT then
		overtrakk()
		return
	end
	local a = math.rad( vinkel )
	vx, vy = v * math.cos( a ), v * math.sin( a )
	tilstand = "flyr"
	info.text = ""
end

local function landet()
	if x - sport.R * 0.6 < GROP0 then
		videre( "Too early! Take off closer to the board." )
		return
	end
	local lengde = ( x - sport.R * 0.6 - BRETT ) / sport.PX_PER_M
	local m = display.newCircle( verden, x - sport.R * 0.6, sport.BAKKE_Y + 6, 7 )
	m:setFillColor( 0.2, 0.1, 0.03 )
	merker[#merker + 1] = m
	if beste == nil or lengde > beste then beste = lengde end
	videre( string.format( "%.2f m", lengde ) )
end

function scene:create( event )
	local grp = self.view
	local bakgrunn = sport.bakgrunn( grp )

	verden = display.newGroup()
	grp:insert( verden )
	sport.bakke( verden, -400, GROP1 + 1200 )
	-- gropa: myk, lys jord
	local grop = display.newRect( verden, ( GROP0 + GROP1 ) / 2, sport.BAKKE_Y + 14, GROP1 - GROP0, 28 )
	grop:setFillColor( 0.55, 0.36, 0.2 )
	for m = 1, 10 do
		sport.merke( verden, BRETT + m * sport.PX_PER_M, m .. "" )
	end
	for m = 10, 30, 10 do
		sport.merke( verden, BRETT - m * sport.PX_PER_M, "-" .. m .. " m" )
	end
	-- planken: hvit stripe
	local brett = display.newRect( verden, BRETT - 9, sport.BAKKE_Y + 14, 18, 28 )
	brett:setFillColor( 0.92, 0.9, 0.84 )
	sport.tekst( verden, "Board", BRETT - 9, sport.BAKKE_Y - 62, 16 )

	mark = sport.mark( verden )
	mark.y = sport.BAKKE_Y - sport.R
	pil = display.newRect( verden, 0, 0, 90, 5 )
	pil.anchorX = 0
	pil:setFillColor( 0.95, 0.85, 0.7 )
	merker = {}

	sport.tekst( grp, "Long jump", sport.B / 2, 30, 30 )
	status = sport.tekst( grp, "", sport.B / 2, 68, 22, { 0.92, 0.9, 0.86 } )
	info = sport.tekst( grp, "", sport.B / 2, 130, 22 )
	fart = sport.fartsmaler( grp )

	sport.trykkflate( grp, {
		trykk = function()
			if tilstand == "klar" then
				tilstand = "loper"
				info.text = ""
				v = sport.gass( v )
			elseif tilstand == "loper" then
				v = sport.gass( v )
			end
		end,
		hold = function()
			if tilstand == "loper" then
				tilstand = "lader"
				vinkel, vinkelRetning = 0, 1
				mark:strekk( true )
				pil.isVisible = true
			end
		end,
		slipp = function()
			if tilstand == "lader" then hopp() end
		end,
	} )
	sport.tilbake( grp )
	forsok = 1
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
				vinkel = vinkel + vinkelRetning * 95 * dt
				if vinkel > 70 then vinkel, vinkelRetning = 70, -1 end
				if vinkel < 0 then vinkel, vinkelRetning = 0, 1 end
			end
			if x + sport.R * 0.5 > BRETT + 20 then
				tilstand = "vent"
				overtrakk()
			elseif v <= 0 and tilstand == "loper" and x > START + 5 then
				-- stoppet helt opp før planken: prøv igjen
				v = 0
			end
		elseif tilstand == "flyr" then
			x = x + vx * dt
			h = h + vy * dt
			vy = vy - G * dt
			mark:rull( vx * dt )
			if h <= 0 then
				h = 0
				landet()
			end
		end
		mark.x = x
		mark.y = sport.BAKKE_Y - sport.R - h
		pil.x, pil.y = x, mark.y
		pil.rotation = -vinkel
		fart:sett( v / sport.VMAKS )
		verden.x = math.min( 0, -( x - 300 ) )
		bakgrunn:rull( -verden.x )
	end
	Runtime:addEventListener( "enterFrame", lytter )
end

function scene:hide( event )
	if event.phase == "will" then
		Runtime:removeEventListener( "enterFrame", lytter )
		tilstand = "borte"
	elseif event.phase == "did" then
		composer.removeScene( "scenes.mini_lengdehopp" )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )

return scene
