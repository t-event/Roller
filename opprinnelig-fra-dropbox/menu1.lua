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

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------
    local function goSomewhere (event)
        local goto = event.target.id
        local options = {effect = "slideLeft" , time =2000}
        composer.gotoScene( goto, options )

end

local function setUpDisplay(grp)
    
   physics.start( )
--physics.setGravity( 0, 0 )
    camera = perspective.createView()


    local bg = display.newImageRect( "background.jpg", 1170, 540 )
    --bg:setReferencePoint( display.TopLeftReferencePoint )
    bg.x = bredde/2
    bg.y = hoyde/2
    
    --bg:scale( 1, 1 )
    grp:insert(bg)





    local playBtn = widget.newButton( {fontSize = 75,width = 250,height = 150,label = "Play", id = "chooselevel", onRelease=goSomewhere})
    playBtn.height = 150
    playBtn.width = 250
    playBtn.y = display.contentHeight/4
    playBtn.x = display.contentWidth/2
    grp:insert(playBtn)


    local options = widget.newButton( {fontSize = 50,width = 250,height = 150,label = "Options", id = "options", onRelease=goSomewhere})
    options.height = 150
    options.width = 250
    options.y = display.contentHeight/1.5
    options.x = display.contentWidth/2
    grp:insert(options)

    local hoydehopp = widget.newButton( {fontSize = 40,width = 250,height = 75,label = "High Jump", id = "hoydehopp", onRelease=goSomewhere})
    hoydehopp:setReferencePoint ( display.TopLeftReferencePoint)
    hoydehopp.height = 75
    hoydehopp.width = 250
    hoydehopp.y = display.contentHeight-display.contentHeight
    hoydehopp.x = display.contentWidth-display.contentWidth
    grp:insert( hoydehopp )




    


end

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view


    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

    setUpDisplay(sceneGroup)

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
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
                composer.removeScene( "menu" )


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