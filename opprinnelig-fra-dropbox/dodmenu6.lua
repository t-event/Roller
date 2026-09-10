local composer = require( "composer" )

local scene = composer.newScene()

local widget = require ("widget")

widget.setTheme ( "widget_theme_ios")
local physicsData = (require "shapedefs").physicsData(scaleFactor)
local physics = require( "physics" )
--physics.setDrawMode( "hybrid" )
local perspective = require ("perspective")
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
local gameUI =require("gameUI")
local lm = require("ogt_levelmanager")
local pausemenu = require("level1")
local liv =require("liv")

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
print ("dodmenu scene:create did")
grp=sceneGroup


  local pausemenu = display.newImageRect( "dodmenu.png",310,300)
  pausemenu.x = bredde/2
  pausemenu.y = hoyde/2
  pausemenu.alpha=1
  grp:insert(pausemenu)

  local pausemenumainmenu = display.newImageRect( "pausemenumainmenu.png",109,45)
  pausemenumainmenu.x = pausemenu.x
  pausemenumainmenu.y = pausemenu.y+60
  pausemenumainmenu.alpha=1
  grp:insert(pausemenumainmenu)

  local pausemenuretry = display.newImageRect( "pausemenuretry.png",109,45)
  pausemenuretry.x = pausemenu.x
  pausemenuretry.y = pausemenu.y-60
  pausemenuretry.alpha=1
  grp:insert(pausemenuretry)



  local pausemenulevels = display.newImageRect( "pausemenulevels.png",109,45)
  pausemenulevels.x = pausemenu.x
  pausemenulevels.y = pausemenu.y
  pausemenulevels.alpha=1
  grp:insert(pausemenulevels)


  








local function resume(event)

Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)
composer.gotoScene( "gotolevel1",{effect = "fade" , time = 1}) 
pausemenu.alpha=0
physics.start()
liv.endreliv(1)
liv.lagreliv()
end
pausemenuretry:addEventListener ("touch", resume)


local function resume1(event)
pausemenu.alpha=0
timer.cancel(eventTimer)
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)
composer.gotoScene( "gotomenu",{effect = "fade" , time = 1}) 
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




local function resume3(event)
pausemenu.alpha=0
timer.cancel(eventTimer)
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)
composer.gotoScene( "gotochooselevel",{effect = "fade" , time = 1}) 
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















end




-- "scene:show()"
function scene:show( event )
local sceneGroup = self.view
local phase = event.phase
if ( phase == "will" ) then
print ("dodmenu scene:show will")
elseif ( phase == "did" ) then
print ("dodmenu scene:show did")
end
end


-- "scene:hide()"
function scene:hide( event )
local sceneGroup = self.view
local phase = event.phase
if ( phase == "will" ) then
print ("dodmenu scene:hide will")
elseif ( phase == "did" ) then
print ("dodmenu scene:hide did")
composer.removeScene("dodmenu")
end
end


-- "scene:destroy()"
function scene:destroy( event )
local sceneGroup = self.view
print ("dodmenu scene:destroy did")
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene