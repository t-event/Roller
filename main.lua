display.setStatusBar( display.HiddenStatusBar )

local composer = require( "composer" )

 
require "ssk2.loadSSK"
_G.ssk.init( { html5 = true } )
if system.getInfo( "platformName" ) ~= "HTML5" then
	aaa = ssk.meters.create_fps(  true )
	bbb = ssk.meters.create_mem( true )
end

composer.gotoScene( "gotolevel1" )

 


local function myUnhandledErrorListener( event )

    local iHandledTheError = true

    if iHandledTheError then
        print( "Handling the unhandled error", event.errorMessage )
    else
        print( "Not handling the unhandled error", event.errorMessage )
    end
    
    return iHandledTheError
end

Runtime:addEventListener("unhandledError", myUnhandledErrorListener)


local function touched(event)
	
	if event.phase == "began"  then
		

		collectgarbage()
		
		print( "MemUsage (in KB): " .. collectgarbage("count") )
		
		system.getInfo( "textureMemoryUsed" )
		
		print( "textureMemoryUsed is " .. system.getInfo( "textureMemoryUsed" )/1000  )
		
	end
end



Runtime : addEventListener( "touch", touched )


