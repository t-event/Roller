
--[[

local bredde = display.contentWidth

local hoyde = display.contentHeight

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
local liv_igjen = 30


-----------------------------
-- PRIVATE FUNCTIONS
-----------------------------
local function setHighScore()
    if liv_igjen > 50 then
        liv_igjen = liv_igjen
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
        print("score saved!")
    end

    file = nil
end

local function saveliv()
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
        print( "Loaded Score: ", liv_igjen )
        -- Close the file handle
        io.close( file )
    end

    file = nil
end

-----------------------------
-- PUBLIC FUNCTIONS
-----------------------------
function liv.new()
end

-- *** NOTE ***
-- save() and load() doesn't check if the file exists!
function liv.saveliv()
    saveScore()
end

function liv.lastliv()
    loadScore()
end

function liv.endreliv( val )
    liv_igjen = liv_igjen-val
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
 
