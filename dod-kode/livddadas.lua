
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


local game = {}

-- File path to the score file 
local score_file_path = system.pathForFile( "score.txt", system.DocumentsDirectory )
local current_score = 30
local high_score = 0

-----------------------------
-- PRIVATE FUNCTIONS
-----------------------------
local function setHighScore()
    if current_score > high_score then
        high_score = current_score
    end
end

local function saveHighScore()
    -- Open the file handle
    local file, errorString = io.open( score_file_path, "w" )

    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Write data to file
        file:write( high_score )
        -- Close the file handle
        io.close( file )
        print("High score saved!")
    end

    file = nil
end

local function loadHighScore()
    -- Open the file handle
    local file, errorString = io.open( score_file_path, "r" )

    if not file then
        -- Error occurred; output the cause
        print( "File error: " .. errorString )
    else
        -- Read data from file
        local contents = file:read( "*a" )
        -- Set game.high_score as the content of the file
        high_score = tonumber( contents )
        print( "Loaded High Score: ", high_score )
        -- Close the file handle
        io.close( file )
    end

    file = nil
end

-----------------------------
-- PUBLIC FUNCTIONS
-----------------------------
function game.new()
end

-- *** NOTE ***
-- save() and load() doesn't check if the file exists!
function game.save()
    saveHighScore()
end

function game.load()
    loadHighScore()
end

function game.setScore( val )
    current_score = val
    setHighScore()
end

function game.addToScore( val )
    current_score = current_score + val 
    print("Current score", current_score)
    setHighScore()
end

function game.returnScore()
    return current_score
end

function game.returnHighScore()
    return high_score
end

return game
 
