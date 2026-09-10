local composer = require( "composer" )

local scene = composer.newScene()

local widget = require ("widget")

widget.setTheme ( "widget_theme_ios")

local physics = require( "physics" )
--physics.setDrawMode( "hybrid" )

local bredde = display.contentWidth

local hoyde = display.contentHeight


-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------
    local function goSomewhere (event)
        local goto = event.target.id
        local options = {effect = "fade" , time = 0}
        composer.gotoScene( goto, options )

end

local function setUpDisplay(grp)
    

     local bg = display.newImageRect( "backgroun1d.jpg", 1920, 1080 )
     --bg:setFillColor(0, 100, 200)
     bg:setReferencePoint( display.TopLeftReferencePoint )
     --bg.anchorX = 1
     --bg.anchorY = 1
     bg.y = 0
     bg.x = 0
     bg:scale( 1, 1 )
     grp:insert(bg)
     
     local backBtn = widget.newButton( {fontSize = 100, width = 250,height = 150,label = "back", id = "menu", onRelease=goSomewhere})
     backBtn.hight = 150
     backBtn.width = 250
     backBtn.y = display.contentHeight - backBtn.hight/2
     backBtn.x = display.contentWidth/display.contentWidth+backBtn.width/2
     grp:insert(backBtn)





local raskmeny = display.newImageRect(  "stein1.png", 50,50,0,0 )
raskmeny.x = bredde
raskmeny.y = hoyde-hoyde+raskmeny.height

--raskmeny:setReferencePoint( display.CenterRightReferencePoint )
raskmeny.alpha = 1
grp:insert(raskmeny)



local function nymeny( event )

     if event.phase == began then
transition.moveTo( raskmeny, { x=500,y=250,xScale = 10.0, yScale =10.0, time=150 } )

        --raskmeny.width
        --composer.gotoScene( "menu" )
        --raskmeny.alpha = 0
    end
end



raskmeny:addEventListener ("tap", nymeny)
--Runtime:addEventListener( "tap",  )


end

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
    setUpDisplay(sceneGroup)



    
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
   		print ("menu scene:show will")
    elseif ( phase == "did" ) then
        print ("menu scene:show did")

    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
    elseif ( phase == "did" ) then
    composer.removeScene( "options" )

    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view
--composer.removeScene( "options" )
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene