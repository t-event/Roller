composer = require( "composer" )

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
        composer.gotoScene( goto, brett )

end

local function setUpDisplay(grp)
    

local brettstein1 = display.newImageRect("stein1.png", 200,200)
brettstein1.hight = 200
brettstein1.width = 200
    brettstein1.x = bredde/5
    brettstein1.y = hoyde/3
    brettstein1.alpha = 1
    

local brettstein2 = display.newImageRect("stein2.png", 200,200)
    brettstein2.x = brettstein1.x + 150
    brettstein2.y = brettstein1.y  
--grp:insert(brettstein2)

local brettstein3 = display.newImageRect("stein3.png", 200,200)
    brettstein3.x = brettstein2.x + 150
    brettstein3.y = brettstein1.y  

local brettstein4 = display.newImageRect("stein4.png", 200,200)
    brettstein4.x = brettstein3.x + 150
    brettstein4.y = brettstein1.y 

local brettstein5 = display.newImageRect("stein5.png", 200,200)
    brettstein5.x = brettstein4.x + 150
    brettstein5.y = brettstein1.y  

local brettstein6 = display.newImageRect("stein6.png", 200,200)
brettstein6.hight = 200
    brettstein6.x = brettstein1.x
    brettstein6.y = hoyde - brettstein6.hight/1.3

local brettstein7 = display.newImageRect("stein7.png", 200,200)
    brettstein7.x = brettstein2.x
    brettstein7.y = brettstein6.y 

local brettstein8 = display.newImageRect("stein8.png", 200,200)
    brettstein8.x = brettstein3.x
    brettstein8.y = brettstein6.y  

local brettstein9 = display.newImageRect("stein9.png", 200,200)
    brettstein9.x = brettstein4.x
    brettstein9.y = brettstein6.y

local brettstein10 = display.newImageRect("stein10.png", 200,200)
    brettstein10.x = brettstein5.x
    brettstein10.y = brettstein6.y


-------------------------------
local function start_brett1( event )
    if event.phase == "ended" then 
        composer.gotoScene( "play", { effect="zoomInOutFade", time=2000 } )
    end
end
brettstein1:addEventListener( "touch", start_brett1)
-------------------------------
local function start_brett2( event )
    if event.phase == "ended" then 
        composer.gotoScene( "play2", { effect="zoomInOutFade", time=2000 } )
    end
end
brettstein2:addEventListener( "touch", start_brett2)
-------------------------------
local function start_brett3( event )
    if event.phase == "ended" then 
        composer.gotoScene( "play3", { effect="zoomInOutFade", time=2000 } )
    end
end
brettstein3:addEventListener( "touch", start_brett3)

local function start_brett4( event )
    if event.phase == "ended" then 
        composer.gotoScene( "play4", { effect="zoomInOutFade", time=2000 } )
    end
end
brettstein4:addEventListener( "touch", start_brett4)



local bg = display.newImageRect( "backgroun1d.jpg", 1920, 1080 )
    --bg:setFillColor(0, 100, 200)
    bg:setReferencePoint( display.TopLeftReferencePoint )
    --bg.anchorX = 1
    --bg.anchorY = 1
    bg.y = 0
    bg.x = 0
    bg:scale( 1, 1 )
    grp:insert(bg)

local backBtn = widget.newButton( {fontSize = 50, width = 120,height = 70,label = "back", id = "menu", onRelease=goSomewhere})
    backBtn.hight = 70
    backBtn.width = 120
    backBtn.y = display.contentHeight - backBtn.hight/2
    backBtn.x = display.contentWidth/display.contentWidth+backBtn.width/2
    grp:insert(backBtn)

    grp:insert(brettstein1)
    grp:insert(brettstein2)
    grp:insert(brettstein3)
    grp:insert(brettstein4)
    grp:insert(brettstein5)
    grp:insert(brettstein6)
    grp:insert(brettstein7)
    grp:insert(brettstein8)
    grp:insert(brettstein9)
    grp:insert(brettstein10)

    










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
    composer.removeScene( "brett" )
    display.remove(brettstein1)
    display.remove(brettstein2)
    display.remove(brettstein3)
    display.remove(brettstein4)
    display.remove(brettstein5)
    display.remove(brettstein6)
    display.remove(brettstein7)
    display.remove(brettstein8)
    display.remove(brettstein9)
    display.remove(brettstein10)
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene