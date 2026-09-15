local composer = require( "composer" )

local scene = composer.newScene()

local widget = require ("widget")

widget.setTheme ( "widget_theme_ios")
local liv = require("lib.liv")

local bredde = display.contentWidth
local hoyde = display.contentHeight
local centerX = display.contentCenterX
local centerY = display.contentCenterY

-- -----------------------------------------------------------------------------------
-- Ny fil, 2026-09-15. Vist når spilleren trykker retry (fra pausemeny
-- eller dødsmeny) mens liv.erTom() er sann, i stedet for at koden bare
-- gikk rett til "scenes.gotolevel1" (start på nytt fra bane 1) uten noen
-- vei tilbake til liv. Dette er akkurat skjermen Ørjan beskrev i svaret
-- sitt (se sporsmal.md spørsmål 1): kort reklame gir ett liv, lang
-- reklame gir flere, og den som ikke vil se reklame kan fortsatt starte
-- på nytt fra bane 1 som før.
--
-- Utvidet 2026-09-15 (Mathias: "Legg til på reklameskjermen at man kan
-- kjøpe liv om man ikke vil se reklame. Legg til diverse pakker"), så
-- skjermen nå har tre veier videre: se reklame, kjøpe forsøk, eller
-- starte på nytt fra bane 1.
--
-- ALT SOM KOSTER ELLER GIR NOE ER PLACEHOLDER:
--
--   * Reklamen er en nedtelling med tekst, ikke en ekte video-annonse.
--     Bytt ut visReklamePlaceholder() med et ekte SDK-kall når et
--     reklame-SDK er på plass.
--   * Kjøpene er en bekreft/avbryt-boks som tydelig sier at ingen
--     betaling skjer. Bytt ut visKjopPlaceholder() med et ekte
--     kjøp (i Solar2D: "store"-biblioteket mot Google Play / App Store)
--     når produktene er opprettet der.
--
-- I begge tilfellene er resten av flyten ferdig kodet og skal kunne stå
-- urørt: legg til forsøk (liv.addToScore), lagre (liv.lagreliv), og gå
-- videre til banen via mellomscenen "gotoretry".
--
-- Prisene under er også placeholder-tall, ikke noe som er avklart med
-- noen butikk ennå.
-- -----------------------------------------------------------------------------------

local KORT_REKLAME_SEKUNDER = 3
local KORT_REKLAME_LIV = 1
local LANG_REKLAME_SEKUNDER = 6
local LANG_REKLAME_LIV = 3

-- Kjøpspakkene. "id" er ment å matche produkt-ID-en i butikken den
-- dagen ekte kjøp kobles på, så resten av koden slipper å endres.
local PAKKER = {
	{ id = "forsok_10",  forsok = 10,  pris = "15 kr", farge = { 0.45, 0.30, 0.62 } },
	{ id = "forsok_25",  forsok = 25,  pris = "29 kr", farge = { 0.38, 0.26, 0.58 } },
	{ id = "forsok_100", forsok = 100, pris = "79 kr", farge = { 0.60, 0.44, 0.12 } },
}

-- Layout. Innholdsflaten er 540 x 960, så alt må få plass innenfor det.
local KNAPP_BREDDE = 520
local KNAPP_HOYDE = 90
local KNAPP_AVSTAND = 100

function scene:create( event )
	local sceneGroup = self.view
	print ("adoffer scene:create did")

	local bg = display.newRect( centerX, centerY, bredde, hoyde )
	bg:setFillColor( 0, 0, 0, 0.88 )
	sceneGroup:insert( bg )

	local knappGruppe = display.newGroup()
	sceneGroup:insert( knappGruppe )

	local overlayGruppe = display.newGroup()
	sceneGroup:insert( overlayGruppe )

	local function lagTekst( y, tekst, storrelse, gruppe )
		local t = display.newText( { text = tekst, x = centerX, y = y, font = native.systemFontBold, fontSize = storrelse, width = KNAPP_BREDDE, align = "center" } )
		t:setFillColor( 1, 1, 1 )
		gruppe:insert( t )
		return t
	end

	local function lagKnapp( y, tekst, farge )
		local knapp = display.newRoundedRect( centerX, y, KNAPP_BREDDE, KNAPP_HOYDE, 16 )
		knapp:setFillColor( farge[1], farge[2], farge[3] )
		knappGruppe:insert( knapp )
		local label = display.newText( { text = tekst, x = centerX, y = y, font = native.systemFontBold, fontSize = 28, width = KNAPP_BREDDE - 40, align = "center" } )
		label:setFillColor( 1, 1, 1 )
		knappGruppe:insert( label )
		return knapp
	end

	-- Ordlyd endret 2026-09-15 fra "liv" til "forsøk", så den henger sammen
	-- med livtelleren i banene: den viser nå hvor mange forsøk du har igjen
	-- ETTER det du holder på med (se lib/liv.lua), altså 0 på siste forsøk.
	-- Med den visningen ville "+1 liv" her sett ut som om ingenting skjedde
	-- (telleren står på 0 både før og under det ekstra forsøket), mens
	-- "+1 forsøk" stemmer nøyaktig: du får ett forsøk til.
	lagTekst( 140, "Ingen forsøk igjen", 46, knappGruppe )

	lagTekst( 196, "Se reklame", 26, knappGruppe )
	local kortKnapp = lagKnapp( 265, "Kort reklame (+" .. KORT_REKLAME_LIV .. " forsøk)", { 0.16, 0.5, 0.2 } )
	local langKnapp = lagKnapp( 265 + KNAPP_AVSTAND, "Lang reklame (+" .. LANG_REKLAME_LIV .. " forsøk)", { 0.16, 0.4, 0.6 } )

	lagTekst( 432, "Eller kjøp forsøk, uten reklame", 26, knappGruppe )
	local pakkeKnapper = {}
	for i, pakke in ipairs( PAKKER ) do
		local y = 500 + (i - 1) * KNAPP_AVSTAND
		pakkeKnapper[i] = lagKnapp( y, pakke.forsok .. " forsøk  -  " .. pakke.pris, pakke.farge )
	end

	local avKnapp = lagKnapp( 830, "Fortsett uten (start fra bane 1)", { 0.4, 0.16, 0.16 } )

	-- Felles for de to placeholder-boksene under: tømmer overlay-gruppa og
	-- legger en ugjennomsiktig flate over hele skjermen, så man ikke kan
	-- trykke på knappene bak mens noe pågår.
	local function nyttOverlay()
		knappGruppe.isVisible = false
		for i = overlayGruppe.numChildren, 1, -1 do
			display.remove( overlayGruppe[i] )
		end
		local flate = display.newRect( centerX, centerY, bredde, hoyde )
		flate:setFillColor( 0, 0, 0, 1 )
		overlayGruppe:insert( flate )
	end

	local function lukkOverlay()
		for i = overlayGruppe.numChildren, 1, -1 do
			display.remove( overlayGruppe[i] )
		end
		knappGruppe.isVisible = true
	end

	-- Gir spilleren forsøkene og sender hen tilbake i banen. Felles
	-- sluttpunkt for både reklame og kjøp.
	local function giForsokOgFortsett( antall )
		liv.addToScore( antall )
		liv.lagreliv()
		local ok, err = pcall( composer.gotoScene, "scenes.gotoretry", { effect = "fade", time = 500 } )
		if not ok then
			print( "CRASH going to gotoretry (adoffer): " .. tostring(err) )
		end
	end

	-- PLACEHOLDER for ekte reklame-SDK, se forklaring øverst i fila.
	local function visReklamePlaceholder( sekunder, forsokBelonning )
		nyttOverlay()
		lagTekst( centerY - 40, "REKLAME (placeholder)", 34, overlayGruppe )
		local nedtelling = lagTekst( centerY + 40, tostring(sekunder), 60, overlayGruppe )

		local igjen = sekunder
		local function tikk()
			igjen = igjen - 1
			if igjen <= 0 then
				giForsokOgFortsett( forsokBelonning )
			else
				nedtelling.text = tostring(igjen)
			end
		end
		timer.performWithDelay( 1000, tikk, sekunder )
	end

	-- PLACEHOLDER for ekte kjøp, se forklaring øverst i fila. Her skal
	-- store.purchase( pakke.id ) inn den dagen produktene finnes i
	-- Google Play / App Store, med giForsokOgFortsett() i svar-lytteren.
	local function visKjopPlaceholder( pakke )
		nyttOverlay()
		lagTekst( centerY - 210, "KJØP (placeholder)", 34, overlayGruppe )
		lagTekst( centerY - 140, pakke.forsok .. " forsøk for " .. pakke.pris, 40, overlayGruppe )
		lagTekst( centerY - 60, "Ingen betaling er koblet til spillet ennå.\nTrykker du bekreft får du forsøkene gratis.", 24, overlayGruppe )

		local bekreft = display.newRoundedRect( centerX, centerY + 60, KNAPP_BREDDE, KNAPP_HOYDE, 16 )
		bekreft:setFillColor( 0.16, 0.5, 0.2 )
		overlayGruppe:insert( bekreft )
		lagTekst( centerY + 60, "Bekreft", 30, overlayGruppe )

		local avbryt = display.newRoundedRect( centerX, centerY + 170, KNAPP_BREDDE, KNAPP_HOYDE, 16 )
		avbryt:setFillColor( 0.35, 0.35, 0.38 )
		overlayGruppe:insert( avbryt )
		lagTekst( centerY + 170, "Avbryt", 30, overlayGruppe )

		bekreft:addEventListener( "tap", function()
			giForsokOgFortsett( pakke.forsok )
			return true
		end )
		avbryt:addEventListener( "tap", function()
			lukkOverlay()
			return true
		end )
	end

	kortKnapp:addEventListener( "tap", function()
		visReklamePlaceholder( KORT_REKLAME_SEKUNDER, KORT_REKLAME_LIV )
		return true
	end )
	langKnapp:addEventListener( "tap", function()
		visReklamePlaceholder( LANG_REKLAME_SEKUNDER, LANG_REKLAME_LIV )
		return true
	end )
	for i, pakke in ipairs( PAKKER ) do
		pakkeKnapper[i]:addEventListener( "tap", function()
			visKjopPlaceholder( pakke )
			return true
		end )
	end
	avKnapp:addEventListener( "tap", function()
		-- Lagt til 2026-09-15, per Mathias: å starte helt på nytt fra
		-- bane 1 bør gi fulle liv igjen, ikke fortsatt stå med 0.
		liv.new()
		liv.lagreliv()
		local ok, err = pcall( composer.gotoScene, "scenes.gotolevel1", { effect = "fade", time = 500 } )
		if not ok then
			print( "CRASH going to gotolevel1 (adoffer): " .. tostring(err) )
		end
		return true
	end )
end


-- "scene:show()"
function scene:show( event )
	local phase = event.phase
	if ( phase == "will" ) then
		print ("adoffer scene:show will")
	elseif ( phase == "did" ) then
		print ("adoffer scene:show did")
	end
end


-- "scene:hide()"
function scene:hide( event )
	local phase = event.phase
	if ( phase == "will" ) then
		print ("adoffer scene:hide will")
	elseif ( phase == "did" ) then
		composer.removeScene( "scenes.adoffer" )
		print ("adoffer scene:hide did")
	end
end


-- "scene:destroy()"
function scene:destroy( event )
	print ("adoffer scene:destroy did")
end


-- -------------------------------------------------------------------------------

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene
