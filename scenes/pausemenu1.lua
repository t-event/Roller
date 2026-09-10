local composer = require( "composer" )

local scene = composer.newScene()

local widget = require ("widget")

widget.setTheme ( "widget_theme_ios")
local physicsData = (require "lib.shapedefs").physicsData(scaleFactor)
local physics = require( "physics" )
--physics.setDrawMode( "hybrid" )
local perspective = require ("lib.perspective")
local scaleFactor = 1.0
local bredde = display.contentWidth
local hoyde = display.contentHeight
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenLeft = display.screenOriginX
local screenWidth = display.viewableContentWidth - screenLeft * 2
local screenRight = screenLeft + screenWidth
local screenTop = display.screenOriginY
local screenHeight = display.viewableContentHeight - screenTop * 2
local screenBottom = screenTop + screenHeight
local gameUI =require("lib.gameUI")
local lm = require("lib.ogt_levelmanager")
local pausemenu = require("scenes.level1")
local liv =require("lib.liv")

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------


local function goSomewhere (event)
local goto = event.target.id
local options = {effect = "slideRight" , time = 500}
composer.gotoScene( goto, options )
end



-- "scene:create()"
function scene:create( event )
local sceneGroup = self.view
print ("pausemenu scene:create did")
grp=sceneGroup


  local pausemenu = display.newImageRect( "pausemenu.png",600,300)
  pausemenu.x = bredde/2
  pausemenu.y = hoyde/2
  pausemenu.alpha=1
  grp:insert(pausemenu)

  local pausemenumainmenu = display.newImageRect( "pausemenumainmenu.png",109,45)
  pausemenumainmenu.x = pausemenu.x-142
  pausemenumainmenu.y = pausemenu.y-30
  pausemenumainmenu.alpha=1
  grp:insert(pausemenumainmenu)

  local pausemenuretry = display.newImageRect( "pausemenuretry.png",109,45)
  pausemenuretry.x = pausemenu.x
  pausemenuretry.y = pausemenu.y-30
  pausemenuretry.alpha=1
  grp:insert(pausemenuretry)

  local pausemenusound = display.newImageRect( "pausemenusound.png",109,45)
  pausemenusound.x = pausemenu.x+142
  pausemenusound.y = pausemenu.y-30
  pausemenusound.alpha=1
  grp:insert(pausemenusound)

  local pausemenulevels = display.newImageRect( "pausemenulevels.png",109,45)
  pausemenulevels.x = pausemenu.x-142
  pausemenulevels.y = pausemenu.y+48
  pausemenulevels.alpha=1
  grp:insert(pausemenulevels)

  local pausemenuresume = display.newImageRect( "pausemenuresume.png",109,45)
  pausemenuresume.x = pausemenu.x
  pausemenuresume.y = pausemenu.y+48
  pausemenuresume.alpha=1
  grp:insert(pausemenuresume)

  local pausemenuquit = display.newImageRect( "pausemenuquit.png",109,45)
  pausemenuquit.x = pausemenu.x+142
  pausemenuquit.y = pausemenu.y+48
  pausemenuquit.alpha=1
  grp:insert(pausemenuquit)








local function resume(event)

-- Ryddet bort 2026-09-10: trykk_knapp/onCollision/onCollision1 er lokale
-- variabler i banefilen (level1.lua osv), usynlige herfra. Disse
-- removeEventListener-kallene har dermed aldri fjernet noe i praksis
-- (refererte en udefinert global). Selve opprydningen skjer riktig i
-- banens egen scene:hide når composer.removeScene() under tvinger den
-- gjennom.

-- Avbryt ventende transitions HER, med en gang retry trykkes, i stedet
-- for å stole på at banen sin egen scene:hide rekker det i tide
-- (rettet 2026-09-10, transition.cancel() i scene:hide sin "did"-fase
-- var IKKE tidsnok: den fasen skjer først når hele overgangs-fadeen
-- til gotoretry er ferdig (500ms), og en ventende støveffekt fra
-- level1.lua kan fyre av sitt onComplete midt i den fadeen, altså FØR
-- did-fasen rekker å avbryte den. transition.cancel() uten argumenter
-- er globalt og trenger ikke tilgang til banens egne lokale variabler.
transition.cancel()

timer.cancel(eventTimer)
print("Current Score1: ", liv.returnScore())
print("Current Score2: ", liv.returnScore())
liv.endreliv( 1 )
print("Current Score3: ", liv.returnScore())
print("Current Score4: ", liv.returnScore())
print("Current Score5: ", liv.returnScore())
liv.lagreliv()
-- Går via en liten mellomscene i stedet for å rive ned/laste banen
-- direkte herfra (rettet 2026-09-10, krasjet fortsatt etter forrige
-- forsøk med hideOverlay()+removeScene() rett i denne funksjonen: å
-- rive ned banen som fortsatt er den aktive scenen mens denne
-- pausemenyen ligger som overlay oppå den er ikke en støttet
-- rekkefølge i Composer, uansett rekkefølge på
-- hideOverlay/removeScene/gotoScene). "scenes.gotoretry" gjør en helt
-- vanlig gotoScene (som Composer selv skjuler denne overlayen trygt
-- for), og river først ned/laster banen på nytt når den mellomscenen
-- faktisk er den aktive, uten overlay oppå seg. Samme mønster som
-- "scenes.gotolevel1" under, som allerede gjorde dette trygt for
-- "ingen liv igjen"-tilfellet.
local target = "scenes.gotoretry"
if liv.erTom() then
	-- Ingen liv igjen. Reklame-for-liv er ikke bygget ennå (krever et
	-- annonse-SDK), så inntil videre: den som ikke vil/kan se reklame
	-- starter på nytt fra bane 1 i stedet for gjeldende bane.
	target = "scenes.gotolevel1"
end
local ok, err = pcall( composer.gotoScene, target, {effect = "fade" , time = 500} )
if not ok then
	local msg = "Checkpoint: " .. tostring(_G.LAST_CHECKPOINT) .. "\n" .. tostring(err)
	print( "CRASH going to " .. tostring(target) .. " (retry): " .. msg )
	local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth - 20, display.contentHeight - 20 )
	bg:setFillColor( 0, 0, 0, 0.85 )
	local t = display.newText( { text = msg, x = display.contentCenterX, y = display.contentCenterY, width = display.contentWidth - 40, font = native.systemFont, fontSize = 14, align = "left" } )
	t:setFillColor( 1, 0.3, 0.3 )
end
  pausemenu.alpha=0
--composer.gotoScene( "scenes.level1" ,{effect = "zoomOutInRotate" , time = 400})
physics.start( )
--Runtime:addEventListener( "touch", trykk_knapp)
--Runtime:addEventListener( "tap", trykk_knapp)
--knapp1.alpha = 1
end
pausemenuretry:addEventListener ("touch", resume)


local function resume1(event)
pausemenu.alpha=0
-- Ryddet bort 2026-09-10: trykk_knapp/onCollision/onCollision1 er lokale
-- variabler i banefilen (level1.lua osv), usynlige herfra. Disse
-- removeEventListener-kallene har dermed aldri fjernet noe i praksis
-- (refererte en udefinert global). Selve opprydningen skjer riktig i
-- banens egen scene:hide når composer.removeScene() under tvinger den
-- gjennom.
timer.cancel(eventTimer)
local ok, err = pcall( composer.gotoScene, "scenes.gotomenu", {effect = "fade" , time = 1} )
if not ok then
	local msg = "Checkpoint: " .. tostring(_G.LAST_CHECKPOINT) .. "\n" .. tostring(err)
	print( "CRASH going to gotomenu: " .. msg )
	local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth - 20, display.contentHeight - 20 )
	bg:setFillColor( 0, 0, 0, 0.85 )
	local t = display.newText( { text = msg, x = display.contentCenterX, y = display.contentCenterY, width = display.contentWidth - 40, font = native.systemFont, fontSize = 14, align = "left" } )
	t:setFillColor( 1, 0.3, 0.3 )
end
physics.start( )
print("Current Score1: ", liv.returnScore())
print("Current Score2: ", liv.returnScore())
liv.endreliv( 1 )
print("Current Score3: ", liv.returnScore())    
print("Current Score4: ", liv.returnScore())
print("Current Score5: ", liv.returnScore())
liv.lagreliv()
end
pausemenumainmenu:addEventListener ("touch", resume1)

local function resume2(event)
pausemenu.alpha=0
timer.cancel(eventTimer)
print("Current Score1: ", liv.returnScore())
print("Current Score2: ", liv.returnScore())
liv.endreliv( 1 )
print("Current Score3: ", liv.returnScore())    
print("Current Score4: ", liv.returnScore())
print("Current Score5: ", liv.returnScore())
liv.lagreliv()
native.requestExit()
end
pausemenuquit:addEventListener ("touch", resume2)


local function resume3(event)
pausemenu.alpha=0
-- Ryddet bort 2026-09-10: trykk_knapp/onCollision/onCollision1 er lokale
-- variabler i banefilen (level1.lua osv), usynlige herfra. Disse
-- removeEventListener-kallene har dermed aldri fjernet noe i praksis
-- (refererte en udefinert global). Selve opprydningen skjer riktig i
-- banens egen scene:hide når composer.removeScene() under tvinger den
-- gjennom.
timer.cancel(eventTimer)
local ok, err = pcall( composer.gotoScene, "scenes.gotochooselevel", {effect = "fade" , time = 1} )
if not ok then
	local msg = "Checkpoint: " .. tostring(_G.LAST_CHECKPOINT) .. "\n" .. tostring(err)
	print( "CRASH going to gotochooselevel: " .. msg )
	local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth - 20, display.contentHeight - 20 )
	bg:setFillColor( 0, 0, 0, 0.85 )
	local t = display.newText( { text = msg, x = display.contentCenterX, y = display.contentCenterY, width = display.contentWidth - 40, font = native.systemFont, fontSize = 14, align = "left" } )
	t:setFillColor( 1, 0.3, 0.3 )
end
physics.start( )
print("Current Score1: ", liv.returnScore())
print("Current Score2: ", liv.returnScore())
liv.endreliv( 1 )
print("Current Score3: ", liv.returnScore())    
print("Current Score4: ", liv.returnScore())
print("Current Score5: ", liv.returnScore())
liv.lagreliv()
end
pausemenulevels:addEventListener ("touch", resume3)

local function resume4(event)
composer.hideOverlay( "fade", 400 )
--knapp1.alpha = 1
physics.start( )
--del4:addEventListener( "collision" )

end
pausemenuresume:addEventListener ("touch", resume4)




--pausemenuretry:removeEventListener ("touch", resume)
--pausemenumainmenu:removeEventListener ("touch", resume1)
--pausemenuquit:removeEventListener ("touch", resume2)
--pausemenulevels:removeEventListener ("touch", resume3)
--pausemenuresume:removeEventListener ("touch", resume4)








end




-- "scene:show()"
function scene:show( event )
local sceneGroup = self.view
local phase = event.phase
if ( phase == "will" ) then
print ("pausemenu scene:show will")
elseif ( phase == "did" ) then
print ("pausemenu scene:show did")
end
end


-- "scene:hide()"
function scene:hide( event )
local sceneGroup = self.view
local phase = event.phase
if ( phase == "will" ) then
print ("pausemenu scene:hide will")
elseif ( phase == "did" ) then
print ("pausemenu scene:hide did")
composer.removeScene("pausemenu")
end
end


-- "scene:destroy()"
function scene:destroy( event )
local sceneGroup = self.view
print ("pausemenu scene:destroy did")
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene