-- Viser hvilken bane man spiller (lagt til 2026-09-28).
--
-- Bruker de samme grå nummersteinene som banevalget (stein1.png ...
-- stein9.png). En stor stein vises midt på skjermen når banen starter
-- og glir bort, og en liten blir liggende øverst til venstre, på samme
-- høyde som livene øverst til høyre.
--
-- Legges i scenegruppa (grp), over kameraet og mørket, som livtelleren.
-- Kalles i banefila rett etter mørket:
--     require( "lib.banenummer" ).vis( 7 )

local M = {}

function M.vis( bane )
	local bilde = "stein" .. bane .. ".png"
	local x = display.screenOriginX + 62
	local y = 45

	local liten = display.newImageRect( bilde, 1000, 868 )
	liten.width, liten.height = 58, 50
	liten.x, liten.y = x, y
	grp:insert( liten )

	local stor = display.newImageRect( bilde, 1000, 868 )
	stor.width, stor.height = 173, 150
	stor.x, stor.y = display.contentCenterX, display.contentCenterY - 60
	grp:insert( stor )
	transition.to( stor, { delay = 1200, time = 700, alpha = 0, x = x, y = y,
		width = 58, height = 50, onComplete = function() display.remove( stor ) end } )
end

return M
