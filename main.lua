display.setStatusBar( display.HiddenStatusBar )

-- Temporary debugging aid: records the last reached checkpoint so a crash
-- overlay can show roughly where things broke, since Solar2D's HTML5
-- command-line builder doesn't support keeping real file/line info in
-- error messages. Safe no-op call, remove once debugging is done.
_G.LAST_CHECKPOINT = "app_start"
function checkpoint( name )
	_G.LAST_CHECKPOINT = name
end

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


