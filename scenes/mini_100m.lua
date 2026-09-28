-- Minispill: 100 m (lagt til 2026-09-28). Trykk fort for å rulle
-- fortere. Nedtelling først, og trykker man før "GO!" er det tyvstart.
-- En blek ring viser rekorden, så man ser om man ligger foran.

local composer = require( "composer" )
local sport = require( "lib.minisport" )

local scene = composer.newScene()

local START = 120
local LENGDE = 100 * sport.PX_PER_M
local MAAL = START + LENGDE

local tilstand, x, v, tid, sist
local verden, mark, spokelse, tidtekst, info, fart
local lytter

local function klar()
	tilstand = "klar"
	x, v, tid = START, 0, 0
	mark.x, mark.y = x, sport.BAKKE_Y - sport.R
	mark:strekk( false )
	if spokelse then spokelse.x = START end
	tidtekst.text = "0.00 s"
	info.text = "Tap to start. Then tap as fast as you can!"
end

local function tyvstart()
	tilstand = "tyvstart"
	info.text = "False start! Wait for GO."
	timer.performWithDelay( 1400, function()
		if tilstand == "tyvstart" then klar() end
	end )
end

local function nedtelling()
	tilstand = "nedtelling"
	local ord = { "Ready...", "Set...", "GO!" }
	for i, o in ipairs( ord ) do
		timer.performWithDelay( ( i - 1 ) * 700 + 1, function()
			if tilstand ~= "nedtelling" then return end
			info.text = o
			if i == #ord then
				tilstand = "loper"
				sist = system.getTimer()
			end
		end )
	end
end

local function ferdig()
	tilstand = "ferdig"
	local ny = sport.nyRekord( "100m", tid, false )
	local r = sport.rekord( "100m" )
	info.text = ""
	sport.resultat( scene.view, {
		{ "100 m", 30 },
		{ string.format( "Time: %.2f s", tid ), 28, { 0.92, 0.9, 0.86 } },
		{ ny and "New record!" or string.format( "Record: %.2f s", r ), 24 },
	}, function()
		if spokelse == nil then
			spokelse = sport.mark( verden )
			spokelse.alpha = 0.35
			spokelse.y = sport.BAKKE_Y - sport.R
		end
		klar()
	end )
end

function scene:create( event )
	local grp = self.view
	local bakgrunn = sport.bakgrunn( grp )

	verden = display.newGroup()
	grp:insert( verden )
	sport.bakke( verden, -400, MAAL + 1200 )
	for m = 0, 100, 10 do
		sport.merke( verden, START + m * sport.PX_PER_M, m .. " m" )
	end
	-- mållinje: en lys stripe og en stein med "Finish"
	local linje = display.newRect( verden, MAAL, sport.BAKKE_Y + 14, 10, 28 )
	linje:setFillColor( 0.85, 0.8, 0.7 )
	local skilt = display.newImageRect( verden, "pausemenu.png", 150, 70 )
	skilt.x, skilt.y = MAAL, sport.BAKKE_Y - 110
	sport.tekst( verden, "Finish", MAAL, sport.BAKKE_Y - 110, 22 )

	if sport.rekord( "100m" ) then
		spokelse = sport.mark( verden )
		spokelse.alpha = 0.35
		spokelse.y = sport.BAKKE_Y - sport.R
	end
	mark = sport.mark( verden )

	sport.tekst( grp, "100 m", sport.B / 2, 30, 30 )
	tidtekst = sport.tekst( grp, "0.00 s", sport.B / 2, 68, 26, { 0.92, 0.9, 0.86 } )
	info = sport.tekst( grp, "", sport.B / 2, 130, 24 )
	fart = sport.fartsmaler( grp )

	sport.trykkflate( grp, {
		trykk = function()
			if tilstand == "klar" then
				nedtelling()
			elseif tilstand == "nedtelling" then
				tyvstart()
			elseif tilstand == "loper" then
				v = sport.gass( v )
			end
		end,
	} )
	sport.tilbake( grp )
	klar()

	lytter = function()
		local naa = system.getTimer()
		local dt = sist and math.min( 0.05, ( naa - sist ) / 1000 ) or 0
		sist = naa
		if tilstand == "loper" then
			tid = tid + dt
			v = sport.brems( v, dt )
			x = x + v * dt
			mark:rull( v * dt )
			if spokelse then
				spokelse.x = math.min( MAAL, START + LENGDE * tid / sport.rekord( "100m" ) )
				spokelse:rull( LENGDE / sport.rekord( "100m" ) * dt )
			end
			if x >= MAAL then
				tid = tid - ( x - MAAL ) / math.max( v, 1 )
				x = MAAL
				ferdig()
			end
			tidtekst.text = string.format( "%.2f s", tid )
		end
		mark.x = x
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
		spokelse = nil
		composer.removeScene( "scenes.mini_100m" )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )

return scene
