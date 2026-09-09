local composer = require( "composer" )

local scene = composer.newScene()

local widget = require ("widget")

widget.setTheme ( "widget_theme_ios")

local physics = require( "physics" )
physics.setDrawMode( "hybrid" )
local scaleFactor = 1.0
local physicsData = (require "shapedefs").physicsData(scaleFactor)

local bredde = display.contentWidth

local hoyde = display.contentHeight

local gameUI =require("gameUI")


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
-------------------------------------------------------------------------------
local function setUpDisplay(grp)

    physics.start( )

    local bakke = display.newRect( 0,0,bredde,50 )
    --bakke:setReferencePoint(display.TopLeftReferencePoint)
    --bakke.x = bredde
    bakke.y = hoyde-bakke.height
    grp:insert( bakke )
    physics.addBody(bakke, "static",{density = 1.0, friction = 3, bounce = 0.0})

    local backBtn = widget.newButton( {fontSize = 100, width = 250,height = 150,label = "back", id = "menu", onRelease=goSomewhere})
    backBtn:setReferencePoint(display.TopLeftReferencePoint)
    backBtn.height = 150
    backBtn.width = 250
    backBtn.y = display.contentHeight - display.contentHeight
    backBtn.x = display.contentWidth - backBtn.width
    grp:insert(backBtn)



     del1 = display.newImageRect( "hale.png", 55, 35 )
    del1.x=500
    del1.y=0
    del1.width = 27
    del1.height = 17
    local del1Shape = {-13,8, -13,-8, 11,3, 14,0, 11,-3}
    physics.addBody(del1, "dynamic",  {density = 1.0, friction = 0.3, bounce = 0.2, shape=del1Shape})
      del1.alpha = 1
      del1:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del1)

    del2 = display.newImageRect( "del1.png", 34, 17 )
    del2.x= del1.x-27
    del2.y=del1.y
    del2.rotation = (0)
    physics.addBody(del2,"dynamic", physicsData:get("del1") )
    del2:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del2)

    del3 = display.newImageRect( "del1.png", 34, 17 )
    del3.x= del1.x-54
    del3.y=del1.y
    del3.rotation = (0)
    physics.addBody(del3,"dynamic", physicsData:get("del1") )
    del3:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del3)

    del4 = display.newImageRect( "del1.png", 34, 17 )
    del4.x= del1.x-81
    del4.y=del1.y
    del4.rotation = (0)
    physics.addBody(del4,"dynamic", physicsData:get("del1") )
    del4:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del4)

    del5 = display.newImageRect( "del1.png", 34, 17 )
    del5.x= del1.x-108
    del5.y=del1.y
    del5.rotation = (0)
    physics.addBody(del5,"dynamic", physicsData:get("del1") )
    del5:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del5)

    del6 = display.newImageRect( "del1.png", 34, 17 )
    del6.x= del1.x-135
    del6.y=del1.y
    del6.rotation = (0)
    physics.addBody(del6,"dynamic", physicsData:get("del1") )
    del6:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del6)

    del7 = display.newImageRect( "del1.png", 34, 17 )
    del7.x= del1.x-162
    del7.y=del1.y
    del7.rotation = (0)
    physics.addBody(del7,"dynamic", physicsData:get("del1") )
    del7:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del7)

    del8 = display.newImageRect( "del1.png", 34, 17 )
    del8.x= del1.x-189
    del8.y=del1.y
    del8.rotation = (0)
    physics.addBody(del8,"dynamic", physicsData:get("del1") )
    del8:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del8)

    del9 = display.newImageRect( "hode.png", 30,25)
    del9.x=del1.x-217
    del9.y=del1.y+2
    del9.rotation = (0)
    local del9Shape = {-15,-5, -12,-10, -10,-10, 0,-9, 14,-11 ,0,-11, 14,6, -12,4}
    physics.addBody(del9, "dynamic",  {density = 1.0, friction = 1.3, bounce = 0.2,shape=del9Shape})
    del9:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del9)
-----
    del11 = display.newImageRect( "hale.png", 55, 35 )
    del11.x= bredde-bredde+450
    del11.y=hoyde/2
    del11.width = 55
    del11.hight = 35
    del11.rotation = (0)
    local del1Shape = {-27,17, -27,-17, 23,7, 28,0, 23,-7}
    physics.addBody(del11, "dynamic",  {density = 1.0, friction = 0.3, bounce = 0.2, shape=del1Shape})
    del11.alpha = 1
    del11:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del11)

    del22 = display.newImageRect( "del1.jpg", 55, 35 )
    del22.x= del11.x-50
    del22.y=del11.y
    del22.rotation = (0)
    physics.addBody(del22, "dynamic", {density = 1.0, friction = 0.3, bounce = 0.2})
    del22:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del22)

    del33 = display.newImageRect( "del1.jpg", 55, 35 )
    del33.x= del11.x-100
    del33.y=del11.y
    del33.rotation = (0)
    physics.addBody(del33, "dynamic", {density = 1.0, friction = 0.3, bounce = 0.2})
    del33:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del33)

    del44 = display.newImageRect( "del1.jpg", 55, 35 )
    del44.x= del11.x-150
    del44.y=del11.y
    del44.rotation = (0)
    physics.addBody(del44, "dynamic", {density = 1.0, friction = 0.3, bounce = 0.2})
    del44:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del44)

    del55 = display.newImageRect( "del1.jpg", 55, 35 )
    del55.x= del11.x-200
    del55.y=del11.y
    del55.rotation = (0)
    physics.addBody(del55, "dynamic", {density = 1.0, friction = 0.3, bounce = 0.2})
    del55:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del55)

    del66 = display.newImageRect( "del1.jpg", 55, 35 )
    del66.x= del11.x-250
    del66.y=del11.y
    del66.rotation = (0)
    physics.addBody(del66, "dynamic", {density = 1.0, friction = 0.3, bounce = 0.2})
    del66:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del66)

    del77 = display.newImageRect( "del1.jpg", 55, 35 )
    del77.x= del11.x-300
    del77.y=del11.y
    del77.rotation = (0)
    physics.addBody(del77, "dynamic", {density = 1.0, friction = 0.3, bounce = 0.2})
    del77:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del77)

    del88 = display.newImageRect( "del1.jpg", 55, 35 )
    del88.x= del11.x-350
    del88.y=del11.y
    del88.rotation = (0)
    physics.addBody(del88, "dynamic", {density = 1.0, friction = 0.3, bounce = 0.2})
    del88:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del88)

    del99 = display.newImageRect( "hode.png", 60, 50 )
    del99.x=del11.x-400
    del99.y=del11.y+5
    del99.rotation = (0)
    local del9Shape = {-30,-10, -25,-20, -20,-20, 0,-18, 28,-22 ,0,-22, 28,13, -24,8}
    physics.addBody(del99, "dynamic",  {density = 1.0, friction = 0.3, bounce = 0.2,shape=del9Shape})
    del99:addEventListener ("touch", gameUI.dragBody )
    grp:insert(del99)


    local pivot_joint  = physics.newJoint( "pivot", del1, del2, del1.x-12, del1.y )
    local pivot_joint1 = physics.newJoint( "pivot", del2, del3, del2.x-12, del2.y )
    local pivot_joint2 = physics.newJoint( "pivot", del3, del4, del3.x-12, del3.y )
    local pivot_joint3 = physics.newJoint( "pivot", del4, del5, del4.x-12, del4.y )
    local pivot_joint4 = physics.newJoint( "pivot", del5, del6, del5.x-12, del5.y )
    local pivot_joint5 = physics.newJoint( "pivot", del6, del7, del6.x-12, del6.y )
    local pivot_joint6 = physics.newJoint( "pivot", del7, del8, del7.x-12, del7.y )
    local pivot_joint7 = physics.newJoint( "pivot", del8, del9, del8.x-12, del8.y )

    local pivot_joint8 = physics.newJoint( "pivot", del11, del22, del11.x-25, del11.y )
    local pivot_joint9 = physics.newJoint( "pivot", del22, del33, del22.x-25, del22.y )
    local pivot_joint10 = physics.newJoint( "pivot", del33, del44, del33.x-25, del33.y )
    local pivot_joint11 = physics.newJoint( "pivot", del44, del55, del44.x-25, del44.y )
    local pivot_joint12 = physics.newJoint( "pivot", del55, del66, del55.x-25, del55.y )
    local pivot_joint13 = physics.newJoint( "pivot", del66, del77, del66.x-25, del66.y )
    local pivot_joint14 = physics.newJoint( "pivot", del77, del88, del77.x-25, del77.y )
    local pivot_joint15 = physics.newJoint( "pivot", del88, del99, del88.x-25, del88.y )

end
-------------------------------------------------------------------------------
function scene:create( event )
    local sceneGroup = self.view
    setUpDisplay(sceneGroup)
end
-------------------------------------------------------------------------------
function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase
    if ( phase == "will" ) then
   		print ("menu scene:show will")
    elseif ( phase == "did" ) then
        print ("menu scene:show did")
    end
end
-------------------------------------------------------------------------------
function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase
    if ( phase == "will" ) then
    elseif ( phase == "did" ) then
            physics.stop( )

        composer.removeScene( "hoydehopp" )
        --display.remove( joint )
    end
end
-------------------------------------------------------------------------------
function scene:destroy( event )
    local sceneGroup = self.view
end
-- ----------------------------------------------------------------------------
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- ----------------------------------------------------------------------------
return scene
-------------------------------------------------------------------------------