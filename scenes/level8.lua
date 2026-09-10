local composer = require( "composer" )

local scene = composer.newScene()

local widget = require ("widget")

widget.setTheme ( "widget_theme_ios")

local physics = require( "physics" )
--physics.setDrawMode( "hybrid" )
local perspective = require ("lib.perspective")

local scaleFactor = 1.0
local physicsData = (require "lib.shapedefs").physicsData(scaleFactor)
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenLeft = display.screenOriginX
local screenWidth = display.viewableContentWidth - screenLeft * 2
local screenRight = screenLeft + screenWidth
local screenTop = display.screenOriginY
local screenHeight = display.viewableContentHeight - screenTop * 2
local screenBottom = screenTop + screenHeight

local bredde = display.contentWidth

local hoyde = display.contentHeight
local lm = require("lib.ogt_levelmanager")
local liv =require("lib.liv")
--local pausemenu = require("pausemenu")

-- Forhåndsdeklarert her (fil-scope) i stedet for utilsiktet global,
-- gjort 2026-09-10. Trengs synlig for BÅDE scene:create (der den
-- defineres) og scene:hide (der touch-lytteren fjernes igjen) siden de
-- er to separate funksjoner i denne fila, ikke nestet i hverandre.
local trykk_knapp

-- -----------------------------------------------------------------------------------------------------------------






        local function goSomewhere (event)
        camera:destroy()
        camera                               =nil
        Runtime:removeEventListener("collision", onCollision)
        Runtime:removeEventListener("collision", onCollision1)
        Runtime:removeEventListener( "touch", trykk_knapp)
        Runtime:removeEventListener( "tap", trykk_knapp)
        local goto                           = event.target.id
        local options                        = {effect = "fade" , time = 500}
        composer.gotoScene( goto, options )
        end
        
-- -----------------------------------------------------------------------------------------------------------------


        local function goto( event )
        physics.pause( )
        Runtime:removeEventListener("collision", onCollision)
        Runtime:removeEventListener("collision", onCollision1)
        Runtime:removeEventListener("collision", onCollision2)
        composer.showOverlay( "scenes.dodmenu1",{isModal = true,effect = "fade",time = 500,})
        end



-- -----------------------------------------------------------------------------------------------------------------


        local function goto1( event )
        --grp:remove(camera)
        physics.pause( )
        Runtime:removeEventListener("collision", onCollision)
        Runtime:removeEventListener("collision", onCollision1)
        --Runtime:removeEventListener( "touch", trykk_knapp)
        --Runtime:removeEventListener( "tap", trykk_knapp)
        --knapp1.alpha = 0
        composer.showOverlay( "scenes.pausemenu1",{isModal = true,effect = "fade",time = 500,})
        end

-- -----------------------------------------------------------------------------------------------------------------

        -- "Neste bane"-knappen. Viste før alltid gotolevel2 hardkodet
        -- her, uansett hvilken bane som ble fullført, og selv den gikk
        -- videre til bane 1, ikke bane 2 (rettet 2026-09-10). Går nå
        -- til banevalget i stedet, samme som level1.lua alltid gjorde.
        local function goto2( event )
        --grp:remove(camera)
        physics.pause( )
        Runtime:removeEventListener("collision", onCollision)
        Runtime:removeEventListener("collision", onCollision1)
        --Runtime:removeEventListener( "touch", trykk_knapp)
        --Runtime:removeEventListener( "tap", trykk_knapp)
        --knapp1.alpha = 0
        composer.showOverlay( "scenes.gotochooselevel",{isModal = true,effect = "fade",time = 500,})
        end

-- -----------------------------------------------------------------------------------------------------------------


      


        

function scene:create( event )
lm.currentLevel = 8 -- så retry vet hvilken bane den skal restarte


    local sceneGroup = self.view
    print ("level1 scene:create did")
    
      ------aktiver for å kunne se hele brettet. Også aktiver local scaleFactor = 0.025-----
   -- grp = display.newGroup( )
    --
   -- local scaleFactor = 0.6
    
    -- Bevisst global (2026-09-10, markert eksplisitt per Solar2D sin
    -- egen anbefaling): lib/liv.lua sin liv.hent() skriver til denne
    -- gruppa direkte og har ingen annen måte å nå den på.
    _G.camera = perspective.createView()
    physics.start( )
    --physics.pause( )
    --physics.setGravity(0 , 9.81 )
    physics.setContinuous( true )
    liv.lastliv()

    local justerside   = 1705
    local justeroppned = 1044


    --local scaleFactccor = 0.025
    --local scaleFactor = 0.050
    --local scaleFactor = 0.1
    local scaleFactor = 0.6
     -- Bevisst global, se forklaring ved _G.camera over.
     _G.grp=sceneGroup
    camera.xScale = scaleFactor
    camera.yScale = scaleFactor




          local dod = display.newRect (0, 0, 70000, 50) 
          dod.x = bredde -bredde-bredde
          dod.y = hoyde
          dod:rotate( 31.48 ) 
          dod.myName = "dod"
          grp:insert( dod ) 
          dod.alpha = 0
          camera:add (dod,1,false)
          physics.addBody(dod, "kinematic", {isSensor = true})
          
          
         
          
          
          local mal2 = display.newRect( 0, 0, 10, 3000 )
          --mal2:setReferencePoint( display.BottomLeftReferencePoint )
          mal2.x = 31000
          mal2.y = 18000
          mal2.myName = "mal2"
          mal2:rotate(45)
          grp:insert ( mal2 )
          mal2.alpha = 0
          camera:add (mal2,1,false)
          physics.addBody(mal2, "kinematic", {isSensor = true})


 

    local knapp1 = display.newImageRect( "pauseknapp.png", 75, 75 )
    knapp1.x = bredde+bredde-((knapp1.width*2)*1.6)
    knapp1.y = hoyde - hoyde + (knapp1.height*2)
    knapp1.alpha = 1
    grp:insert(knapp1)
   

    local hent = liv.hent 
liv.hent()
timer.performWithDelay(3000, hent, 1)

--game.load()
--print("Current Score: ", game.returnScore())






    local background = display.newImageRect( "background/dirt1.png", 1920*20, 1080*5 )
    background.anchorX = 0.5
    background.anchorY = 0.5
    background.x = bredde-bredde-bredde
    background.y = background.height-background.height
    background:rotate( 31.48 )
    background.alpha = 1


    local background1 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background1.anchorX = 1
    background1.anchorY = 0.5
    background1.x = bredde-bredde
    background1.y = hoyde-hoyde-hoyde*0.67
    background1.rotation = 31.48 
    background1.alpha = 1

    local background2 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background2.anchorX = 1
    background2.anchorY = 0.5
    background2.x = background1.x+ justerside  
    background2.y = background1.y+   justeroppned
    background2:rotate( background1.rotation )
    background2.alpha = 1

    local background3 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background3.anchorX = 1
    background3.anchorY = 0.5
    background3.x = background2.x+ justerside
    background3.y = background2.y+   justeroppned
    background3:rotate( background1.rotation )
    background3.alpha = 1

    local background4 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background4.anchorX = 1
    background4.anchorY = 0.5
    background4.x = background3.x+ justerside
    background4.y = background3.y+   justeroppned
    background4:rotate( background1.rotation )
    background4.alpha = 1

    local background5 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background5.anchorX = 1
    background5.anchorY = 0.5
    background5.x = background4.x+ justerside
    background5.y = background4.y+   justeroppned
    background5:rotate( background1.rotation )
    background5.alpha = 1

    local background6 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background6.anchorX = 1
    background6.anchorY = 0.5
    background6.x = background5.x+ justerside
    background6.y = background5.y+   justeroppned
    background6:rotate( background1.rotation )
    background6.alpha = 1

    local background7 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background7.anchorX = 1
    background7.anchorY = 0.5
    background7.x = background6.x+ justerside
    background7.y = background6.y+   justeroppned
    background7:rotate( background1.rotation )
    background7.alpha = 1

    local background8 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background8.anchorX = 1
    background8.anchorY = 0.5
    background8.x = background7.x+ justerside
    background8.y = background7.y+   justeroppned
    background8:rotate( background1.rotation )
    background8.alpha = 1

    local background9 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background9.anchorX = 1
    background9.anchorY = 0.5
    background9.x = background8.x+ justerside
    background9.y = background8.y+   justeroppned
    background9:rotate( background1.rotation )
    background9.alpha = 1

    local background10 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background10.anchorX = 1
    background10.anchorY = 0.5
    background10.x = background9.x+ justerside
    background10.y = background9.y+   justeroppned
    background10:rotate( background1.rotation )
    background10.alpha = 1


    local background11 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background11.anchorX = 1
    background11.anchorY = 0.5
    background11.x = background10.x+ justerside
    background11.y = background10.y+   justeroppned
    background11:rotate( background1.rotation )
    background11.alpha = 1

    local background12 = display.newImageRect( "background/back_cave.png", 2000, 3000 )
    background12.anchorX = 1
    background12.anchorY = 0.5
    background12.x = background11.x+ justerside
    background12.y = background11.y+   justeroppned
    background12:rotate( background1.rotation )
    background12.alpha = 1

   ------

    local background1a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background1a.anchorX = 1
    background1a.anchorY = 0.5
    background1a.x = bredde-bredde
    background1a.y = hoyde-hoyde-hoyde*0.67
    background1a.rotation = 31.48 
    background1a.alpha = 1

    local background2a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background2a.anchorX = 1
    background2a.anchorY = 0.5
    background2a.x = background1a.x+ justerside  
    background2a.y = background1a.y+   justeroppned
    background2a:rotate( background1.rotation )
    background2a.alpha = 1

    local background3a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background3a.anchorX = 1
    background3a.anchorY = 0.5
    background3a.x = background2a.x+ justerside
    background3a.y = background2a.y+   justeroppned
    background3a:rotate( background1.rotation )
    background3a.alpha = 1

    local background4a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background4a.anchorX = 1
    background4a.anchorY = 0.5
    background4a.x = background3a.x+ justerside
    background4a.y = background3a.y+   justeroppned
    background4a:rotate( background1.rotation )
    background4a.alpha = 1

    local background5a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background5a.anchorX = 1
    background5a.anchorY = 0.5
    background5a.x = background4a.x+ justerside
    background5a.y = background4a.y+   justeroppned
    background5a:rotate( background1.rotation )
    background5a.alpha = 1

    local background6a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background6a.anchorX = 1
    background6a.anchorY = 0.5
    background6a.x = background5a.x+ justerside
    background6a.y = background5a.y+   justeroppned
    background6a:rotate( background1.rotation )
    background6a.alpha = 1

    local background7a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background7a.anchorX = 1
    background7a.anchorY = 0.5
    background7a.x = background6a.x+ justerside
    background7a.y = background6a.y+   justeroppned
    background7a:rotate( background1.rotation )
    background7a.alpha = 1

    local background8a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background8a.anchorX = 1
    background8a.anchorY = 0.5
    background8a.x = background7a.x+ justerside
    background8a.y = background7a.y+   justeroppned
    background8a:rotate( background1.rotation )
    background8a.alpha = 1

    local background9a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background9a.anchorX = 1
    background9a.anchorY = 0.5
    background9a.x = background8a.x+ justerside
    background9a.y = background8a.y+   justeroppned
    background9a:rotate( background1.rotation )
    background9a.alpha = 1

    local background10a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background10a.anchorX = 1
    background10a.anchorY = 0.5
    background10a.x = background9a.x+ justerside
    background10a.y = background9a.y+   justeroppned
    background10a:rotate( background1.rotation )
    background10a.alpha = 1


    local background11a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background11a.anchorX = 1
    background11a.anchorY = 0.5
    background11a.x = background10a.x+ justerside
    background11a.y = background10a.y+   justeroppned
    background11a:rotate( background1.rotation )
    background11a.alpha = 1

    local background12a = display.newImageRect( "background/back_cave1.png", 2000, 3000 )
    background12a.anchorX = 1
    background12a.anchorY = 0.5
    background12a.x = background11a.x+ justerside
    background12a.y = background11a.y+   justeroppned
    background12a:rotate( background1.rotation )
    background12a.alpha = 1

    -------

    local background1b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background1b.anchorX = 1
    background1b.anchorY = 0.5
    background1b.x = bredde-bredde
    background1b.y = hoyde-hoyde-hoyde*0.67
    background1b.rotation = 31.48 
    background1b.alpha = 1

    local background2b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background2b.anchorX = 1
    background2b.anchorY = 0.5
    background2b.x = background1b.x+ justerside  
    background2b.y = background1b.y+   justeroppned
    background2b:rotate( background1.rotation )
    background2b.alpha = 1

    local background3b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background3b.anchorX = 1
    background3b.anchorY = 0.5
    background3b.x = background2b.x+ justerside
    background3b.y = background2b.y+   justeroppned
    background3b:rotate( background1.rotation )
    background3b.alpha = 1

    local background4b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background4b.anchorX = 1
    background4b.anchorY = 0.5
    background4b.x = background3b.x+ justerside
    background4b.y = background3b.y+   justeroppned
    background4b:rotate( background1.rotation )
    background4b.alpha = 1

    local background5b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background5b.anchorX = 1
    background5b.anchorY = 0.5
    background5b.x = background4b.x+ justerside
    background5b.y = background4b.y+   justeroppned
    background5b:rotate( background1.rotation )
    background5b.alpha = 1

    local background6b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background6b.anchorX = 1
    background6b.anchorY = 0.5
    background6b.x = background5b.x+ justerside
    background6b.y = background5b.y+   justeroppned
    background6b:rotate( background1.rotation )
    background6b.alpha = 1

    local background7b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background7b.anchorX = 1
    background7b.anchorY = 0.5
    background7b.x = background6b.x+ justerside
    background7b.y = background6b.y+   justeroppned
    background7b:rotate( background1.rotation )
    background7b.alpha = 1

    local background8b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background8b.anchorX = 1
    background8b.anchorY = 0.5
    background8b.x = background7b.x+ justerside
    background8b.y = background7b.y+   justeroppned
    background8b:rotate( background1.rotation )
    background8b.alpha = 1

    local background9b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background9b.anchorX = 1
    background9b.anchorY = 0.5
    background9b.x = background8b.x+ justerside
    background9b.y = background8b.y+   justeroppned
    background9b:rotate( background1.rotation )
    background9b.alpha = 1

    local background10b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background10b.anchorX = 1
    background10b.anchorY = 0.5
    background10b.x = background9b.x+ justerside
    background10b.y = background9b.y+   justeroppned
    background10b:rotate( background1.rotation )
    background10b.alpha = 1


    local background11b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background11b.anchorX = 1
    background11b.anchorY = 0.5
    background11b.x = background10b.x+ justerside
    background11b.y = background10b.y+   justeroppned
    background11b:rotate( background1.rotation )
    background11b.alpha = 1

    local background12b = display.newImageRect( "background/back_cave2.png", 2000, 3000 )
    background12b.anchorX = 1
    background12b.anchorY = 0.5
    background12b.x = background11b.x+ justerside
    background12b.y = background11b.y+   justeroppned
    background12b:rotate( background1.rotation )
    background12b.alpha = 1




 





------------------------------------------------------------------------

    

    local del1 = display.newImageRect( "hale.png", 55, 35 )

    del1.x=0
    del1.y=0
    --del1.x=15200
    --del1.y=8500
    --del1.x=29600
    --del1.y=17000
    del1.width = 27
    del1.height = 17
    local del1Shape = {-13,8, -13,-8, 11,3, 14,0, 11,-3}
    physics.addBody(del1, "dynamic",  {density = 1.0, friction = 0.3, bounce = 0.2, shape=del1Shape})
      del1.alpha = 1
    grp:insert(del1)

     local del2 = display.newImageRect( "del1.png", 34, 17 )
    del2.x= del1.x-27
    del2.y=del1.y
    del2.rotation = (0)
    physics.addBody(del2,"dynamic", physicsData:get("del1") )
    grp:insert(del2)

     local del3 = display.newImageRect( "del1.png", 34, 17 )
    del3.x= del1.x-54
    del3.y=del1.y
    del3.rotation = (0)
    physics.addBody(del3,"dynamic", physicsData:get("del1") )
    grp:insert(del3)

     local del4 = display.newImageRect( "del1.png", 34, 17 )
    del4.x= del1.x-81
    del4.y=del1.y
    del4.rotation = (0)
    del4.isSensor = true
    del4.myName = "del4"
    

    physics.addBody(del4,"dynamic", physicsData:get("del1") )
    grp:insert(del4)

     local del5 = display.newImageRect( "del1.png", 34, 17 )
    del5.x= del1.x-108
    del5.y=del1.y
    del5.rotation = (0)
    physics.addBody(del5,"dynamic", physicsData:get("del1") )
    grp:insert(del5)

    local  del6 = display.newImageRect( "del1.png", 34, 17 )
    del6.x= del1.x-135
    del6.y=del1.y
    del6.rotation = (0)
    physics.addBody(del6,"dynamic", physicsData:get("del1") )
    grp:insert(del6)

     local del7 = display.newImageRect( "del1.png", 34, 17 )
    del7.x= del1.x-162
    del7.y=del1.y
    del7.rotation = (0)
    physics.addBody(del7,"dynamic", physicsData:get("del1") )
    grp:insert(del7)

     local del8 = display.newImageRect( "del1.png", 34, 17 )
    del8.x= del1.x-189
    del8.y=del1.y
    del8.rotation = (0)
    physics.addBody(del8,"dynamic", physicsData:get("del1") )
    grp:insert(del8)

     local del9 = display.newImageRect( "hode.png", 30,25)
    del9.x=del1.x-217
    del9.y=del1.y+2
    del9.rotation = (0)
    local del9Shape = {-15,-5, -12,-10, -10,-10, 0,-9, 14,-11 ,0,-11, 14,6, -12,4}
    physics.addBody(del9, "dynamic",  {density = 1.0, friction = 1.3, bounce = 0.2,shape=del9Shape})
    del9.myName = "del9"
    grp:insert(del9)

    local punkt = display.newRect( 200, 200, 10, 10 )
    punkt.x = del5.x
    punkt.y = del5.y-40
    punkt.alpha = 0
    punktsant   = true
    physics.addBody( punkt,"dynamic")
    punkt.isSensor = true
    grp:insert(punkt)

    local pivot_joint  = physics.newJoint( "pivot", del1, del2, del1.x-14, del1.y )
    local pivot_joint1 = physics.newJoint( "pivot", del2, del3, del2.x-14, del2.y )
    local pivot_joint2 = physics.newJoint( "pivot", del3, del4, del3.x-14, del3.y )
    local pivot_joint3 = physics.newJoint( "pivot", del4, del5, del4.x-14, del4.y )
    local pivot_joint4 = physics.newJoint( "pivot", del5, del6, del5.x-14, del5.y )
    local pivot_joint5 = physics.newJoint( "pivot", del6, del7, del6.x-14, del6.y )
    local pivot_joint6 = physics.newJoint( "pivot", del7, del8, del7.x-14, del7.y )
    local pivot_joint7 = physics.newJoint( "pivot", del8, del9, del8.x-14, del8.y )
    local pivot_joint8 = physics.newJoint( "weld", punkt, del5, punkt.x+108, del4.y+10 )



    pivot_joint.isMotorEnabled = true
    pivot_joint.motorSpeed =30
    pivot_joint.maxMotorTorque = 500
    pivot_joint.isLimitEnabled=true
    pivot_joint:setRotationLimits( 0, 38 )
    pivot_joint.isCollideConnected = true

    pivot_joint1.isMotorEnabled = true
    pivot_joint1.motorSpeed =pivot_joint.motorSpeed
    pivot_joint1.maxMotorTorque = pivot_joint.maxMotorTorque
    pivot_joint1.isLimitEnabled=true
    pivot_joint1:setRotationLimits( 0, 38 )
    pivot_joint1.isCollideConnected = pivot_joint.isCollideConnected

    pivot_joint2.isMotorEnabled = true
    pivot_joint2.motorSpeed =pivot_joint.motorSpeed
    pivot_joint2.maxMotorTorque = pivot_joint.maxMotorTorque
    pivot_joint2.isLimitEnabled=true
    pivot_joint2:setRotationLimits( 0, 38 )
    pivot_joint2.isCollideConnected = pivot_joint.isCollideConnected

    pivot_joint3.isMotorEnabled = true
    pivot_joint3.motorSpeed =pivot_joint.motorSpeed
    pivot_joint3.maxMotorTorque = pivot_joint.maxMotorTorque
    pivot_joint3.isLimitEnabled=true
    pivot_joint3:setRotationLimits( 0, 38 )
    pivot_joint3.isCollideConnected = pivot_joint.isCollideConnected

    pivot_joint4.isMotorEnabled = true
    pivot_joint4.motorSpeed =pivot_joint.motorSpeed
    pivot_joint4.maxMotorTorque = pivot_joint.maxMotorTorque
    pivot_joint4.isLimitEnabled=true
    pivot_joint4:setRotationLimits( 0, 38 )
    pivot_joint4.isCollideConnected = pivot_joint.isCollideConnected

    pivot_joint5.isMotorEnabled = true
    pivot_joint5.motorSpeed =pivot_joint.motorSpeed
    pivot_joint5.maxMotorTorque = pivot_joint.maxMotorTorque
    pivot_joint5.isLimitEnabled=true
    pivot_joint5:setRotationLimits( 0, 38 )
    pivot_joint5.isCollideConnected = pivot_joint.isCollideConnected

    pivot_joint6.isMotorEnabled = true
    pivot_joint6.motorSpeed =pivot_joint.motorSpeed
    pivot_joint6.maxMotorTorque = pivot_joint.maxMotorTorque
    pivot_joint6.isLimitEnabled=true
    pivot_joint6:setRotationLimits( 0, 38 )
    pivot_joint6.isCollideConnected = pivot_joint.isCollideConnected

    pivot_joint7.isMotorEnabled = true
    pivot_joint7.motorSpeed =pivot_joint.motorSpeed
    pivot_joint7.maxMotorTorque = pivot_joint.maxMotorTorque
    pivot_joint7.isLimitEnabled=true
    pivot_joint7:setRotationLimits( 0, 38 )
    pivot_joint7.isCollideConnected = pivot_joint.isCollideConnected


    pivot_joint8.isMotorEnabled = false
    pivot_joint8.motorSpeed = 0 
    pivot_joint8.maxMotorTorque = 0
    pivot_joint8.isLimitEnabled=false
    --pivot_joint8:setRotationLimits( 0, 38 )
    pivot_joint8.isCollideConnected = true
 

