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

Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener("collision", onCollision1)
timer.cancel(eventTimer)
local currentLevel = composer.getSceneName( "current" )
local ok, err = pcall( composer.gotoScene, currentLevel, {effect = "fade" , time = 1} )
if not ok then
	local msg = "Checkpoint: " .. tostring(_G.LAST_CHECKPOINT) .. "\n" .. tostring(err)
	print( "CRASH going to " .. tostring(currentLevel) .. " (retry): " .. msg )
	local bg = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth - 20, display.contentHeight - 20 )
	bg:setFillColor( 0, 0, 0, 0.85 )
	local t = display.newText( { text = msg, x = display.contentCenterX, y = display.contentCenterY, width = display.contentWidth - 40, font = native.systemFont, fontSize = 14, align = "left" } )
	t:setFillColor( 1, 0.3, 0.3 )
end
  pausemenu.alpha=0
--composer.gotoScene( "level1" ,{effect = "zoomOutInRotate" , time = 400}) 
physics.start( )
--Runtime:addEventListener( "touch", trykk_knapp)
--Runtime:addEventListener( "tap", trykk_knapp)
--knapp1.alpha = 1
print("Current Score1: ", liv.returnScore())
print("Current Score2: ", liv.returnScore())
liv.endreliv( 1 )
print("Current Score3: ", liv.returnScore())    
print("Current Score4: ", liv.returnScore())
print("Current Score5: ", liv.returnScore())
liv.lagreliv()
end
pausemenuretry:addEventListener ("touch", resume)


local function resume1(event)
pausemenu.alpha=0
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener("collision", onCollision1)
timer.cancel(eventTimer)
local ok, err = pcall( composer.gotoScene, "gotomenu", {effect = "fade" , time = 1} )
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
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener("collision", onCollision1)
timer.cancel(eventTimer)
local ok, err = pcall( composer.gotoScene, "gotochooselevel", {effect = "fade" , time = 1} )
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