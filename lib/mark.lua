
local physicsData = (require "lib.shapedefs").physicsData(scaleFactor)


local mark = {}

function mark.hent( event )


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
--[[
     local punkt2 = display.newRect( 200, 200, 10, 10 )
    punkt2.x = firkant4.x*2
    punkt2.y = firkant4.y*2
    punkt2.alpha = 1
    punktsant   = true
    physics.addBody( punkt2,"dynamic")
    punkt2.isSensor = true
    grp:insert(punkt2)
    punkt2:addEventListener ("touch", gameUI.dragBody )
]]--


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
knott4.y = del4.y+15
camera:add(knott4,1,false)
physics.addBody( knott4, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott4.isSensor = true
knott4.alpha = 0

local knott5 = display.newRect( 10,10,10,10 )
knott5.x = del5.x
knott5.y = del5.y+20
camera:add(knott5,1,false)
physics.addBody( knott5, "dynamic",{density = 0.0, friction = 0.0, bounce = 0.0})
knott5.isSensor = true
knott5.alpha = 0

local knott6 = display.newRect( 10,10,10,10 )
knott6.x = del6.x
knott6.y = del6.y+15
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


    camera:add (del1,1,false)
    camera:add (del2,1,false)
    camera:add (del3,1,false)
    camera:add (del4,1,false)
    camera:add (del5,1,false)
    camera:add (del6,1,false)
    camera:add (del7,1,false)
    camera:add (del8,1,false)
    camera:add (del9,1,false)

end


return mark
 