local knott1 = display.newRect( 10,10,10,10 )
knott1.x = del1.x
knott1.y = del1.y+5
camera:add(knott1,1,false)
physics.addBody( knott1, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott1.isSensor = true
knott1.alpha = 0

local knott2 = display.newRect( 10,10,10,10 )
knott2.x = del2.x
knott2.y = del2.y+10
camera:add(knott2,1,false)
physics.addBody( knott2, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott2.isSensor = true
knott2.alpha = 0

local knott3 = display.newRect( 10,10,10,10 )
knott3.x = del3.x
knott3.y = del3.y+10
camera:add(knott3,1,false)
physics.addBody( knott3, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott3.isSensor = true
knott3.alpha = 0

local knott4 = display.newRect( 10,10,10,10 )
knott4.x = del4.x
knott4.y = del4.y+10
camera:add(knott4,1,false)
physics.addBody( knott4, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott4.isSensor = true
knott4.alpha = 0

local knott5 = display.newRect( 10,10,10,10 )
knott5.x = del5.x
knott5.y = del5.y+10
camera:add(knott5,1,false)
physics.addBody( knott5, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott5.isSensor = true
knott5.alpha = 0

local knott6 = display.newRect( 10,10,10,10 )
knott6.x = del6.x
knott6.y = del6.y+10
camera:add(knott6,1,false)
physics.addBody( knott6, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott6.isSensor = true
knott6.alpha = 0

local knott7 = display.newRect( 10,10,10,10 )
knott7.x = del7.x
knott7.y = del7.y+10
camera:add(knott7,1,false)
physics.addBody( knott7, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott7.isSensor = true
knott7.alpha = 0

local knott8 = display.newRect( 10,10,10,10 )
knott8.x = del8.x
knott8.y = del8.y+10
camera:add(knott8,1,false)
physics.addBody( knott8, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott8.isSensor = true
knott8.alpha = 0

local knott9 = display.newRect( 10,10,10,10 )
knott9.x = del9.x
knott9.y = del9.y+10
camera:add(knott9,1,false)
physics.addBody( knott9, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott9.isSensor = true
knott9.alpha = 0


local weldJoint1 = physics.newJoint( "weld", knott1, del1, knott1.x, knott1.x )
local weldJoint2 = physics.newJoint( "weld", knott2, del2, knott2.x, knott2.x )
local weldJoint3 = physics.newJoint( "weld", knott3, del3, knott3.x, knott3.x )
local weldJoint4 = physics.newJoint( "weld", knott4, del4, knott4.x, knott4.x )
local weldJoint5 = physics.newJoint( "weld", knott5, del5, knott5.x, knott5.x )
local weldJoint6 = physics.newJoint( "weld", knott6, del6, knott6.x, knott6.x )
local weldJoint7 = physics.newJoint( "weld", knott7, del7, knott7.x, knott7.x )
local weldJoint8 = physics.newJoint( "weld", knott8, del8, knott8.x, knott8.x )
local weldJoint9 = physics.newJoint( "weld", knott9, del9, knott9.x, knott9.x )











   

                                     
                                      local     firkant1 = display.newImageRect("level8/1.png", 7680,4702)
                                                firkant1.x = 3500
                                                --firkant1.x = 3850
                                                firkant1.y = 2300
                                                physics.addBody(firkant1,"static", physicsData:get("1") )
                                                firkant1.alpha = 1  
                                                firkant1.myName = "firkant1"                                
                                                
                                      local     firkant2 = display.newImageRect("level8/2.png", 7680,4702)
                                                firkant2.x = firkant1.x+firkant2.width
                                                firkant2.y = firkant1.y+firkant2.height
                                                physics.addBody(firkant2,"static", physicsData:get("2") )
                                                firkant2.myName = "firkant2"   
                                                
                                                 
                                      local     firkant3 = display.newImageRect("level8/3.png", 7680,4702)
                                                firkant3.x = firkant2.x+firkant3.width
                                                firkant3.y = firkant2.y+firkant3.height
                                                physics.addBody(firkant3,"static", physicsData:get("3") )
                                                firkant3.myName = "firkant3"   
                                                
                                                
                                      local     firkant4 = display.newImageRect("level8/4.png", 7680,4702)
                                                firkant4.x = firkant3.x+firkant4.width
                                                firkant4.y = firkant3.y+firkant4.height
                                                physics.addBody(firkant4,"static", physicsData:get("4") )
                                                firkant4.myName = "firkant4"   
                                                
                                                



 







mal2.type     = "mal2"
dod.type      = "dod"
del1.type     = "del1"
del2.type     = "del2"
del3.type     = "del3"
del4.type     = "del4"
del5.type     = "del5"
del6.type     = "del6"
del7.type     = "del7"
del8.type     = "del8"
del9.type     = "del9"

knott1.type   = "knott1"
knott2.type   = "knott2"
knott3.type   = "knott3"
knott4.type   = "knott4"
knott5.type   = "knott5"
knott6.type   = "knott6"
knott7.type   = "knott7"
knott8.type   = "knott8"
knott9.type   = "knott9"


firkant1.type = "firkant1"
firkant2.type = "firkant2"
firkant3.type = "firkant3"
firkant4.type = "firkant4"


------------------------------------------------------------------
local function onCollision(event)
if event.phase == "began" then
local agro = event.object1
local hit = event.object2
if      agro.type == "dod" and hit.type == "del1" then
    knapp1.alpha = 0
    --print( "dod og del1" )
elseif  agro.type == "dod" and hit.type == "del2" then
    knapp1.alpha = 0
    --print( "dod og del2" )
elseif  agro.type == "dod" and hit.type == "del3" then
    knapp1.alpha = 0
    --print( "dod og del3" )
elseif  agro.type == "dod" and hit.type == "del4" then
    knapp1.alpha = 0
    --print( "dod og del4" )
elseif  agro.type == "dod" and hit.type == "del5" then
    knapp1.alpha = 0
    --print( "dod og del5" )
elseif  agro.type == "dod" and hit.type == "del6" then
    knapp1.alpha = 0
    --print( "dod og del6" )
elseif  agro.type == "dod" and hit.type == "del7" then
    knapp1.alpha = 0
    --print( "dod og del7" )
elseif  agro.type == "dod" and hit.type == "del8" then
    knapp1.alpha = 0
    --print( "dod og del8" )
elseif  agro.type == "dod" and hit.type == "del9" then
    knapp1.alpha = 0
    --print( "dod og del9" )



      


            -- lm.resetLevels(dataFile)
goto()


end
end
end
Runtime:addEventListener("collision", onCollision)
------------------------------------------------------------------

local function onCollision1(event)
if event.phase == "began" then
local agro = event.object1
local hit = event.object2
if agro.type == "mal2" and hit.type == "del4" then
    Runtime:removeEventListener(collision1)
    print( "mal2vsdel4" )
    del4.isSensor = false
  
           lm.unlockNextLevel()
 

 goto2()
end
end
end
Runtime:addEventListener("collision", onCollision1)
------------------------------------------------------------------


local function ferdi()
    print( "hdh" )
      transition.cancel(tran)
end

local tran 
-- Gjort lokal 2026-09-10 (var utilsiktet global, aldri kalt fra
-- noe annet sted i spillet).
local function kill(obj)
display.remove(obj)
obj=nil
end    











 




local function onCollision2(event)

if event.phase == "ended" then

if  
    
    (event.object1.type == "del1" and event.object2.type == "firkant1") or
    (event.object1.type == "del2" and event.object2.type == "firkant1") or
    (event.object1.type == "del3" and event.object2.type == "firkant1") or
    (event.object1.type == "del4" and event.object2.type == "firkant1") or
    (event.object1.type == "del5" and event.object2.type == "firkant1") or
    (event.object1.type == "del6" and event.object2.type == "firkant1") or
    (event.object1.type == "del7" and event.object2.type == "firkant1") or
    (event.object1.type == "del8" and event.object2.type == "firkant1") or
    (event.object1.type == "del9" and event.object2.type == "firkant1") or
    (event.object1.type == "del1" and event.object2.type == "firkant2") or
    (event.object1.type == "del2" and event.object2.type == "firkant2") or
    (event.object1.type == "del3" and event.object2.type == "firkant2") or
    (event.object1.type == "del4" and event.object2.type == "firkant2") or
    (event.object1.type == "del5" and event.object2.type == "firkant2") or
    (event.object1.type == "del6" and event.object2.type == "firkant2") or
    (event.object1.type == "del7" and event.object2.type == "firkant2") or
    (event.object1.type == "del8" and event.object2.type == "firkant2") or
    (event.object1.type == "del9" and event.object2.type == "firkant2") or
    (event.object1.type == "del1" and event.object2.type == "firkant3") or
    (event.object1.type == "del2" and event.object2.type == "firkant3") or
    (event.object1.type == "del3" and event.object2.type == "firkant3") or
    (event.object1.type == "del4" and event.object2.type == "firkant3") or
    (event.object1.type == "del5" and event.object2.type == "firkant3") or
    (event.object1.type == "del6" and event.object2.type == "firkant3") or
    (event.object1.type == "del7" and event.object2.type == "firkant3") or
    (event.object1.type == "del8" and event.object2.type == "firkant3") or
    (event.object1.type == "del9" and event.object2.type == "firkant3") or
    (event.object1.type == "del1" and event.object2.type == "firkant4") or
    (event.object1.type == "del2" and event.object2.type == "firkant4") or
    (event.object1.type == "del3" and event.object2.type == "firkant4") or
    (event.object1.type == "del4" and event.object2.type == "firkant4") or
    (event.object1.type == "del5" and event.object2.type == "firkant4") or
    (event.object1.type == "del6" and event.object2.type == "firkant4") or
    (event.object1.type == "del7" and event.object2.type == "firkant4") or
    (event.object1.type == "del8" and event.object2.type == "firkant4") or
    (event.object1.type == "del9" and event.object2.type == "firkant4") then





--end

local   stov        = display.newImageRect("stov.png", 20,20)
        stov.width  = 10+(math.random(10, 50)) 
        stov.height = stov.width
        stov.x      = event.object1.x+(math.random(1, 10)) 
        stov.y      = event.object1.y-(math.random(1, 10))
        rot         = (math.random(1,360)) 
        stov.alpha  = 0.1
        stov:rotate( rot )
        grp:insert(stov)
        camera:add (stov,1,false)





local tran= transition.to (stov, {

                                    x          = stov.x      - (math.random(-50, 50)),
                                    y          = stov.y      - (math.random( 1, 50)),
                                    width      = stov.width  + (math.random(1, 50)),
                                    height     = stov.height + (math.random(1, 50)),
                                    alpha      = 0,
                                    time       = 2000,
                                    onComplete = function ()display.remove( stov ) stov = nil
    end} ) 

                                    
              
    ---if tran ~= nil then
  --  transition.cancel(tran)
   -- end

            return stov
         end   
   end
end
Runtime:addEventListener("collision", onCollision2)
----------------------------------------------------------------------------------

















local function knekk(event)
if event.phase == "began" then
local agro = event.object1
local hit = event.object2

if  (event.object1.type == "knott1" and event.object2.type == "knott2") then

print( "knott1 og knott2" )

elseif  (event.object1.type == "knott2" and event.object2.type == "knott3") then

knapp1.alpha = 0
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)
pivot_joint.isMotorEnabled  = false
pivot_joint1.isMotorEnabled = false
pivot_joint2.isMotorEnabled = false
pivot_joint3.isMotorEnabled = false
pivot_joint4.isMotorEnabled = false
pivot_joint5.isMotorEnabled = false
pivot_joint6.isMotorEnabled = false
pivot_joint7.isMotorEnabled = false
display.remove(pivot_joint1)
display.remove(knott2)
knott2 = nil
camera:setFocus( del9 )
print( "knott2 og knott3" )


local blod = display.newImageRect("blod.png", 20,20)
blod.width = 10+(math.random(10, 50)) 
blod.height = blod.width
blod.x = event.object1.x+(math.random(1, 10)) 
blod.y = event.object1.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod:rotate( rot )
blod.alpha =1
camera:add (blod,1,false)

      transition.to( blod, { x = blod.x +- (math.random(-50, 50)),
                             y = blod.y - (math.random( 1, 50)),
                             width = blod.width + (math.random(1, 50)),
                             height = blod.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
                
                
local blod2 = display.newImageRect("blod.png", 20,20)
blod2.width = 10+(math.random(10, 50)) 
blod2.height = blod2.width
blod2.x = event.object2.x+(math.random(1, 10)) 
blod2.y = event.object2.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod2:rotate( rot )
blod2.alpha =1
camera:add (blod2,1,false)

      transition.to( blod2, { x = blod2.x +- (math.random(-50, 50)),
                             y = blod2.y - (math.random( 1, 50)),
                             width = blod2.width + (math.random(1, 50)),
                             height = blod2.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )

local eventTimer = timer.performWithDelay( 3000, goto)

elseif  (event.object1.type == "knott3" and event.object2.type == "knott4") then

knapp1.alpha = 0
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)
pivot_joint.isMotorEnabled  = false
pivot_joint1.isMotorEnabled = false
pivot_joint2.isMotorEnabled = false
pivot_joint3.isMotorEnabled = false
pivot_joint4.isMotorEnabled = false
pivot_joint5.isMotorEnabled = false
pivot_joint6.isMotorEnabled = false
pivot_joint7.isMotorEnabled = false
display.remove(pivot_joint2)
display.remove(knott3)
knott3 = nil
camera:setFocus( del9 )
print( "knott3 og knott4" )

local blod = display.newImageRect("blod.png", 20,20)
blod.width = 10+(math.random(10, 50)) 
blod.height = blod.width
blod.x = event.object1.x+(math.random(1, 10)) 
blod.y = event.object1.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod:rotate( rot )
blod.alpha =1
camera:add (blod,1,false)

      transition.to( blod, { x = blod.x +- (math.random(-50, 50)),
                             y = blod.y - (math.random( 1, 50)),
                             width = blod.width + (math.random(1, 50)),
                             height = blod.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
                
                
local blod2 = display.newImageRect("blod.png", 20,20)
blod2.width = 10+(math.random(10, 50)) 
blod2.height = blod2.width
blod2.x = event.object2.x+(math.random(1, 10)) 
blod2.y = event.object2.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod2:rotate( rot )
blod2.alpha =1
camera:add (blod2,1,false)

      transition.to( blod2, { x = blod2.x +- (math.random(-50, 50)),
                             y = blod2.y - (math.random( 1, 50)),
                             width = blod2.width + (math.random(1, 50)),
                             height = blod2.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
            
local eventTimer = timer.performWithDelay( 3000, goto)


elseif  (event.object1.type == "knott4" and event.object2.type == "knott5") then

knapp1.alpha = 0
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)
pivot_joint.isMotorEnabled  = false
pivot_joint1.isMotorEnabled = false
pivot_joint2.isMotorEnabled = false
pivot_joint3.isMotorEnabled = false
pivot_joint4.isMotorEnabled = false
pivot_joint5.isMotorEnabled = false
pivot_joint6.isMotorEnabled = false
pivot_joint7.isMotorEnabled = false
display.remove(pivot_joint3)
display.remove(knott4)
knott4 = nil
camera:setFocus( del9 )
print( "knott4 og knott5" )

local blod = display.newImageRect("blod.png", 20,20)
blod.width = 10+(math.random(10, 50)) 
blod.height = blod.width
blod.x = event.object1.x+(math.random(1, 10)) 
blod.y = event.object1.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod:rotate( rot )
blod.alpha =1
camera:add (blod,1,false)

      transition.to( blod, { x = blod.x +- (math.random(-50, 50)),
                             y = blod.y - (math.random( 1, 50)),
                             width = blod.width + (math.random(1, 50)),
                             height = blod.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
                
                
local blod2 = display.newImageRect("blod.png", 20,20)
blod2.width = 10+(math.random(10, 50)) 
blod2.height = blod2.width
blod2.x = event.object2.x+(math.random(1, 10)) 
blod2.y = event.object2.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod2:rotate( rot )
blod2.alpha =1
camera:add (blod2,1,false)

      transition.to( blod2, { x = blod2.x +- (math.random(-50, 50)),
                             y = blod2.y - (math.random( 1, 50)),
                             width = blod2.width + (math.random(1, 50)),
                             height = blod2.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
            
local eventTimer = timer.performWithDelay( 3000, goto)


elseif  (event.object1.type == "knott5" and event.object2.type == "knott6") then

knapp1.alpha = 0
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)
pivot_joint.isMotorEnabled  = false
pivot_joint1.isMotorEnabled = false
pivot_joint2.isMotorEnabled = false
pivot_joint3.isMotorEnabled = false
pivot_joint4.isMotorEnabled = false
pivot_joint5.isMotorEnabled = false
pivot_joint6.isMotorEnabled = false
pivot_joint7.isMotorEnabled = false
display.remove(pivot_joint4)
display.remove(knott5)
knott5 = nil
camera:setFocus( del9 )
print( "knott5 og knott6" )

local blod = display.newImageRect("blod.png", 20,20)
blod.width = 10+(math.random(10, 50)) 
blod.height = blod.width
blod.x = event.object1.x+(math.random(1, 10)) 
blod.y = event.object1.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod:rotate( rot )
blod.alpha =1
camera:add (blod,1,false)

      transition.to( blod, { x = blod.x +- (math.random(-50, 50)),
                             y = blod.y - (math.random( 1, 50)),
                             width = blod.width + (math.random(1, 50)),
                             height = blod.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
                
                
local blod2 = display.newImageRect("blod.png", 20,20)
blod2.width = 10+(math.random(10, 50)) 
blod2.height = blod2.width
blod2.x = event.object2.x+(math.random(1, 10)) 
blod2.y = event.object2.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod2:rotate( rot )
blod2.alpha =1
camera:add (blod2,1,false)

      transition.to( blod2, { x = blod2.x +- (math.random(-50, 50)),
                             y = blod2.y - (math.random( 1, 50)),
                             width = blod2.width + (math.random(1, 50)),
                             height = blod2.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
            
local eventTimer = timer.performWithDelay( 3000, goto)

elseif  (event.object1.type == "knott6" and event.object2.type == "knott7") then

knapp1.alpha = 0
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)
pivot_joint.isMotorEnabled  = false
pivot_joint1.isMotorEnabled = false
pivot_joint2.isMotorEnabled = false
pivot_joint3.isMotorEnabled = false
pivot_joint4.isMotorEnabled = false
pivot_joint5.isMotorEnabled = false
pivot_joint6.isMotorEnabled = false
pivot_joint7.isMotorEnabled = false
display.remove(pivot_joint5)
display.remove(knott6)
knott6 = nil
camera:setFocus( del9 )
print( "knott6 og knott7" )

local blod = display.newImageRect("blod.png", 20,20)
blod.width = 10+(math.random(10, 50)) 
blod.height = blod.width
blod.x = event.object1.x+(math.random(1, 10)) 
blod.y = event.object1.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod:rotate( rot )
blod.alpha =1
camera:add (blod,1,false)

      transition.to( blod, { x = blod.x +- (math.random(-50, 50)),
                             y = blod.y - (math.random( 1, 50)),
                             width = blod.width + (math.random(1, 50)),
                             height = blod.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
                
                
local blod2 = display.newImageRect("blod.png", 20,20)
blod2.width = 10+(math.random(10, 50)) 
blod2.height = blod2.width
blod2.x = event.object2.x+(math.random(1, 10)) 
blod2.y = event.object2.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod2:rotate( rot )
blod2.alpha =1
camera:add (blod2,1,false)

      transition.to( blod2, { x = blod2.x +- (math.random(-50, 50)),
                             y = blod2.y - (math.random( 1, 50)),
                             width = blod2.width + (math.random(1, 50)),
                             height = blod2.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
            
local eventTimer = timer.performWithDelay( 3000, goto)

elseif  (event.object1.type == "knott7" and event.object2.type == "knott8") then

knapp1.alpha = 0
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)
pivot_joint.isMotorEnabled  = false
pivot_joint1.isMotorEnabled = false
pivot_joint2.isMotorEnabled = false
pivot_joint3.isMotorEnabled = false
pivot_joint4.isMotorEnabled = false
pivot_joint5.isMotorEnabled = false
pivot_joint6.isMotorEnabled = false
pivot_joint7.isMotorEnabled = false
display.remove(pivot_joint6)
display.remove(knott7)
knott7 = nil
camera:setFocus( del9 )
print( "knott7 og knott8" )

local blod = display.newImageRect("blod.png", 20,20)
blod.width = 10+(math.random(10, 50)) 
blod.height = blod.width
blod.x = event.object1.x+(math.random(1, 10)) 
blod.y = event.object1.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod:rotate( rot )
blod.alpha =1
camera:add (blod,1,false)

      transition.to( blod, { x = blod.x +- (math.random(-50, 50)),
                             y = blod.y - (math.random( 1, 50)),
                             width = blod.width + (math.random(1, 50)),
                             height = blod.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
                
                
local blod2 = display.newImageRect("blod.png", 20,20)
blod2.width = 10+(math.random(10, 50)) 
blod2.height = blod2.width
blod2.x = event.object2.x+(math.random(1, 10)) 
blod2.y = event.object2.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod2:rotate( rot )
blod2.alpha =1
camera:add (blod2,1,false)

      transition.to( blod2, { x = blod2.x +- (math.random(-50, 50)),
                             y = blod2.y - (math.random( 1, 50)),
                             width = blod2.width + (math.random(1, 50)),
                             height = blod2.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
            
local eventTimer = timer.performWithDelay( 3000, goto)

elseif  (event.object1.type == "knott8" and event.object2.type == "knott9") then

knapp1.alpha = 0
Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)
pivot_joint.isMotorEnabled  = false
pivot_joint1.isMotorEnabled = false
pivot_joint2.isMotorEnabled = false
pivot_joint3.isMotorEnabled = false
pivot_joint4.isMotorEnabled = false
pivot_joint5.isMotorEnabled = false
pivot_joint6.isMotorEnabled = false
pivot_joint7.isMotorEnabled = false
display.remove(pivot_joint7)
display.remove(knott8)
knott8 = nil
camera:setFocus( del9 )
print( "knott8 og knott9" )

local blod = display.newImageRect("blod.png", 20,20)
blod.width = 10+(math.random(10, 50)) 
blod.height = blod.width
blod.x = event.object1.x+(math.random(1, 10)) 
blod.y = event.object1.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod:rotate( rot )
blod.alpha =1
camera:add (blod,1,false)

      transition.to( blod, { x = blod.x +- (math.random(-50, 50)),
                             y = blod.y - (math.random( 1, 50)),
                             width = blod.width + (math.random(1, 50)),
                             height = blod.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
                
                
local blod2 = display.newImageRect("blod.png", 20,20)
blod2.width = 10+(math.random(10, 50)) 
blod2.height = blod2.width
blod2.x = event.object2.x+(math.random(1, 10)) 
blod2.y = event.object2.y-(math.random(1, 10))
rot = (math.random(1,360)) 
blod2:rotate( rot )
blod2.alpha =1
camera:add (blod2,1,false)

      transition.to( blod2, { x = blod2.x +- (math.random(-50, 50)),
                             y = blod2.y - (math.random( 1, 50)),
                             width = blod2.width + (math.random(1, 50)),
                             height = blod2.height + (math.random(1, 50)),
                             alpha = 0,
                             time = 2000,
                             onComplete = function ()display.remove( blod ) end } )
            
  local eventTimer = timer.performWithDelay( 3000, goto)

                end         
       end
end
--Runtime:addEventListener("collision", knekk)
----------------------------------------------------------------------------------



 del1.y = del1.y
 ---------------------------------------------------------
 
 reff = display.newRect (0,0,50,50)
 reff.x = bredde/2
 reff.y = hoyde/2
 reff.alpha = 0
 grp:insert(reff)






 angel = pivot_joint1.Rotation





    -------------------
--Ferdig spill
    camera.x=-100
    camera.y=-50


 --camera.x=-150
--camera.y=-50



    ----------------------------------
        camera:add (knapp1,2,false)
    ----------------------------------
    camera:add (background,6,false)
    ----------------------------------
    camera:add (background1b,5,false)
    camera:add (background2b,5,false)
    camera:add (background3b,5,false)
    camera:add (background4b,5,false)
    camera:add (background5b,5,false)
    camera:add (background6b,5,false)
    camera:add (background7b,5,false)
    camera:add (background8b,5,false)
    camera:add (background9b,5,false)
    camera:add (background10b,5,false)
    camera:add (background11b,5,false)
    camera:add (background12b,5,false)
    ----------------------------------
    camera:add (background1a,4,false)
    camera:add (background2a,4,false)
    camera:add (background3a,4,false)
    camera:add (background4a,4,false)
    camera:add (background5a,4,false)
    camera:add (background6a,4,false)
    camera:add (background7a,4,false)
    camera:add (background8a,4,false)
    camera:add (background9a,4,false)
    camera:add (background10a,4,false)
    camera:add (background11a,4,false)
    camera:add (background12a,4,false)
    ----------------------------------
    
    camera:add (background1,3,false)
    camera:add (background2,3,false)
    camera:add (background3,3,false)
    camera:add (background4,3,false)
    camera:add (background5,3,false)
    camera:add (background6,3,false)
    camera:add (background7,3,false)
    camera:add (background8,3,false)
    camera:add (background9,3,false)
    camera:add (background10,3,false)
    camera:add (background11,3,false)
    camera:add (background12,3,false)
    -----------------------------------
    camera:add (firkant1,1,false)
    camera:add (firkant2,1,false)
    camera:add (firkant3,1,false)
    camera:add (firkant4,1,false)
    ----------------------------------
    camera:add (punkt,1,false)
    camera:add (del1,1,false)
    camera:add (del2,1,false)
    camera:add (del3,1,false)
    camera:add (del4,1,false)
    camera:add (del5,1,false)
    camera:add (del6,1,false)
    camera:add (del7,1,false)
    camera:add (del8,1,false)
    camera:add (del9,1,false)
    


    --camera:add (del77,1,false)
    camera:setFocus( punkt )
    
    local levelWidth = camera:layer(6).width
    local levelHeight = camera:layer(6).height
    camera:setParallax( 0.30, 0.25, 0.20, 0.15, 0.10 )
    camera:setBounds(0, firkant4.x+firkant4.width/3 , 0, firkant4.y+firkant4.height/3)
    camera.damping = 10
    --camera.damping = 30
    camera:track()
    grp:insert(camera)
    camera:toBack()
camera:layer(2).parallaxRatio=0
local sqCenterX, sqCenterY = reff:localToContent( 0, 0 )


grp.xScale = scaleFactor
grp.yScale = scaleFactor



-- Dobbeltklikk skal gjøre marken helt slapp (motorene på leddene av).
-- Samme fiks som level1.lua (2026-09-10): brukte før Runtime "tap"-
-- eventet sin event.numTaps == 2, som ikke synkroniserte pålitelig med
-- HTML5-eksportens musekklikk. "ended"-fasen satte i tillegg alltid
-- motorene på igjen uansett, så selv et riktig oppdaget dobbeltklikk
-- ville blitt slått av ved neste berøring. Oppdager nå dobbeltklikk selv
-- ved å måle tid mellom to "began"-faser, og "ended" lar motorene være
-- av når marken er slapp.
 local isLimp = false
 local sisteBegan = 0
 local dobbeltklikkVindu = 300 -- ms

 trykk_knapp = function( event )
    if event.phase == "began" then
            local naa = system.getTimer()
            if ( naa - sisteBegan ) < dobbeltklikkVindu then
                isLimp = not isLimp
                print( "marken slapp: " .. tostring(isLimp) )
            end
            sisteBegan = naa

            if isLimp then
                pivot_joint.isMotorEnabled = false
                pivot_joint1.isMotorEnabled = false
                pivot_joint2.isMotorEnabled = false
                pivot_joint3.isMotorEnabled = false
                pivot_joint4.isMotorEnabled = false
                pivot_joint5.isMotorEnabled = false
                pivot_joint6.isMotorEnabled = false
                pivot_joint7.isMotorEnabled = false
            else
                print( "knapp" )
                pivot_joint.isMotorEnabled = true
                pivot_joint.motorSpeed  = pivot_joint.motorSpeed - 80
                pivot_joint1.isMotorEnabled = true
                pivot_joint1.motorSpeed = pivot_joint.motorSpeed - 80
                pivot_joint2.isMotorEnabled = true
                pivot_joint2.motorSpeed = pivot_joint.motorSpeed - 80
                pivot_joint3.isMotorEnabled = true
                pivot_joint3.motorSpeed = pivot_joint.motorSpeed - 80
                pivot_joint4.isMotorEnabled = true
                pivot_joint4.motorSpeed = pivot_joint.motorSpeed - 80
                pivot_joint5.isMotorEnabled = true
                pivot_joint5.motorSpeed = pivot_joint.motorSpeed - 80
                pivot_joint6.isMotorEnabled = true
                pivot_joint6.motorSpeed = pivot_joint.motorSpeed - 80
                pivot_joint7.isMotorEnabled = true
                pivot_joint7.motorSpeed = pivot_joint.motorSpeed - 80
            end

    elseif event.phase == "ended" then
            if not isLimp then
                pivot_joint.isMotorEnabled = true
                pivot_joint.motorSpeed = 30
                pivot_joint1.isMotorEnabled = true
                pivot_joint1.motorSpeed = 30
                pivot_joint2.isMotorEnabled = true
                pivot_joint2.motorSpeed = 30
                pivot_joint3.isMotorEnabled = true
                pivot_joint3.motorSpeed = 30
                pivot_joint4.isMotorEnabled = true
                pivot_joint4.motorSpeed = 30
                pivot_joint5.isMotorEnabled = true
                pivot_joint5.motorSpeed = 30
                pivot_joint6.isMotorEnabled = true
                pivot_joint6.motorSpeed = 30
                pivot_joint7.isMotorEnabled = true
                pivot_joint7.motorSpeed = 30
            end

    end
end
Runtime:addEventListener( "touch", trykk_knapp)



       local options = {isModal = true,effect = "fade",time = 500,}



local function trykk_knapp1( event )
    if event.phase == "began" then
       physics.pause( )
        print( "knapp1" )
       -- hent(liv)
        --knapp1.alpha = 0
         --Runtime:removeEventListener( "touch", trykk_knapp)
--Runtime:removeEventListener( "tap", trykk_knapp)

         composer.showOverlay( "scenes.pausemenu1",options)
         return true 
    elseif event.phase == "ended" then
       --camera:destroy()
        --camera                               =nil
        
    end
end
knapp1:addEventListener( "touch", trykk_knapp1)


end



function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase
    if ( phase == "will" ) then
        print ("level1 scene:show will")
    elseif ( phase == "did" ) then
        print ("level1 scene:show did")
        --last:pause()
        composer.removeScene("scenes.chooselevel")
        display.remove( last )
        last = nil
    end
end


function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase
    if ( phase == "will" ) then
        --physics.stop( )
       --punktsant = false
      
       print ("level1 scene:hide will")
   elseif ( phase == "did" ) then
       print ("level1 scene:hide did")
camera:destroy()
        camera=nil


      -- camera:setFocus( nil )

Runtime:removeEventListener("collision", onCollision)
Runtime:removeEventListener( "touch", trykk_knapp)
Runtime:removeEventListener( "tap", trykk_knapp)
Runtime:removeEventListener("collision", knekk)


composer.removeScene ("scenes.pausemenu1")

       composer.removeScene ("scenes.level1")









   end
end


function scene:destroy( event )

    local sceneGroup = self.view
        print ("level1 scene:destroy did")
    
        
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene