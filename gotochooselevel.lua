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

 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
-- local function reload( )
    
--    composer.gotoScene( "chooselevel",{effect = "fade" , time = 3000}) 
-- end
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
local function goto( event )
    --last:play()

        composer.gotoScene( "chooselevel",{effect = "fade" , time = 500})  


end

function scene:create( event )

    local sceneGroup = self.view
   print ("gotochooselevel scene:create did")

 --local abc display.newImage( "loading.png",1920,1080 )


grp=sceneGroup



    local sheetData =  { width = 1200 , height= 540, count = 6 , numFrames = 6, sheetContentWidth = 3600, sheetContentHeight = 1080 }
    local spriteSheet = graphics.newImageSheet("last.png" , sheetData)
 
    local sequenceData = { 
    {name = "lastlast", start = 1,  count=6, time=500, loopCount = 0 }
    }       
    
    last = display.newSprite (spriteSheet, sequenceData)

last.height = screenHeight
last.width  = screenWidth 
last.x = bredde/2
last.y = hoyde/2

    last:setSequence("lastlast")
    grp:insert(last)
    last:play()



end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        print ("gotochooselevel scene:show will")
    elseif ( phase == "did" ) then
        print ("gotochooselevel scene:show did")
--composer.removeScene( "level1" )
timer.performWithDelay( 1500, goto)

    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
       composer.removeScene( "gotochooselevel" )
print ("gotochooselevel scene:hide will")
    elseif ( phase == "did" ) then
print ("gotochooselevel scene:hide did")
   

    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view
    print ("gotochooselevel scene:destroy did")
 
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene