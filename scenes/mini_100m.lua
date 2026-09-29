-- Minispill: 100 m (lagt til 2026-09-28, ekte markfysikk fra samme dag).
-- En nedoverløype i hulen med to trange istunneler og en liten sprekk.
-- Marken ruller av seg selv (den ruller fortest når man lar den være),
-- men ringen setter seg fast i tunnelene: gjør den slapp med
-- dobbelttrykk rett før tunnelen, så glir den gjennom på isen, og gjør
-- den stram igjen med ett trykk etterpå. Nedtelling først; trykker man
-- før "GO!" er det tyvstart.
--
-- Målt i en kopi av fysikken (se KODEBASE.md): ringen står fast i
-- tunneler med 30-60 px klaring og kommer ikke løs igjen, slapp glir
-- gjennom hvis man trykker 200-300 px før tunnelen. God timing gir ca.
-- 21-24 s. 50 px = 1 m.

local composer = require( "composer" )
local physics = require( "physics" )
local sport = require( "lib.minisport" )
local markfysikk = require( "lib.markfysikk" )

local scene = composer.newScene()

local GRADER = 20
local TAN = math.tan( math.rad( GRADER ) )
local PX_PER_M = 50
local START = -108                    -- midten av marken ved start
local MAAL = START + 100 * PX_PER_M
local SPREKK, SPREKK_B, SPREKK_FALL = 2700, 90, 40
local TUNNELER = { { 1500, 500, 45 }, { 3700, 500, 40 } }  -- x, lengde, klaring

local function bakkeY( x )
	local y = x * TAN + 230
	if x > SPREKK then y = y + SPREKK_FALL end
	return y
end

local tilstand, mark, tid, fastTid
local verden, bakgrunn, tidtekst, info, status
local lytter

local function nyMark()
	if mark then mark:fjern() end
	mark = markfysikk.lag( verden, 0, 0 )
end

local function visStatus()
	local r = sport.rekord( "100m_fysikk" )
	status.text = r and string.format( "Record: %.2f s", r ) or "Record: -"
end

local function klar()
	tilstand = "klar"
	physics.pause()
	nyMark()
	tid, fastTid = 0, 0
	tidtekst.text = "0.00 s"
	info.text = "Tap to start. Double tap before the icy tunnels to slide through, tap once after."
	visStatus()
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
				tilstand = "lop"
				physics.start()
				timer.performWithDelay( 900, function()
					if tilstand == "lop" and info.text == "GO!" then info.text = "" end
				end )
			end
		end )
	end
end

local function ferdig( fullfort, tekst )
	tilstand = "ferdig"
	local linjer = { { "100 m", 30 } }
	if fullfort then
		local ny = sport.nyRekord( "100m_fysikk", tid, false )
		linjer[2] = { string.format( "Time: %.2f s", tid ), 28, { 0.92, 0.9, 0.86 } }
		linjer[3] = { ny and "New record!" or string.format( "Record: %.2f s", sport.rekord( "100m_fysikk" ) ), 24 }
	else
		linjer[2] = { tekst, 26, { 0.92, 0.9, 0.86 } }
	end
	info.text = ""
	sport.resultat( scene.view, linjer, klar )
end

