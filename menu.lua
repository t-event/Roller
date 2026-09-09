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

local mark =require("mark")








-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------
    local function goSomewhere (event)
        local goto = event.target.id
        local options = {effect = "fade" , time = 1000}
        composer.gotoScene( goto, options )

end




-- "scene:create()"
function scene:create( event )
checkpoint("menu:create_start")

    local sceneGroup = self.view


    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

    
    
   
physics.start( )
--physics.setGravity( 0, 0 )
    camera = perspective.createView()
   
local hent = mark.hent 


    
  
    --local scaleFactor = 0.025
    --local scaleFactor = 0.1
    --local scaleFactor = 0.6
    grp=sceneGroup
    camera.xScale = scaleFactor
    camera.yScale = scaleFactor
checkpoint("menu:after_camera_scale")











----------------------------------------------------------------
     local bg1       = display.newImageRect( "background/bg1.png",2880,1620)
           bg1.width = 1920
           bg1.height= 1080
           bg1.x     = bredde/2
           bg1.y     = hoyde/2
grp:insert(bg1)
camera:add(bg1,5,false)
----------------------------------------------------------------
     local bg2       = display.newImageRect( "bg2.png",2880,1620)
           bg2.width = 1920
           bg2.height= 1080
           bg2.x     = bredde/2
           bg2.y     = hoyde/2
grp:insert(bg2)
camera:add(bg2,4,false)
----------------------------------------------------------------
     local bg3       = display.newImageRect( "bg3.png",2880,1620)
           bg3.width = 1920
           bg3.height= 1080
           bg3.x     = bredde/2
           bg3.y     = hoyde/2
grp:insert(bg3)
camera:add(bg3,3,false)
----------------------------------------------------------------
     local bg4       = display.newImageRect( "bg4.png",2880,1620)
           bg4.width = 1920
           bg4.height= 1080
           bg4.x     = bredde/2
           bg4.y     = hoyde/2
grp:insert(bg4)
camera:add(bg4,2,false)
----------------------------------------------------------------
     local bg5       = display.newImageRect( "bg5.png",5760,3240)
           bg5.width = 1920
           bg5.height= 1080
           bg5.x     = bredde/2
           bg5.y     = hoyde/2
         physics.addBody(bg5,"static", physicsData:get("bg5") )
grp:insert(bg5)
camera:add(bg5,1,false)
checkpoint("menu:after_backgrounds")
           

local storyknapp = display.newImageRect( "storyknapp.png",2880,1620 )
    storyknapp.width = 91
    storyknapp.height= 107
    storyknapp.x     = bredde/1.5
    storyknapp.y     = hoyde/2-30
    --physics.addBody(storyknapp,"dynamic", physicsData:get("storyknapp") )
grp:insert(storyknapp)
camera:add(storyknapp,1,false)
----------------------------------------------------------------

function lock( event )
    physics.addBody(storyknapp,"dynamic", physicsData:get("storyknapp") )
end


function goto( event )
   composer.gotoScene( "chooselevel",{effect = "slideUp" , time = 1000}) 
end
-----------------------------------------------------------------------------
    --local spillknapp = display.newRect( 50,500,100,100 )
    ----grp:insert(spillknapp)
   -- camera:add(spillknapp,1,true)
    
    local function spill( event)
        print ("trokk")
       lock()
      --lm.resetLevels(dataFile)
     -- camera:setFocus (bg5) 
      camera:setFocus( nil )
    
 timer.performWithDelay( 2000, goto)
    
    
    end
    storyknapp:addEventListener( "tap", spill )
    --storyknapp:addEventListener( "tap", hent )
checkpoint("menu:after_spill_listener")
------------------------------------------------------------------------------
  




local punkt = display.newRect( 400, 270, 10, 10 )
punkt.x=bredde/2
punkt.y=hoyde/2
punkt.alpha =0
punktsant = true
--grp:insert(punkt)
camera:add(punkt,1,false)
--punkt.isFixedRotation = true
--[[
local function onBackgroundTouch(event)
 if(event.phase == "began") then
 punkt.x = event.x
 punkt.y = event.y
 end
end
--]]

local function onBackgroundTouch(event)
 if(event.phase == "moved") then
 transition.to( punkt, { time=0, x=event.x, y=event.y, transition=easing.linear  } )
 end
end
bg5:addEventListener("touch", onBackgroundTouch)
checkpoint("menu:after_bg5_touch_listener")




    camera:setFocus( punkt)
    local levelWidth = camera:layer(5).width
    local levelHeight = camera:layer(5).height
    camera:setParallax( 1, 0.8, 0.6, 0.4, 0.2 )
    camera:setBounds(300, 700 , 100, 400)
    camera.damping = 10
    --camera.damping = 30
    camera:track()
    grp:insert(camera)
    camera:toBack()
    --camera:layer(5).parallaxRatio=0
    local sqCenterX, sqCenterY = punkt:localToContent( 0, 0 )
checkpoint("menu:after_camera_setup")
    











--[[
    local playBtn = widget.newButton( {fontSize = 75,width = 250,height = 150,label = "Play", id = "chooselevel", onRelease=goSomewhere})
    playBtn.height = 150
    playBtn.width = 250
    playBtn.y = display.contentHeight/4
    playBtn.x = display.contentWidth/2
    --grp:insert(playBtn)


    local options = widget.newButton( {fontSize = 50,width = 250,height = 150,label = "Options", id = "options", onRelease=goSomewhere})
    options.height = 150
    options.width = 250
    options.y = display.contentHeight/1.5
    options.x = display.contentWidth/2
    --grp:insert(options)

    local hoydehopp = widget.newButton( {fontSize = 40,width = 250,height = 75,label = "High Jump", id = "hoydehopp", onRelease=goSomewhere})
    hoydehopp:setReferencePoint ( display.TopLeftReferencePoint)
    hoydehopp.height = 75
    hoydehopp.width = 250
    hoydehopp.y = display.contentHeight-display.contentHeight
    hoydehopp.x = display.contentWidth-display.contentWidth
    --grp:insert( hoydehopp )
--]]


    



end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
   		print ("menu scene:show will")
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        print ("menu scene:show did")
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        
        print( "loading" )

        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        print( "loading1" )
 composer.removeScene("menu")
print( "loading2" )

    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene