

local bredde = display.contentWidth

local hoyde = display.contentHeight
--[[
local liv = {}

function liv.hent( event )

 liv = 30
 minusliv = 1
 livText = display.newText(liv, bredde-200 ,hoyde-hoyde+25 ,nil ,30)

grp:insert( livText )

liv = liv - minusliv
 
end

return liv
 
--]]


local liv = {}

-- File path to the score file 
local score_file_path = system.pathForFile( "liv.txt", system.DocumentsDirectory )
local liv_igjen = 10


-----------------------------
-- PRIVATE FUNCTIONS
-----------------------------






local function setHighScore()
    if liv_igjen < 1 then
        print( "nullliv" )
       -- liv_igjen = liv_igjen
       liv_igjen = liv_igjen+3
    end
end

local function lagreliv()
    -- Open the file handle
    local file, errorString = io.open( score_file_path, "w" )

    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Write data to file
        file:write( liv_igjen )
        -- Close the file handle
        io.close( file )
        print("Lagret liv!")
    end

    file = nil
end

local function lastliv()
    -- Open the file handle
    local file, errorString = io.open( score_file_path, "r" )

    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Read data from file
        local contents = file:read( "*a" )
        -- Set liv.liv_igjen as the content of the file
        liv_igjen = tonumber( contents )
        print( "Lastet liv: ", liv_igjen )
        -- Close the file handle
        io.close( file )
    end

    file = nil
end


-------------------------------------------------------------------------
function liv.hent( event )
livText = display.newText(liv_igjen, bredde-200 ,hoyde-hoyde+45 ,nil ,30)
grp:insert( livText )

livbilde = display.newImageRect( "mark.png",121,141 )
livbilde.x = livText.x
livbilde.y = livText.y
livbilde.height = 141/2
livbilde.width = 121/2
grp:insert(livbilde)


end
-------------------------------------------------------------------------





-----------------------------
-- PUBLIC FUNCTIONS
-----------------------------
function liv.new()
end

-- *** NOTE ***
-- save() and load() doesn't check if the file exists!
function liv.lagreliv()
    lagreliv()
end

function liv.lastliv()
    lastliv()
end

function liv.endreliv( val )
   
      if liv_igjen == 1 then
        print( "nullliv" )
       -- liv_igjen = liv_igjen
       liv_igjen = liv_igjen+2

   else  liv_igjen = liv_igjen-val
   end
   return true
end

function liv.addToScore( val )
   -- liv_igjen = liv_igjen + val 
    --print("Current score", liv_igjen)
    
end

function liv.returnScore()
    return liv_igjen
end 


return liv
 