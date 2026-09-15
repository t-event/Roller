

local bredde = display.contentWidth

local hoyde = display.contentHeight


local liv = {}

-- File path to the score file
local score_file_path = system.pathForFile( "liv.txt", system.DocumentsDirectory )
local STARTLIV = 10
local liv_igjen = STARTLIV


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

-- Nullstiller liv til startverdien (10). Brukt når spilleren velger å
-- starte helt på nytt fra bane 1 i stedet for å se reklame
-- (scenes/adoffer.lua sin "fortsett uten"-knapp) etter å ha gått tom.
-- Var en tom stub før, per Mathias 2026-09-15: å starte på nytt bør gi
-- fulle liv igjen.
function liv.new()
   liv_igjen = STARTLIV
end

-- *** NOTE ***
-- save() and load() doesn't check if the file exists!
function liv.lagreliv()
    lagreliv()
end

function liv.lastliv()
    lastliv()
end

-- Trekker fra liv, og lar telleren faktisk nå null (rettet 2026-09-10,
-- den gjorde før det motsatte: la til 2 liv i stedet for å trekke fra
-- ved siste liv, så man kunne aldri tape). Klipper ved 0 i stedet for
-- å gå negativ, se liv.erTom() rett under.
function liv.endreliv( val )
   liv_igjen = liv_igjen - val
   if liv_igjen < 0 then
      liv_igjen = 0
   end
   return true
end

-- Sant når spilleren er tom for liv. Brukes til å vise
-- "se reklame for å få liv tilbake"-skjermen (scenes/adoffer.lua,
-- kort reklame = 1 liv, lang reklame = 3, per Ørjan). Reklamen der er
-- fortsatt en placeholder (ikke koblet til noe ekte SDK ennå).
function liv.erTom()
   return liv_igjen <= 0
end

-- Legger til liv, brukt av reklame-for-liv-skjermen (scenes/adoffer.lua)
-- når spilleren er tom for liv. Var en tom stub før (kommentert ut),
-- fylt inn 2026-09-15 siden akkurat dette hooket allerede fantes med
-- riktig navn og var ment for nettopp dette, ifølge kommentaren ved
-- liv.erTom() over.
function liv.addToScore( val )
   liv_igjen = liv_igjen + val
end

function liv.returnScore()
    return liv_igjen
end 


return liv
 