function scene:create( event )
	local grp = self.view
	physics.start()
	bakgrunn = sport.bakgrunn( grp )

	verden = display.newGroup()
	grp:insert( verden )
	verden.xScale, verden.yScale = sport.SKALA, sport.SKALA

	-- bakken: stein, is i tunnelene, en sprekk
	local function strekning( a, b, is )
		if b <= a then return end
		local pkt = {}
		local n = math.max( 1, math.floor( ( b - a ) / 200 ) )
		for i = 0, n do
			local x = a + ( b - a ) * i / n
			pkt[#pkt + 1] = { x, bakkeY( x ) }
		end
		sport.terreng( verden, pkt, { is = is } )
	end
	strekning( -300, TUNNELER[1][1] - 150 )
	strekning( TUNNELER[1][1] - 150, TUNNELER[1][1] + TUNNELER[1][2] + 50, true )
	strekning( TUNNELER[1][1] + TUNNELER[1][2] + 50, SPREKK )
	strekning( SPREKK + SPREKK_B, TUNNELER[2][1] - 150 )
	strekning( TUNNELER[2][1] - 150, TUNNELER[2][1] + TUNNELER[2][2] + 50, true )
	strekning( TUNNELER[2][1] + TUNNELER[2][2] + 50, MAAL + 3000 )
	-- tak over tunnelene, med is på undersiden
	for _, t in ipairs( TUNNELER ) do
		local tak = {}
		for i = 0, 20 do
			local x = t[1] - 250 + ( t[2] + 300 ) * i / 20
			local k = t[3] + 250 * ( math.abs( i - 10 ) / 10 ) ^ 2
			tak[#tak + 1] = { x, bakkeY( x ) - k }
		end
		sport.terreng( verden, tak, { opp = true, is = true } )
	end
	for m = 0, 100, 10 do
		local x = START + m * PX_PER_M
		sport.merke( verden, x, bakkeY( x ), m .. " m", 34 )
	end
	-- mål
	local linje = display.newRect( verden, MAAL, bakkeY( MAAL ) + 10, 20, 40 )
	linje:setFillColor( 0.92, 0.9, 0.84 )
	linje.rotation = GRADER
	local skilt = display.newImageRect( verden, "pausemenu.png", 300, 140 )
	skilt.x, skilt.y = MAAL, bakkeY( MAAL ) - 260
	sport.tekst( verden, "Finish", MAAL, bakkeY( MAAL ) - 260, 48 )

	sport.tekst( grp, "100 m", sport.B / 2, 30, 30 )
	tidtekst = sport.tekst( grp, "0.00 s", sport.B / 2, 66, 26, { 0.92, 0.9, 0.86 } )
	status = sport.tekst( grp, "", sport.B - 110, 30, 18, { 0.85, 0.85, 0.85 } )
	info = sport.tekst( grp, "", sport.B / 2, 108, 19 )

	sport.trykkflate( grp, function() return mark end, function()
		if tilstand == "klar" then
			nedtelling()
			return false
		elseif tilstand == "nedtelling" then
			tyvstart()
			return false
		end
		return tilstand == "lop"
	end )
	sport.tilbake( grp )
	klar()
	do
		local sx, sy = mark:senter()
		verden.x = sport.B * 0.35 - sx * sport.SKALA
		verden.y = sport.H * 0.55 - sy * sport.SKALA
	end

	local sist = system.getTimer()
	lytter = function()
		local naa = system.getTimer()
		local dt = math.min( 0.05, ( naa - sist ) / 1000 )
		sist = naa
		if not mark then return end
		-- sentrum av hele marken, ikke én del: den går rundt i ringen
		local mx, my = mark:senter()
		if not mx then return end
		if tilstand == "lop" then
			tid = tid + dt
			tidtekst.text = string.format( "%.2f s", tid )
			if mark:fart() < 8 then fastTid = fastTid + dt else fastTid = 0 end
			-- Står ringen fast i en tunnel, kommer den ikke løs igjen (målt),
			-- så da er løpet over. Slapp marke stopper på steinen etter
			-- tunnelen til den gjøres stram.
			if mark:erSlapp() and fastTid > 1 then
				info.text = "Tap once to make the worm firm again."
			elseif info.text ~= "GO!" then
				info.text = ""
			end
			if not mark:erSlapp() and fastTid > 2.5 then
				ferdig( false, "Stuck! Go limp just before the tunnel." )
			elseif mark:erSlapp() and fastTid > 8 then
				ferdig( false, "The worm stopped." )
			elseif mx >= MAAL then
				ferdig( true )
			elseif my > bakkeY( mx ) + 500 then
				ferdig( false, "The worm fell into the crack." )
			end
		end
		sport.kamera( verden, bakgrunn, mx, my, 0.35, 0.55 )
	end
	Runtime:addEventListener( "enterFrame", lytter )
end

function scene:hide( event )
	if event.phase == "will" then
		Runtime:removeEventListener( "enterFrame", lytter )
		tilstand = "borte"
	elseif event.phase == "did" then
		mark = nil
		physics.start()
		composer.removeScene( "scenes.mini_100m" )
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )

return scene
