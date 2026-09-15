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
-- Selve reklamen er en PLACEHOLDER: et par sekunders nedtelling med
-- tekst i stedet for en ekte video-annonse, siden det ikke finnes noe
-- reklame-SDK koblet til spillet ennå. Bytt ut visningen av
-- "reklame_placeholder" under med et ekte SDK-kall når det er på plass,
-- resten av flyten (legg til liv, lagre, gå til riktig bane) skal
-- kunne stå urørt.
-- -----------------------------------------------------------------------------------

local KORT_REKLAME_SEKUNDER = 3
local KORT_REKLAME_LIV = 1
local LANG_REKLAME_SEKUNDER = 6
local LANG_REKLAME_LIV = 3

function scene:create( event )
	local sceneGroup = self.view
	print ("adoffer scene:create did")

	local bg = display.newRect( centerX, centerY, bredde, hoyde )
	bg:setFillColor( 0, 0, 0, 0.88 )
	sceneGroup:insert( bg )

	local overskrift = display.newText( { text = "Ingen liv igjen", x = centerX, y = centerY - 260, font = native.systemFontBold, fontSize = 48 } )
	overskrift:setFillColor( 1, 1, 1 )
	sceneGroup:insert( overskrift )

	local function lagKnapp( y, tekst, farge )
		local knapp = display.newRoundedRect( centerX, y, 520, 110, 16 )
		knapp:setFillColor( farge[1], farge[2], farge[3] )
		sceneGroup:insert( knapp )
		local label = display.newText( { text = tekst, x = centerX, y = y, font = native.systemFontBold, fontSize = 30, width = 480, align = "center" } )
		label:setFillColor( 1, 1, 1 )
		sceneGroup:insert( label )
		return knapp, label
	end

	local kortKnapp, kortLabel = lagKnapp( centerY - 90, "Se kort reklame (+" .. KORT_REKLAME_LIV .. " liv)", { 0.16, 0.5, 0.2 } )
	local langKnapp, langLabel = lagKnapp( centerY + 50, "Se lang reklame (+" .. LANG_REKLAME_LIV .. " liv)", { 0.16, 0.4, 0.6 } )
	local avKnapp, avLabel     = lagKnapp( centerY + 190, "Fortsett uten (start fra bane 1)", { 0.4, 0.16, 0.16 } )

	local reklameGruppe = display.newGroup()
	sceneGroup:insert( reklameGruppe )
	reklameGruppe.isVisible = false

	local knappGruppe = display.newGroup()
	sceneGroup:insert( knappGruppe )
	knappGruppe:insert( overskrift )
	knappGruppe:insert( kortKnapp )
	knappGruppe:insert( kortLabel )
	knappGruppe:insert( langKnapp )
	knappGruppe:insert( langLabel )
	knappGruppe:insert( avKnapp )
	knappGruppe:insert( avLabel )

	-- PLACEHOLDER for ekte reklame-SDK, se forklaring øverst i fila.
	local function visReklamePlaceholder( sekunder, livBelonning )
		knappGruppe.isVisible = false
		reklameGruppe:removeSelf()
		reklameGruppe = display.newGroup()
		sceneGroup:insert( reklameGruppe )

		local reklameBg = display.newRect( centerX, centerY, bredde, hoyde )
		reklameBg:setFillColor( 0, 0, 0, 1 )
		reklameGruppe:insert( reklameBg )

		local reklameTekst = display.newText( { text = "REKLAME (placeholder)", x = centerX, y = centerY - 40, font = native.systemFontBold, fontSize = 34 } )
		reklameTekst:setFillColor( 1, 1, 1 )
		reklameGruppe:insert( reklameTekst )

		local nedtelling = display.newText( { text = tostring(sekunder), x = centerX, y = centerY + 40, font = native.systemFontBold, fontSize = 60 } )
		nedtelling:setFillColor( 1, 1, 1 )
		reklameGruppe:insert( nedtelling )

		local igjen = sekunder
		local function tikk()
			igjen = igjen - 1
			if igjen <= 0 then
				liv.addToScore( livBelonning )
				liv.lagreliv()
				local ok, err = pcall( composer.gotoScene, "scenes.gotoretry", { effect = "fade", time = 500 } )
				if not ok then
					print( "CRASH going to gotoretry (adoffer): " .. tostring(err) )
				end
			else
				nedtelling.text = tostring(igjen)
			end
		end
		timer.performWithDelay( 1000, tikk, sekunder )
	end

	kortKnapp:addEventListener( "tap", function()
		visReklamePlaceholder( KORT_REKLAME_SEKUNDER, KORT_REKLAME_LIV )
		return true
	end )
	langKnapp:addEventListener( "tap", function()
		visReklamePlaceholder( LANG_REKLAME_SEKUNDER, LANG_REKLAME_LIV )
		return true
	end )
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
