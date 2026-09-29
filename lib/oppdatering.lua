-- Varsel når en ny versjon av spillet er publisert (lagt til 2026-09-29).
--
-- Byggingen legger commit-ID-en både inn i spillet (lib/byggversjon.lua)
-- og i versjon.txt på nettsiden. Mens spillet kjører, henter vi
-- versjon.txt hvert SJEKK sekund. Er den en annen enn den som kjører,
-- ligger det en oppdatering klar, og en liten steinlapp vises nede i
-- venstre hjørne, der den ikke er i veien for banen. Trykk på lappen
-- skjuler den. Den nye versjonen lastes når siden lastes på nytt.
--
-- Startes én gang fra main.lua: require( "lib.oppdatering" ).start()

local M = {}

local URL = "https://thurbohnek.github.io/Roller/versjon.txt"
local SJEKK = 120 -- sekunder mellom hver sjekk

local denne = require( "lib.byggversjon" )
local lapp = nil
local skjult = false

local function visLapp()
	if lapp or skjult then
		if lapp then lapp:toFront() end
		return
	end
	lapp = display.newGroup()
	local x = display.screenOriginX + 150
	local y = display.screenOriginY + display.actualContentHeight - 38
	local stein = display.newImageRect( lapp, "pausemenu.png", 280, 62 )
	stein.x, stein.y = x, y
	stein.alpha = 0.92
	local t = display.newText( { parent = lapp, text = "Update ready!\nReload the page to play it.",
		x = x, y = y, width = 250, font = native.systemFontBold, fontSize = 14, align = "center" } )
	t:setFillColor( 0.95, 0.85, 0.7 )
	-- "touch" og ikke "tap": da tar lappen hele trykket, så det ikke også
	-- styrer marken (banene lytter på touch for hele skjermen)
	lapp:addEventListener( "touch", function( e )
		if e.phase == "ended" then
			skjult = true
			display.remove( lapp )
			lapp = nil
		end
		return true
	end )
end

local function sjekk()
	network.request( URL .. "?t=" .. os.time(), "GET", function( e )
		if e.isError or not e.response then return end
		local ny = tostring( e.response ):match( "^%s*(%x+)%s*$" )
		if ny and #ny >= 7 and ny ~= denne then
			visLapp()
		end
	end )
end

function M.start()
	if denne == "lokal" then
		return
	end
	timer.performWithDelay( 20000, sjekk )
	timer.performWithDelay( SJEKK * 1000, sjekk, 0 )
end

return M
