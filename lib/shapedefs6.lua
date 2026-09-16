-- This file is for use with Corona(R) SDK
--
-- Kollisjonsformer for bane 6, generert 2026-09-15 rett fra de nye
-- silhuettene i level6/1-4.png.
--
-- Bane 5 og 6 er tegnet paa nytt denne datoen. Mathias presiserte at han
-- ville ha LOOKEN fra bane 1-4, ikke en kopi av flisene: "Jeg mente jeg
-- ville ha looken, ikke ren kopi. Sa du maa lage nye baner med samme
-- look." Formsproket er derfor lest av den ekte kunsten og bygget om,
-- ikke gjenbrukt.
--
-- Hver form her er ett trapes paa 70 px av en steinskive, med loddrette
-- sider og hjornene paa skivens egen topp- og bunnkurve. Bilde og
-- kollisjon kommer dermed fra nøyaktig samme kurver, ikke fra sporing i
-- ettertid. Trapeser tynnere enn 14 px slippes, slik at de hartynne
-- spissene paa kilene er rent visuelle.
--
-- Koordinatene er bekreftet mot bane 3 og 4 sine egne shapedefs:
--    X = (bildepiksel_x - 1920) * 2,  Y = (bildepiksel_y - 1175.5) * 2
-- og hjornene har positiv signert flate, som alle 400 undersokte
-- fixtures i lib/shapedefs4.lua.
--
-- "del1" (markens egen form) er uendret.
--
-- Usage example:
--			local scaleFactor = 1.0
--			local physicsData = (require "lib.shapedefs6").physicsData(scaleFactor)
--			local shape = display.newImage("objectname.png")
--			physics.addBody( shape, physicsData:get("objectname") )
--

-- copy needed functions to local scope
local unpack = unpack
local pairs = pairs
local ipairs = ipairs

local M = {}

function M.physicsData(scale)
	local physics = { data =
	{
		["1"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -2059  ,  -3640, -1969  ,  -3640, -1659  ,  -3840, -1738  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1738  ,  -3640, -1659  ,  -3640, -1348  ,  -3840, -1418  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1418  ,  -3640, -1348  ,  -3640, -1038  ,  -3840, -1097  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1097  ,  -3640, -1038  ,  -3640, -727  ,  -3840, -777  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -777  ,  -3640, -727  ,  -3640, -417  ,  -3840, -456  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -456  ,  -3640, -417  ,  -3640, -106  ,  -3840, -135  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -135  ,  -3640, -106  ,  -3640, 204  ,  -3840, 185  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 185  ,  -3640, 204  ,  -3640, 515  ,  -3840, 506  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 506  ,  -3640, 515  ,  -3640, 825  ,  -3840, 826  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 826  ,  -3640, 825  ,  -3640, 1136  ,  -3840, 1147  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1147  ,  -3640, 1136  ,  -3640, 1446  ,  -3840, 1467  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1969  ,  -3440, -1880  ,  -3440, -1581  ,  -3640, -1659  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1659  ,  -3440, -1581  ,  -3440, -1281  ,  -3640, -1348  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1348  ,  -3440, -1281  ,  -3440, -982  ,  -3640, -1038  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1038  ,  -3440, -982  ,  -3440, -683  ,  -3640, -727  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -727  ,  -3440, -683  ,  -3440, -384  ,  -3640, -417  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -417  ,  -3440, -384  ,  -3440, -84  ,  -3640, -106  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -106  ,  -3440, -84  ,  -3440, 215  ,  -3640, 204  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 204  ,  -3440, 215  ,  -3440, 514  ,  -3640, 515  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 515  ,  -3440, 514  ,  -3440, 813  ,  -3640, 825  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 825  ,  -3440, 813  ,  -3440, 1113  ,  -3640, 1136  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1136  ,  -3440, 1113  ,  -3440, 1412  ,  -3640, 1446  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1880  ,  -3240, -1791  ,  -3240, -1475  ,  -3440, -1551  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1551  ,  -3240, -1475  ,  -3240, -1159  ,  -3440, -1222  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1222  ,  -3240, -1159  ,  -3240, -844  ,  -3440, -892  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -892  ,  -3240, -844  ,  -3240, -528  ,  -3440, -563  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -563  ,  -3240, -528  ,  -3240, -212  ,  -3440, -234  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -234  ,  -3240, -212  ,  -3240, 103  ,  -3440, 95  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 95  ,  -3240, 103  ,  -3240, 419  ,  -3440, 424  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 424  ,  -3240, 419  ,  -3240, 735  ,  -3440, 753  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 753  ,  -3240, 735  ,  -3240, 1050  ,  -3440, 1083  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1083  ,  -3240, 1050  ,  -3240, 1366  ,  -3440, 1412  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1791  ,  -3040, -1701  ,  -3040, -1400  ,  -3240, -1475  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1475  ,  -3040, -1400  ,  -3040, -1099  ,  -3240, -1159  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1159  ,  -3040, -1099  ,  -3040, -798  ,  -3240, -844  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -844  ,  -3040, -798  ,  -3040, -497  ,  -3240, -528  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -528  ,  -3040, -497  ,  -3040, -196  ,  -3240, -212  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -212  ,  -3040, -196  ,  -3040, 105  ,  -3240, 103  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 103  ,  -3040, 105  ,  -3040, 407  ,  -3240, 419  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 419  ,  -3040, 407  ,  -3040, 708  ,  -3240, 735  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 735  ,  -3040, 708  ,  -3040, 1009  ,  -3240, 1050  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1050  ,  -3040, 1009  ,  -3040, 1310  ,  -3240, 1366  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1701  ,  -2840, -1612  ,  -2840, -1295  ,  -3040, -1367  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1367  ,  -2840, -1295  ,  -2840, -978  ,  -3040, -1032  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1032  ,  -2840, -978  ,  -2840, -661  ,  -3040, -697  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -697  ,  -2840, -661  ,  -2840, -344  ,  -3040, -363  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -363  ,  -2840, -344  ,  -2840, -27  ,  -3040, -28  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -28  ,  -2840, -27  ,  -2840, 290  ,  -3040, 306  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 306  ,  -2840, 290  ,  -2840, 607  ,  -3040, 641  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 641  ,  -2840, 607  ,  -2840, 924  ,  -3040, 975  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 975  ,  -2840, 924  ,  -2840, 1241  ,  -3040, 1310  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1612  ,  -2640, -1524  ,  -2640, -1227  ,  -2840, -1295  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1295  ,  -2640, -1227  ,  -2640, -929  ,  -2840, -978  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -978  ,  -2640, -929  ,  -2640, -632  ,  -2840, -661  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -661  ,  -2640, -632  ,  -2640, -335  ,  -2840, -344  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -344  ,  -2640, -335  ,  -2640, -37  ,  -2840, -27  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -27  ,  -2640, -37  ,  -2640, 260  ,  -2840, 290  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 290  ,  -2640, 260  ,  -2640, 558  ,  -2840, 607  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 607  ,  -2640, 558  ,  -2640, 855  ,  -2840, 924  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 924  ,  -2640, 855  ,  -2640, 1153  ,  -2840, 1241  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1524  ,  -2440, -1441  ,  -2440, -1130  ,  -2640, -1190  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1190  ,  -2440, -1130  ,  -2440, -820  ,  -2640, -855  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -855  ,  -2440, -820  ,  -2440, -509  ,  -2640, -520  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -520  ,  -2440, -509  ,  -2440, -199  ,  -2640, -186  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -186  ,  -2440, -199  ,  -2440, 112  ,  -2640, 149  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 149  ,  -2440, 112  ,  -2440, 422  ,  -2640, 484  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 484  ,  -2440, 422  ,  -2440, 733  ,  -2640, 818  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 818  ,  -2440, 733  ,  -2440, 1044  ,  -2640, 1153  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1441  ,  -2240, -1357  ,  -2240, -1069  ,  -2440, -1130  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1130  ,  -2240, -1069  ,  -2240, -782  ,  -2440, -820  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -820  ,  -2240, -782  ,  -2240, -494  ,  -2440, -509  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -509  ,  -2240, -494  ,  -2240, -206  ,  -2440, -199  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -199  ,  -2240, -206  ,  -2240, 81  ,  -2440, 112  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 112  ,  -2240, 81  ,  -2240, 369  ,  -2440, 422  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 422  ,  -2240, 369  ,  -2240, 656  ,  -2440, 733  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 733  ,  -2240, 656  ,  -2240, 944  ,  -2440, 1044  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1357  ,  -2040, -1268  ,  -2040, -959  ,  -2240, -1028  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1028  ,  -2040, -959  ,  -2040, -649  ,  -2240, -699  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -699  ,  -2040, -649  ,  -2040, -340  ,  -2240, -371  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -371  ,  -2040, -340  ,  -2040, -30  ,  -2240, -42  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -42  ,  -2040, -30  ,  -2040, 280  ,  -2240, 287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 287  ,  -2040, 280  ,  -2040, 589  ,  -2240, 615  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 615  ,  -2040, 589  ,  -2040, 899  ,  -2240, 944  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -1268  ,  -1840, -1176  ,  -1840, -876  ,  -2040, -959  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -959  ,  -1840, -876  ,  -1840, -577  ,  -2040, -649  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -649  ,  -1840, -577  ,  -1840, -277  ,  -2040, -340  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -340  ,  -1840, -277  ,  -1840, 22  ,  -2040, -30  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -30  ,  -1840, 22  ,  -1840, 322  ,  -2040, 280  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 280  ,  -1840, 322  ,  -1840, 621  ,  -2040, 589  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 589  ,  -1840, 621  ,  -1840, 921  ,  -2040, 899  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -1176  ,  -1640, -1080  ,  -1640, -786  ,  -1840, -876  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -876  ,  -1640, -786  ,  -1640, -491  ,  -1840, -577  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -577  ,  -1640, -491  ,  -1640, -197  ,  -1840, -277  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -277  ,  -1640, -197  ,  -1640, 97  ,  -1840, 22  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 22  ,  -1640, 97  ,  -1640, 392  ,  -1840, 322  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 322  ,  -1640, 392  ,  -1640, 686  ,  -1840, 621  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 621  ,  -1640, 686  ,  -1640, 981  ,  -1840, 921  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -1080  ,  -1544, -1033  ,  -1544, -1021  ,  -1640, -737  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -737  ,  -1544, -1021  ,  -1544, -1009  ,  -1640, -393  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -393  ,  -1544, -1009  ,  -1544, -998  ,  -1640, -50  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -50  ,  -1544, -998  ,  -1544, -986  ,  -1640, 294  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 294  ,  -1544, -986  ,  -1544, -974  ,  -1640, 637  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 637  ,  -1544, -974  ,  -1544, -963  ,  -1640, 981  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -549  ,  -1036, -481  ,  -1036, -164  ,  -1236, -538  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -538  ,  -1036, -164  ,  -1036, 152  ,  -1236, -527  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -527  ,  -1036, 152  ,  -1036, 468  ,  -1236, -516  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -516  ,  -1036, 468  ,  -1036, 785  ,  -1236, -505  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -505  ,  -1036, 785  ,  -1036, 1101  ,  -1236, -494  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -494  ,  -1036, 1101  ,  -1036, 1417  ,  -1236, -483  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, -481  ,  -836, -443  ,  -836, -125  ,  -1036, -164  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, -164  ,  -836, -125  ,  -836, 193  ,  -1036, 152  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, 152  ,  -836, 193  ,  -836, 511  ,  -1036, 468  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, 468  ,  -836, 511  ,  -836, 829  ,  -1036, 785  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, 785  ,  -836, 829  ,  -836, 1147  ,  -1036, 1101  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, 1101  ,  -836, 1147  ,  -836, 1465  ,  -1036, 1417  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, -443  ,  -636, -425  ,  -636, -100  ,  -836, -125  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, -125  ,  -636, -100  ,  -636, 224  ,  -836, 193  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, 193  ,  -636, 224  ,  -636, 549  ,  -836, 511  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, 511  ,  -636, 549  ,  -636, 873  ,  -836, 829  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, 829  ,  -636, 873  ,  -636, 1198  ,  -836, 1147  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, 1147  ,  -636, 1198  ,  -636, 1522  ,  -836, 1465  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, -425  ,  -436, -407  ,  -436, -72  ,  -636, -100  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, -100  ,  -436, -72  ,  -436, 263  ,  -636, 224  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, 224  ,  -436, 263  ,  -436, 598  ,  -636, 549  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, 549  ,  -436, 598  ,  -436, 932  ,  -636, 873  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, 873  ,  -436, 932  ,  -436, 1267  ,  -636, 1198  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, 1198  ,  -436, 1267  ,  -436, 1602  ,  -636, 1522  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, -407  ,  -236, -370  ,  -236, -73  ,  -436, -120  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, -120  ,  -236, -73  ,  -236, 224  ,  -436, 167  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, 167  ,  -236, 224  ,  -236, 522  ,  -436, 454  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, 454  ,  -236, 522  ,  -236, 819  ,  -436, 741  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, 741  ,  -236, 819  ,  -236, 1116  ,  -436, 1028  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, 1028  ,  -236, 1116  ,  -236, 1413  ,  -436, 1315  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, 1315  ,  -236, 1413  ,  -236, 1711  ,  -436, 1602  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, -370  ,  -36, -309  ,  -36, -3  ,  -236, -73  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, -73  ,  -36, -3  ,  -36, 304  ,  -236, 224  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, 224  ,  -36, 304  ,  -36, 610  ,  -236, 522  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, 522  ,  -36, 610  ,  -36, 917  ,  -236, 819  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, 819  ,  -36, 917  ,  -36, 1223  ,  -236, 1116  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, 1116  ,  -36, 1223  ,  -36, 1530  ,  -236, 1413  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, 1413  ,  -36, 1530  ,  -36, 1836  ,  -236, 1711  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, -309  ,  164, -233  ,  164, 79  ,  -36, -3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, -3  ,  164, 79  ,  164, 390  ,  -36, 304  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 304  ,  164, 390  ,  164, 702  ,  -36, 610  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 610  ,  164, 702  ,  164, 1013  ,  -36, 917  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 917  ,  164, 1013  ,  164, 1325  ,  -36, 1223  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 1223  ,  164, 1325  ,  164, 1636  ,  -36, 1530  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 1530  ,  164, 1636  ,  164, 1948  ,  -36, 1836  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, -233  ,  364, -153  ,  364, 159  ,  164, 79  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 79  ,  364, 159  ,  364, 471  ,  164, 390  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 390  ,  364, 471  ,  364, 782  ,  164, 702  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 702  ,  364, 782  ,  364, 1094  ,  164, 1013  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 1013  ,  364, 1094  ,  364, 1406  ,  164, 1325  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 1325  ,  364, 1406  ,  364, 1718  ,  164, 1636  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 1636  ,  364, 1718  ,  364, 2029  ,  164, 1948  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, -153  ,  564, -74  ,  564, 237  ,  364, 159  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 159  ,  564, 237  ,  564, 548  ,  364, 471  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 471  ,  564, 548  ,  564, 859  ,  364, 782  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 782  ,  564, 859  ,  564, 1169  ,  364, 1094  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 1094  ,  564, 1169  ,  564, 1480  ,  364, 1406  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 1406  ,  564, 1480  ,  564, 1791  ,  364, 1718  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 1718  ,  564, 1791  ,  564, 2102  ,  364, 2029  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, -74  ,  764, 8  ,  764, 321  ,  564, 237  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 237  ,  764, 321  ,  764, 634  ,  564, 548  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 548  ,  764, 634  ,  764, 947  ,  564, 859  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 859  ,  764, 947  ,  764, 1260  ,  564, 1169  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 1169  ,  764, 1260  ,  764, 1573  ,  564, 1480  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 1480  ,  764, 1573  ,  764, 1886  ,  564, 1791  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 1791  ,  764, 1886  ,  764, 2199  ,  564, 2102  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 8  ,  856, 48  ,  856, 58  ,  764, 321  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 321  ,  856, 58  ,  856, 69  ,  764, 634  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 634  ,  856, 69  ,  856, 80  ,  764, 947  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 947  ,  856, 80  ,  856, 91  ,  764, 1260  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 1260  ,  856, 91  ,  856, 101  ,  764, 1573  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 1573  ,  856, 101  ,  856, 112  ,  764, 1886  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 1886  ,  856, 112  ,  856, 123  ,  764, 2199  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 550  ,  1364, 618  ,  1364, 964  ,  1164, 563  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 563  ,  1364, 964  ,  1364, 1310  ,  1164, 576  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 576  ,  1364, 1310  ,  1364, 1656  ,  1164, 588  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 588  ,  1364, 1656  ,  1364, 2003  ,  1164, 601  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 601  ,  1364, 2003  ,  1364, 2349  ,  1164, 613  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 618  ,  1564, 674  ,  1564, 1009  ,  1364, 964  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 964  ,  1564, 1009  ,  1564, 1344  ,  1364, 1310  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 1310  ,  1564, 1344  ,  1564, 1679  ,  1364, 1656  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 1656  ,  1564, 1679  ,  1564, 2014  ,  1364, 2003  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 2003  ,  1564, 2014  ,  1564, 2349  ,  1364, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 674  ,  1764, 721  ,  1764, 1047  ,  1564, 1009  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1009  ,  1764, 1047  ,  1764, 1372  ,  1564, 1344  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1344  ,  1764, 1372  ,  1764, 1698  ,  1564, 1679  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1679  ,  1764, 1698  ,  1764, 2023  ,  1564, 2014  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 2014  ,  1764, 2023  ,  1764, 2349  ,  1564, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 721  ,  1964, 766  ,  1964, 1080  ,  1764, 1047  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1047  ,  1964, 1080  ,  1964, 1394  ,  1764, 1372  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1372  ,  1964, 1394  ,  1964, 1708  ,  1764, 1698  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1698  ,  1964, 1708  ,  1964, 2022  ,  1764, 2023  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 2023  ,  1964, 2022  ,  1964, 2335  ,  1764, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 766  ,  2164, 815  ,  2164, 1108  ,  1964, 1080  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1080  ,  2164, 1108  ,  2164, 1400  ,  1964, 1394  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1394  ,  2164, 1400  ,  2164, 1693  ,  1964, 1708  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1708  ,  2164, 1693  ,  2164, 1986  ,  1964, 2022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 2022  ,  2164, 1986  ,  2164, 2278  ,  1964, 2335  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 815  ,  2364, 869  ,  2364, 1136  ,  2164, 1108  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1108  ,  2364, 1136  ,  2364, 1402  ,  2164, 1400  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1400  ,  2364, 1402  ,  2364, 1669  ,  2164, 1693  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1693  ,  2364, 1669  ,  2364, 1935  ,  2164, 1986  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1986  ,  2364, 1935  ,  2364, 2202  ,  2164, 2278  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 869  ,  2564, 924  ,  2564, 1221  ,  2364, 1202  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1202  ,  2564, 1221  ,  2564, 1517  ,  2364, 1535  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1535  ,  2564, 1517  ,  2564, 1814  ,  2364, 1869  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1869  ,  2564, 1814  ,  2564, 2111  ,  2364, 2202  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 924  ,  2764, 977  ,  2764, 1235  ,  2564, 1221  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1221  ,  2764, 1235  ,  2764, 1493  ,  2564, 1517  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1517  ,  2764, 1493  ,  2764, 1750  ,  2564, 1814  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1814  ,  2764, 1750  ,  2764, 2008  ,  2564, 2111  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 977  ,  2964, 1028  ,  2964, 1318  ,  2764, 1321  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 1321  ,  2964, 1318  ,  2964, 1608  ,  2764, 1664  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 1664  ,  2964, 1608  ,  2964, 1898  ,  2764, 2008  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 1028  ,  3164, 1080  ,  3164, 1315  ,  2964, 1318  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 1318  ,  3164, 1315  ,  3164, 1551  ,  2964, 1608  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 1608  ,  3164, 1551  ,  3164, 1786  ,  2964, 1898  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 1080  ,  3364, 1133  ,  3364, 1405  ,  3164, 1433  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 1433  ,  3364, 1405  ,  3364, 1677  ,  3164, 1786  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3364, 1133  ,  3564, 1189  ,  3564, 1383  ,  3364, 1405  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3364, 1405  ,  3564, 1383  ,  3564, 1577  ,  3364, 1677  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3564, 1189  ,  3764, 1248  ,  3764, 1490  ,  3564, 1577  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3764, 1248  ,  3838, 1270  ,  3838, 1462  ,  3764, 1490  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -228, -2038  ,  -28, -1965  ,  -28, -1790  ,  -228, -2010  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -28, -1965  ,  172, -1879  ,  172, -1534  ,  -28, -1790  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  172, -1879  ,  372, -1790  ,  372, -1361  ,  172, -1534  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  372, -1790  ,  572, -1710  ,  572, -1300  ,  372, -1361  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  572, -1710  ,  772, -1649  ,  772, -1264  ,  572, -1300  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  772, -1649  ,  972, -1612  ,  972, -1249  ,  772, -1264  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  972, -1612  ,  1172, -1594  ,  1172, -1252  ,  972, -1249  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1172, -1594  ,  1372, -1584  ,  1372, -1262  ,  1172, -1252  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1372, -1584  ,  1572, -1571  ,  1572, -1269  ,  1372, -1262  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1572, -1571  ,  1772, -1551  ,  1772, -1266  ,  1572, -1269  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1772, -1551  ,  1972, -1528  ,  1972, -1255  ,  1772, -1266  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1972, -1528  ,  2172, -1504  ,  2172, -1288  ,  1972, -1255  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2172, -1504  ,  2372, -1480  ,  2372, -1358  ,  2172, -1288  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2372, -1480  ,  2572, -1449  ,  2572, -1414  ,  2372, -1358  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2572, -1449  ,  2592, -1446  ,  2592, -1417  ,  2572, -1414  }
                    }
                    }
		,
		["2"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1630  ,  -3640, -1602  ,  -3640, -1284  ,  -3840, -1305  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1305  ,  -3640, -1284  ,  -3640, -966  ,  -3840, -981  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -981  ,  -3640, -966  ,  -3640, -647  ,  -3840, -657  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -657  ,  -3640, -647  ,  -3640, -329  ,  -3840, -333  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -333  ,  -3640, -329  ,  -3640, -10  ,  -3840, -8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -8  ,  -3640, -10  ,  -3640, 308  ,  -3840, 316  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 316  ,  -3640, 308  ,  -3640, 626  ,  -3840, 640  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 640  ,  -3640, 626  ,  -3640, 945  ,  -3840, 964  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 964  ,  -3640, 945  ,  -3640, 1263  ,  -3840, 1289  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1289  ,  -3640, 1263  ,  -3640, 1582  ,  -3840, 1613  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1613  ,  -3640, 1582  ,  -3640, 1900  ,  -3840, 1937  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1602  ,  -3440, -1570  ,  -3440, -1258  ,  -3640, -1284  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1284  ,  -3440, -1258  ,  -3440, -947  ,  -3640, -966  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -966  ,  -3440, -947  ,  -3440, -636  ,  -3640, -647  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -647  ,  -3440, -636  ,  -3440, -325  ,  -3640, -329  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -329  ,  -3440, -325  ,  -3440, -14  ,  -3640, -10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -10  ,  -3440, -14  ,  -3440, 297  ,  -3640, 308  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 308  ,  -3440, 297  ,  -3440, 608  ,  -3640, 626  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 626  ,  -3440, 608  ,  -3440, 919  ,  -3640, 945  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 945  ,  -3440, 919  ,  -3440, 1230  ,  -3640, 1263  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1263  ,  -3440, 1230  ,  -3440, 1542  ,  -3640, 1582  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1582  ,  -3440, 1542  ,  -3440, 1853  ,  -3640, 1900  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1570  ,  -3240, -1536  ,  -3240, -1233  ,  -3440, -1258  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1258  ,  -3240, -1233  ,  -3240, -930  ,  -3440, -947  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -947  ,  -3240, -930  ,  -3240, -627  ,  -3440, -636  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -636  ,  -3240, -627  ,  -3240, -323  ,  -3440, -325  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -325  ,  -3240, -323  ,  -3240, -20  ,  -3440, -14  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -14  ,  -3240, -20  ,  -3240, 283  ,  -3440, 297  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 297  ,  -3240, 283  ,  -3240, 586  ,  -3440, 608  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 608  ,  -3240, 586  ,  -3240, 889  ,  -3440, 919  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 919  ,  -3240, 889  ,  -3240, 1192  ,  -3440, 1230  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1230  ,  -3240, 1192  ,  -3240, 1496  ,  -3440, 1542  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1542  ,  -3240, 1496  ,  -3240, 1799  ,  -3440, 1853  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1536  ,  -3040, -1507  ,  -3040, -1183  ,  -3240, -1203  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1203  ,  -3040, -1183  ,  -3040, -858  ,  -3240, -869  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -869  ,  -3040, -858  ,  -3040, -534  ,  -3240, -536  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -536  ,  -3040, -534  ,  -3040, -209  ,  -3240, -202  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -202  ,  -3040, -209  ,  -3040, 115  ,  -3240, 131  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 131  ,  -3040, 115  ,  -3040, 440  ,  -3240, 465  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 465  ,  -3040, 440  ,  -3040, 764  ,  -3240, 798  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 798  ,  -3040, 764  ,  -3040, 1089  ,  -3240, 1132  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1132  ,  -3040, 1089  ,  -3040, 1413  ,  -3240, 1465  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1465  ,  -3040, 1413  ,  -3040, 1738  ,  -3240, 1799  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1507  ,  -2840, -1487  ,  -2840, -1171  ,  -3040, -1183  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1183  ,  -2840, -1171  ,  -2840, -856  ,  -3040, -858  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -858  ,  -2840, -856  ,  -2840, -541  ,  -3040, -534  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -534  ,  -2840, -541  ,  -2840, -226  ,  -3040, -209  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -209  ,  -2840, -226  ,  -2840, 90  ,  -3040, 115  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 115  ,  -2840, 90  ,  -2840, 405  ,  -3040, 440  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 440  ,  -2840, 405  ,  -2840, 720  ,  -3040, 764  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 764  ,  -2840, 720  ,  -2840, 1035  ,  -3040, 1089  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1089  ,  -2840, 1035  ,  -2840, 1351  ,  -3040, 1413  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1413  ,  -2840, 1351  ,  -2840, 1666  ,  -3040, 1738  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1487  ,  -2640, -1477  ,  -2640, -1170  ,  -2840, -1171  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1171  ,  -2640, -1170  ,  -2640, -864  ,  -2840, -856  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -856  ,  -2640, -864  ,  -2640, -558  ,  -2840, -541  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -541  ,  -2640, -558  ,  -2640, -252  ,  -2840, -226  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -226  ,  -2640, -252  ,  -2640, 54  ,  -2840, 90  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 90  ,  -2640, 54  ,  -2640, 360  ,  -2840, 405  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 405  ,  -2640, 360  ,  -2640, 666  ,  -2840, 720  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 720  ,  -2640, 666  ,  -2640, 972  ,  -2840, 1035  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1035  ,  -2640, 972  ,  -2640, 1279  ,  -2840, 1351  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1351  ,  -2640, 1279  ,  -2640, 1585  ,  -2840, 1666  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1477  ,  -2440, -1473  ,  -2440, -1175  ,  -2640, -1170  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1170  ,  -2440, -1175  ,  -2440, -877  ,  -2640, -864  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -864  ,  -2440, -877  ,  -2440, -579  ,  -2640, -558  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -558  ,  -2440, -579  ,  -2440, -281  ,  -2640, -252  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -252  ,  -2440, -281  ,  -2440, 17  ,  -2640, 54  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 54  ,  -2440, 17  ,  -2440, 315  ,  -2640, 360  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 360  ,  -2440, 315  ,  -2440, 613  ,  -2640, 666  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 666  ,  -2440, 613  ,  -2440, 910  ,  -2640, 972  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 972  ,  -2440, 910  ,  -2440, 1208  ,  -2640, 1279  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1279  ,  -2440, 1208  ,  -2440, 1506  ,  -2640, 1585  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1473  ,  -2240, -1465  ,  -2240, -1141  ,  -2440, -1142  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1142  ,  -2240, -1141  ,  -2240, -818  ,  -2440, -811  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -811  ,  -2240, -818  ,  -2240, -494  ,  -2440, -480  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -480  ,  -2240, -494  ,  -2240, -170  ,  -2440, -149  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -149  ,  -2240, -170  ,  -2240, 154  ,  -2440, 182  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 182  ,  -2240, 154  ,  -2240, 477  ,  -2440, 513  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 513  ,  -2240, 477  ,  -2240, 801  ,  -2440, 844  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 844  ,  -2240, 801  ,  -2240, 1125  ,  -2440, 1175  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1175  ,  -2240, 1125  ,  -2240, 1448  ,  -2440, 1506  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1465  ,  -2040, -1445  ,  -2040, -1127  ,  -2240, -1141  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1141  ,  -2040, -1127  ,  -2040, -808  ,  -2240, -818  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -818  ,  -2040, -808  ,  -2040, -489  ,  -2240, -494  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -494  ,  -2040, -489  ,  -2040, -170  ,  -2240, -170  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -170  ,  -2040, -170  ,  -2040, 149  ,  -2240, 154  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 154  ,  -2040, 149  ,  -2040, 468  ,  -2240, 477  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 477  ,  -2040, 468  ,  -2040, 786  ,  -2240, 801  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 801  ,  -2040, 786  ,  -2040, 1105  ,  -2240, 1125  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1125  ,  -2040, 1105  ,  -2040, 1424  ,  -2240, 1448  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -1445  ,  -1844, -1412  ,  -1844, -1401  ,  -2040, -1127  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -1127  ,  -1844, -1401  ,  -1844, -1390  ,  -2040, -808  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -808  ,  -1844, -1390  ,  -1844, -1379  ,  -2040, -489  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -489  ,  -1844, -1379  ,  -1844, -1368  ,  -2040, -170  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -170  ,  -1844, -1368  ,  -1844, -1357  ,  -2040, 149  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 149  ,  -1844, -1357  ,  -1844, -1347  ,  -2040, 468  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 468  ,  -1844, -1347  ,  -1844, -1336  ,  -2040, 786  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 786  ,  -1844, -1336  ,  -1844, -1325  ,  -2040, 1105  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1105  ,  -1844, -1325  ,  -1844, -1314  ,  -2040, 1424  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -829  ,  -1316, -750  ,  -1316, -412  ,  -1516, -818  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -818  ,  -1316, -412  ,  -1316, -75  ,  -1516, -806  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -806  ,  -1316, -75  ,  -1316, 263  ,  -1516, -794  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -794  ,  -1316, 263  ,  -1316, 601  ,  -1516, -782  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -782  ,  -1316, 601  ,  -1316, 938  ,  -1516, -770  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -770  ,  -1316, 938  ,  -1316, 1276  ,  -1516, -759  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -759  ,  -1316, 1276  ,  -1316, 1613  ,  -1516, -747  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, -750  ,  -1116, -681  ,  -1116, -345  ,  -1316, -412  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, -412  ,  -1116, -345  ,  -1116, -10  ,  -1316, -75  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, -75  ,  -1116, -10  ,  -1116, 325  ,  -1316, 263  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, 263  ,  -1116, 325  ,  -1116, 660  ,  -1316, 601  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, 601  ,  -1116, 660  ,  -1116, 996  ,  -1316, 938  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, 938  ,  -1116, 996  ,  -1116, 1331  ,  -1316, 1276  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, 1276  ,  -1116, 1331  ,  -1116, 1666  ,  -1316, 1613  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, -681  ,  -916, -620  ,  -916, -284  ,  -1116, -345  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, -345  ,  -916, -284  ,  -916, 52  ,  -1116, -10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, -10  ,  -916, 52  ,  -916, 387  ,  -1116, 325  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, 325  ,  -916, 387  ,  -916, 723  ,  -1116, 660  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, 660  ,  -916, 723  ,  -916, 1059  ,  -1116, 996  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, 996  ,  -916, 1059  ,  -916, 1395  ,  -1116, 1331  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, 1331  ,  -916, 1395  ,  -916, 1730  ,  -1116, 1666  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, -620  ,  -716, -565  ,  -716, -226  ,  -916, -284  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, -284  ,  -716, -226  ,  -716, 112  ,  -916, 52  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 52  ,  -716, 112  ,  -716, 451  ,  -916, 387  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 387  ,  -716, 451  ,  -716, 789  ,  -916, 723  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 723  ,  -716, 789  ,  -716, 1128  ,  -916, 1059  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 1059  ,  -716, 1128  ,  -716, 1467  ,  -916, 1395  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 1395  ,  -716, 1467  ,  -716, 1805  ,  -916, 1730  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, -565  ,  -516, -512  ,  -516, -170  ,  -716, -226  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, -226  ,  -516, -170  ,  -516, 173  ,  -716, 112  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 112  ,  -516, 173  ,  -516, 516  ,  -716, 451  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 451  ,  -516, 516  ,  -516, 859  ,  -716, 789  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 789  ,  -516, 859  ,  -516, 1201  ,  -716, 1128  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 1128  ,  -516, 1201  ,  -516, 1544  ,  -716, 1467  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 1467  ,  -516, 1544  ,  -516, 1887  ,  -716, 1805  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, -512  ,  -316, -460  ,  -316, -156  ,  -516, -213  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, -213  ,  -316, -156  ,  -316, 147  ,  -516, 87  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 87  ,  -316, 147  ,  -316, 451  ,  -516, 387  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 387  ,  -316, 451  ,  -316, 755  ,  -516, 687  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 687  ,  -316, 755  ,  -316, 1058  ,  -516, 987  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 987  ,  -316, 1058  ,  -316, 1362  ,  -516, 1287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 1287  ,  -316, 1362  ,  -316, 1666  ,  -516, 1587  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 1587  ,  -316, 1666  ,  -316, 1969  ,  -516, 1887  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, -460  ,  -116, -407  ,  -116, -100  ,  -316, -156  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, -156  ,  -116, -100  ,  -116, 206  ,  -316, 147  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 147  ,  -116, 206  ,  -116, 512  ,  -316, 451  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 451  ,  -116, 512  ,  -116, 818  ,  -316, 755  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 755  ,  -116, 818  ,  -116, 1125  ,  -316, 1058  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 1058  ,  -116, 1125  ,  -116, 1431  ,  -316, 1362  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 1362  ,  -116, 1431  ,  -116, 1737  ,  -316, 1666  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 1666  ,  -116, 1737  ,  -116, 2043  ,  -316, 1969  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, -407  ,  84, -352  ,  84, -44  ,  -116, -100  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, -100  ,  84, -44  ,  84, 264  ,  -116, 206  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 206  ,  84, 264  ,  84, 571  ,  -116, 512  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 512  ,  84, 571  ,  84, 879  ,  -116, 818  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 818  ,  84, 879  ,  84, 1186  ,  -116, 1125  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 1125  ,  84, 1186  ,  84, 1494  ,  -116, 1431  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 1431  ,  84, 1494  ,  84, 1802  ,  -116, 1737  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 1737  ,  84, 1802  ,  84, 2109  ,  -116, 2043  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, -352  ,  284, -294  ,  284, 15  ,  84, -44  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, -44  ,  284, 15  ,  284, 324  ,  84, 264  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 264  ,  284, 324  ,  284, 634  ,  84, 571  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 571  ,  284, 634  ,  284, 943  ,  84, 879  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 879  ,  284, 943  ,  284, 1252  ,  84, 1186  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 1186  ,  284, 1252  ,  284, 1561  ,  84, 1494  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 1494  ,  284, 1561  ,  284, 1870  ,  84, 1802  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 1802  ,  284, 1870  ,  284, 2180  ,  84, 2109  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, -294  ,  484, -230  ,  484, 82  ,  284, 15  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 15  ,  484, 82  ,  484, 394  ,  284, 324  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 324  ,  484, 394  ,  484, 706  ,  284, 634  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 634  ,  484, 706  ,  484, 1018  ,  284, 943  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 943  ,  484, 1018  ,  484, 1330  ,  284, 1252  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 1252  ,  484, 1330  ,  484, 1642  ,  284, 1561  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 1561  ,  484, 1642  ,  484, 1954  ,  284, 1870  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 1870  ,  484, 1954  ,  484, 2266  ,  284, 2180  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, -230  ,  684, -153  ,  684, 159  ,  484, 82  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 82  ,  684, 159  ,  684, 472  ,  484, 394  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 394  ,  684, 472  ,  684, 785  ,  484, 706  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 706  ,  684, 785  ,  684, 1098  ,  484, 1018  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 1018  ,  684, 1098  ,  684, 1411  ,  484, 1330  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 1330  ,  684, 1411  ,  684, 1723  ,  484, 1642  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 1642  ,  684, 1723  ,  684, 2036  ,  484, 1954  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 1954  ,  684, 2036  ,  684, 2349  ,  484, 2266  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, -153  ,  884, -66  ,  884, 236  ,  684, 159  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 159  ,  884, 236  ,  884, 538  ,  684, 472  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 472  ,  884, 538  ,  884, 840  ,  684, 785  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 785  ,  884, 840  ,  884, 1141  ,  684, 1098  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 1098  ,  884, 1141  ,  884, 1443  ,  684, 1411  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 1411  ,  884, 1443  ,  884, 1745  ,  684, 1723  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 1723  ,  884, 1745  ,  884, 2047  ,  684, 2036  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 2036  ,  884, 2047  ,  884, 2349  ,  684, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, -66  ,  1084, 19  ,  1084, 162  ,  884, 236  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 236  ,  1084, 162  ,  1084, 304  ,  884, 538  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 538  ,  1084, 304  ,  1084, 447  ,  884, 840  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 840  ,  1084, 447  ,  1084, 589  ,  884, 1141  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 1141  ,  1084, 589  ,  1084, 732  ,  884, 1443  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 1443  ,  1084, 732  ,  1084, 874  ,  884, 1745  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 1745  ,  1084, 874  ,  1084, 1017  ,  884, 2047  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 2047  ,  1084, 1017  ,  1084, 1159  ,  884, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1084, 19  ,  1148, 45  ,  1148, 54  ,  1084, 304  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1084, 304  ,  1148, 54  ,  1148, 64  ,  1084, 589  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1084, 589  ,  1148, 64  ,  1148, 74  ,  1084, 874  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1084, 874  ,  1148, 74  ,  1148, 84  ,  1084, 1159  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1484, 650  ,  1684, 734  ,  1684, 1023  ,  1484, 661  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1484, 661  ,  1684, 1023  ,  1684, 1311  ,  1484, 671  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1484, 671  ,  1684, 1311  ,  1684, 1600  ,  1484, 681  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1484, 681  ,  1684, 1600  ,  1684, 1889  ,  1484, 692  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1684, 734  ,  1884, 839  ,  1884, 1120  ,  1684, 1023  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1684, 1023  ,  1884, 1120  ,  1884, 1401  ,  1684, 1311  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1684, 1311  ,  1884, 1401  ,  1884, 1682  ,  1684, 1600  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1684, 1600  ,  1884, 1682  ,  1884, 1963  ,  1684, 1889  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1884, 839  ,  2084, 945  ,  2084, 1222  ,  1884, 1120  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1884, 1120  ,  2084, 1222  ,  2084, 1499  ,  1884, 1401  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1884, 1401  ,  2084, 1499  ,  2084, 1776  ,  1884, 1682  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1884, 1682  ,  2084, 1776  ,  2084, 2053  ,  1884, 1963  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2084, 945  ,  2284, 1039  ,  2284, 1408  ,  2084, 1314  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2084, 1314  ,  2284, 1408  ,  2284, 1777  ,  2084, 1684  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2084, 1684  ,  2284, 1777  ,  2284, 2146  ,  2084, 2053  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2284, 1039  ,  2484, 1123  ,  2484, 1495  ,  2284, 1408  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2284, 1408  ,  2484, 1495  ,  2484, 1868  ,  2284, 1777  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2284, 1777  ,  2484, 1868  ,  2484, 2240  ,  2284, 2146  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2484, 1123  ,  2684, 1199  ,  2684, 1483  ,  2484, 1402  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2484, 1402  ,  2684, 1483  ,  2684, 1767  ,  2484, 1681  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2484, 1681  ,  2684, 1767  ,  2684, 2051  ,  2484, 1961  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2484, 1961  ,  2684, 2051  ,  2684, 2335  ,  2484, 2240  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2684, 1199  ,  2884, 1266  ,  2884, 1537  ,  2684, 1483  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2684, 1483  ,  2884, 1537  ,  2884, 1808  ,  2684, 1767  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2684, 1767  ,  2884, 1808  ,  2884, 2078  ,  2684, 2051  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2684, 2051  ,  2884, 2078  ,  2884, 2349  ,  2684, 2335  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2884, 1266  ,  3084, 1323  ,  3084, 1665  ,  2884, 1627  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2884, 1627  ,  3084, 1665  ,  3084, 2007  ,  2884, 1988  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2884, 1988  ,  3084, 2007  ,  3084, 2349  ,  2884, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3084, 1323  ,  3284, 1367  ,  3284, 1694  ,  3084, 1665  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3084, 1665  ,  3284, 1694  ,  3284, 2022  ,  3084, 2007  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3084, 2007  ,  3284, 2022  ,  3284, 2349  ,  3084, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3284, 1367  ,  3484, 1401  ,  3484, 1717  ,  3284, 1694  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3284, 1694  ,  3484, 1717  ,  3484, 2033  ,  3284, 2022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3284, 2022  ,  3484, 2033  ,  3484, 2349  ,  3284, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3484, 1401  ,  3684, 1430  ,  3684, 1737  ,  3484, 1717  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3484, 1717  ,  3684, 1737  ,  3684, 2043  ,  3484, 2033  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3484, 2033  ,  3684, 2043  ,  3684, 2349  ,  3484, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3684, 1430  ,  3838, 1452  ,  3838, 1751  ,  3684, 1737  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3684, 1737  ,  3838, 1751  ,  3838, 2050  ,  3684, 2043  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3684, 2043  ,  3838, 2050  ,  3838, 2349  ,  3684, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1664, -1221  ,  1864, -1188  ,  1864, -1005  ,  1664, -1193  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1864, -1188  ,  2064, -1144  ,  2064, -795  ,  1864, -1005  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2064, -1144  ,  2264, -1098  ,  2264, -688  ,  2064, -795  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2264, -1098  ,  2464, -1055  ,  2464, -662  ,  2264, -688  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2464, -1055  ,  2664, -1020  ,  2664, -638  ,  2464, -662  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2664, -1020  ,  2864, -1000  ,  2864, -630  ,  2664, -638  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2864, -1000  ,  3064, -991  ,  3064, -640  ,  2864, -630  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3064, -991  ,  3264, -982  ,  3264, -659  ,  3064, -640  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3264, -982  ,  3464, -963  ,  3464, -674  ,  3264, -659  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3464, -963  ,  3664, -929  ,  3664, -715  ,  3464, -674  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3664, -929  ,  3838, -888  ,  3838, -762  ,  3664, -715  }
                    }
                    }
		,
		["3"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1524  ,  -3640, -1441  ,  -3640, -1132  ,  -3840, -1208  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1208  ,  -3640, -1132  ,  -3640, -822  ,  -3840, -891  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -891  ,  -3640, -822  ,  -3640, -513  ,  -3840, -575  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -575  ,  -3640, -513  ,  -3640, -204  ,  -3840, -259  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -259  ,  -3640, -204  ,  -3640, 106  ,  -3840, 57  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 57  ,  -3640, 106  ,  -3640, 415  ,  -3840, 374  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 374  ,  -3640, 415  ,  -3640, 725  ,  -3840, 690  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 690  ,  -3640, 725  ,  -3640, 1034  ,  -3840, 1006  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1006  ,  -3640, 1034  ,  -3640, 1344  ,  -3840, 1323  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1323  ,  -3640, 1344  ,  -3640, 1653  ,  -3840, 1639  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1639  ,  -3640, 1653  ,  -3640, 1963  ,  -3840, 1955  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1441  ,  -3440, -1360  ,  -3440, -1059  ,  -3640, -1132  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1132  ,  -3440, -1059  ,  -3440, -757  ,  -3640, -822  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -822  ,  -3440, -757  ,  -3440, -455  ,  -3640, -513  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -513  ,  -3440, -455  ,  -3440, -153  ,  -3640, -204  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -204  ,  -3440, -153  ,  -3440, 148  ,  -3640, 106  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 106  ,  -3440, 148  ,  -3440, 450  ,  -3640, 415  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 415  ,  -3440, 450  ,  -3440, 752  ,  -3640, 725  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 725  ,  -3440, 752  ,  -3440, 1054  ,  -3640, 1034  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1034  ,  -3440, 1054  ,  -3440, 1355  ,  -3640, 1344  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1344  ,  -3440, 1355  ,  -3440, 1657  ,  -3640, 1653  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1653  ,  -3440, 1657  ,  -3440, 1959  ,  -3640, 1963  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1360  ,  -3240, -1281  ,  -3240, -958  ,  -3440, -1028  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1028  ,  -3240, -958  ,  -3240, -635  ,  -3440, -696  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -696  ,  -3240, -635  ,  -3240, -313  ,  -3440, -365  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -365  ,  -3240, -313  ,  -3240, 10  ,  -3440, -33  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -33  ,  -3240, 10  ,  -3240, 332  ,  -3440, 299  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 299  ,  -3240, 332  ,  -3240, 655  ,  -3440, 631  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 631  ,  -3240, 655  ,  -3240, 978  ,  -3440, 963  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 963  ,  -3240, 978  ,  -3240, 1300  ,  -3440, 1295  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1295  ,  -3240, 1300  ,  -3240, 1623  ,  -3440, 1627  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1627  ,  -3240, 1623  ,  -3240, 1945  ,  -3440, 1959  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1281  ,  -3040, -1203  ,  -3040, -890  ,  -3240, -958  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -958  ,  -3040, -890  ,  -3040, -578  ,  -3240, -635  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -635  ,  -3040, -578  ,  -3040, -265  ,  -3240, -313  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -313  ,  -3040, -265  ,  -3040, 48  ,  -3240, 10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 10  ,  -3040, 48  ,  -3040, 360  ,  -3240, 332  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 332  ,  -3040, 360  ,  -3040, 673  ,  -3240, 655  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 655  ,  -3040, 673  ,  -3040, 986  ,  -3240, 978  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 978  ,  -3040, 986  ,  -3040, 1298  ,  -3240, 1300  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1300  ,  -3040, 1298  ,  -3040, 1611  ,  -3240, 1623  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1623  ,  -3040, 1611  ,  -3040, 1924  ,  -3240, 1945  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1203  ,  -2840, -1128  ,  -2840, -826  ,  -3040, -890  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -890  ,  -2840, -826  ,  -2840, -523  ,  -3040, -578  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -578  ,  -2840, -523  ,  -2840, -221  ,  -3040, -265  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -265  ,  -2840, -221  ,  -2840, 81  ,  -3040, 48  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 48  ,  -2840, 81  ,  -2840, 384  ,  -3040, 360  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 360  ,  -2840, 384  ,  -2840, 686  ,  -3040, 673  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 673  ,  -2840, 686  ,  -2840, 988  ,  -3040, 986  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 986  ,  -2840, 988  ,  -2840, 1291  ,  -3040, 1298  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1298  ,  -2840, 1291  ,  -2840, 1593  ,  -3040, 1611  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1611  ,  -2840, 1593  ,  -2840, 1895  ,  -3040, 1924  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1128  ,  -2640, -1056  ,  -2640, -731  ,  -2840, -792  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -792  ,  -2640, -731  ,  -2640, -407  ,  -2840, -456  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -456  ,  -2640, -407  ,  -2640, -83  ,  -2840, -120  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -120  ,  -2640, -83  ,  -2640, 241  ,  -2840, 216  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 216  ,  -2640, 241  ,  -2640, 565  ,  -2840, 552  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 552  ,  -2640, 565  ,  -2640, 889  ,  -2840, 887  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 887  ,  -2640, 889  ,  -2640, 1213  ,  -2840, 1223  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1223  ,  -2640, 1213  ,  -2640, 1538  ,  -2840, 1559  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1559  ,  -2640, 1538  ,  -2640, 1862  ,  -2840, 1895  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1056  ,  -2440, -986  ,  -2440, -673  ,  -2640, -731  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -731  ,  -2440, -673  ,  -2440, -361  ,  -2640, -407  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -407  ,  -2440, -361  ,  -2440, -49  ,  -2640, -83  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -83  ,  -2440, -49  ,  -2440, 264  ,  -2640, 241  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 241  ,  -2440, 264  ,  -2440, 576  ,  -2640, 565  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 565  ,  -2440, 576  ,  -2440, 888  ,  -2640, 889  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 889  ,  -2440, 888  ,  -2440, 1201  ,  -2640, 1213  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1213  ,  -2440, 1201  ,  -2440, 1513  ,  -2640, 1538  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1538  ,  -2440, 1513  ,  -2440, 1825  ,  -2640, 1862  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -986  ,  -2240, -917  ,  -2240, -617  ,  -2440, -673  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -673  ,  -2240, -617  ,  -2240, -316  ,  -2440, -361  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -361  ,  -2240, -316  ,  -2240, -16  ,  -2440, -49  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -49  ,  -2240, -16  ,  -2240, 285  ,  -2440, 264  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 264  ,  -2240, 285  ,  -2240, 585  ,  -2440, 576  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 576  ,  -2240, 585  ,  -2240, 886  ,  -2440, 888  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 888  ,  -2240, 886  ,  -2240, 1186  ,  -2440, 1201  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1201  ,  -2240, 1186  ,  -2240, 1487  ,  -2440, 1513  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1513  ,  -2240, 1487  ,  -2240, 1787  ,  -2440, 1825  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -917  ,  -2040, -849  ,  -2040, -524  ,  -2240, -579  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -579  ,  -2040, -524  ,  -2040, -200  ,  -2240, -241  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -241  ,  -2040, -200  ,  -2040, 125  ,  -2240, 97  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 97  ,  -2040, 125  ,  -2040, 450  ,  -2240, 435  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 435  ,  -2040, 450  ,  -2040, 775  ,  -2240, 773  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 773  ,  -2040, 775  ,  -2040, 1099  ,  -2240, 1111  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1111  ,  -2040, 1099  ,  -2040, 1424  ,  -2240, 1449  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1449  ,  -2040, 1424  ,  -2040, 1749  ,  -2240, 1787  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -849  ,  -1840, -781  ,  -1840, -469  ,  -2040, -524  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -524  ,  -1840, -469  ,  -1840, -158  ,  -2040, -200  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -200  ,  -1840, -158  ,  -1840, 154  ,  -2040, 125  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 125  ,  -1840, 154  ,  -1840, 465  ,  -2040, 450  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 450  ,  -1840, 465  ,  -1840, 776  ,  -2040, 775  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 775  ,  -1840, 776  ,  -1840, 1088  ,  -2040, 1099  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1099  ,  -1840, 1088  ,  -1840, 1399  ,  -2040, 1424  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1424  ,  -1840, 1399  ,  -1840, 1711  ,  -2040, 1749  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -781  ,  -1640, -712  ,  -1640, -414  ,  -1840, -469  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -469  ,  -1640, -414  ,  -1640, -115  ,  -1840, -158  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -158  ,  -1640, -115  ,  -1640, 183  ,  -1840, 154  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 154  ,  -1640, 183  ,  -1640, 481  ,  -1840, 465  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 465  ,  -1640, 481  ,  -1640, 779  ,  -1840, 776  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 776  ,  -1640, 779  ,  -1640, 1077  ,  -1840, 1088  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 1088  ,  -1640, 1077  ,  -1640, 1375  ,  -1840, 1399  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 1399  ,  -1640, 1375  ,  -1640, 1673  ,  -1840, 1711  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -712  ,  -1440, -642  ,  -1440, -316  ,  -1640, -371  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -371  ,  -1440, -316  ,  -1440, 10  ,  -1640, -30  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -30  ,  -1440, 10  ,  -1440, 335  ,  -1640, 310  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 310  ,  -1440, 335  ,  -1440, 661  ,  -1640, 651  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 651  ,  -1440, 661  ,  -1440, 987  ,  -1640, 992  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 992  ,  -1440, 987  ,  -1440, 1313  ,  -1640, 1333  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 1333  ,  -1440, 1313  ,  -1440, 1638  ,  -1640, 1673  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, -642  ,  -1240, -571  ,  -1240, -260  ,  -1440, -316  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, -316  ,  -1240, -260  ,  -1240, 51  ,  -1440, 10  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 10  ,  -1240, 51  ,  -1240, 363  ,  -1440, 335  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 335  ,  -1240, 363  ,  -1240, 674  ,  -1440, 661  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 661  ,  -1240, 674  ,  -1240, 985  ,  -1440, 987  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 987  ,  -1240, 985  ,  -1240, 1296  ,  -1440, 1313  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 1313  ,  -1240, 1296  ,  -1240, 1608  ,  -1440, 1638  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, -571  ,  -1040, -499  ,  -1040, -201  ,  -1240, -260  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, -260  ,  -1040, -201  ,  -1040, 96  ,  -1240, 51  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 51  ,  -1040, 96  ,  -1040, 394  ,  -1240, 363  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 363  ,  -1040, 394  ,  -1040, 691  ,  -1240, 674  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 674  ,  -1040, 691  ,  -1040, 988  ,  -1240, 985  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 985  ,  -1040, 988  ,  -1040, 1286  ,  -1240, 1296  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 1296  ,  -1040, 1286  ,  -1040, 1583  ,  -1240, 1608  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, -499  ,  -840, -424  ,  -840, -139  ,  -1040, -201  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, -201  ,  -840, -139  ,  -840, 145  ,  -1040, 96  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 96  ,  -840, 145  ,  -840, 429  ,  -1040, 394  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 394  ,  -840, 429  ,  -840, 714  ,  -1040, 691  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 691  ,  -840, 714  ,  -840, 998  ,  -1040, 988  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 988  ,  -840, 998  ,  -840, 1282  ,  -1040, 1286  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 1286  ,  -840, 1282  ,  -840, 1567  ,  -1040, 1583  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, -424  ,  -640, -346  ,  -640, -28  ,  -840, -92  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, -92  ,  -640, -28  ,  -640, 289  ,  -840, 240  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 240  ,  -640, 289  ,  -640, 607  ,  -840, 571  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 571  ,  -640, 607  ,  -640, 925  ,  -840, 903  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 903  ,  -640, 925  ,  -640, 1243  ,  -840, 1235  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 1235  ,  -640, 1243  ,  -640, 1561  ,  -840, 1567  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, -346  ,  -440, -265  ,  -440, 40  ,  -640, -28  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, -28  ,  -440, 40  ,  -440, 345  ,  -640, 289  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 289  ,  -440, 345  ,  -440, 650  ,  -640, 607  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 607  ,  -440, 650  ,  -440, 956  ,  -640, 925  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 925  ,  -440, 956  ,  -440, 1261  ,  -640, 1243  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 1243  ,  -440, 1261  ,  -440, 1566  ,  -640, 1561  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -440, -265  ,  -240, -180  ,  -240, 75  ,  -440, 40  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -440, 40  ,  -240, 75  ,  -240, 330  ,  -440, 345  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -440, 345  ,  -240, 330  ,  -240, 585  ,  -440, 650  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -440, 650  ,  -240, 585  ,  -240, 840  ,  -440, 956  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -440, 956  ,  -240, 840  ,  -240, 1095  ,  -440, 1261  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -440, 1261  ,  -240, 1095  ,  -240, 1350  ,  -440, 1566  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -240, -180  ,  -60, -100  ,  -60, -94  ,  -240, 126  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -240, 126  ,  -60, -94  ,  -60, -88  ,  -240, 432  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -240, 432  ,  -60, -88  ,  -60, -83  ,  -240, 738  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -240, 738  ,  -60, -83  ,  -60, -77  ,  -240, 1044  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -240, 1044  ,  -60, -77  ,  -60, -71  ,  -240, 1350  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, 769  ,  524, 796  ,  524, 1106  ,  324, 783  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, 783  ,  524, 1106  ,  524, 1417  ,  324, 796  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, 796  ,  524, 1417  ,  524, 1728  ,  324, 809  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, 809  ,  524, 1728  ,  524, 2038  ,  324, 823  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, 823  ,  524, 2038  ,  524, 2349  ,  324, 836  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 796  ,  724, 830  ,  724, 1134  ,  524, 1106  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 1106  ,  724, 1134  ,  724, 1438  ,  524, 1417  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 1417  ,  724, 1438  ,  724, 1741  ,  524, 1728  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 1728  ,  724, 1741  ,  724, 2045  ,  524, 2038  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 2038  ,  724, 2045  ,  724, 2349  ,  524, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 830  ,  924, 870  ,  924, 1166  ,  724, 1134  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 1134  ,  924, 1166  ,  924, 1462  ,  724, 1438  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 1438  ,  924, 1462  ,  924, 1758  ,  724, 1741  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 1741  ,  924, 1758  ,  924, 2053  ,  724, 2045  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 2045  ,  924, 2053  ,  924, 2349  ,  724, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 870  ,  1124, 913  ,  1124, 1200  ,  924, 1166  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 1166  ,  1124, 1200  ,  1124, 1487  ,  924, 1462  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 1462  ,  1124, 1487  ,  1124, 1774  ,  924, 1758  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 1758  ,  1124, 1774  ,  1124, 2062  ,  924, 2053  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 2053  ,  1124, 2062  ,  1124, 2349  ,  924, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 913  ,  1324, 954  ,  1324, 1303  ,  1124, 1272  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 1272  ,  1324, 1303  ,  1324, 1652  ,  1124, 1631  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 1631  ,  1324, 1652  ,  1324, 2000  ,  1124, 1990  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 1990  ,  1324, 2000  ,  1324, 2349  ,  1124, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1324, 954  ,  1524, 995  ,  1524, 1334  ,  1324, 1303  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1324, 1303  ,  1524, 1334  ,  1524, 1672  ,  1324, 1652  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1324, 1652  ,  1524, 1672  ,  1524, 2011  ,  1324, 2000  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1324, 2000  ,  1524, 2011  ,  1524, 2349  ,  1324, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1524, 995  ,  1724, 1036  ,  1724, 1364  ,  1524, 1334  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1524, 1334  ,  1724, 1364  ,  1724, 1692  ,  1524, 1672  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1524, 1672  ,  1724, 1692  ,  1724, 2021  ,  1524, 2011  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1524, 2011  ,  1724, 2021  ,  1724, 2349  ,  1524, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1724, 1036  ,  1924, 1076  ,  1924, 1395  ,  1724, 1364  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1724, 1364  ,  1924, 1395  ,  1924, 1713  ,  1724, 1692  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1724, 1692  ,  1924, 1713  ,  1924, 2031  ,  1724, 2021  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1724, 2021  ,  1924, 2031  ,  1924, 2349  ,  1724, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1924, 1076  ,  2124, 1117  ,  2124, 1423  ,  1924, 1395  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1924, 1395  ,  2124, 1423  ,  2124, 1729  ,  1924, 1713  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1924, 1713  ,  2124, 1729  ,  2124, 2035  ,  1924, 2031  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1924, 2031  ,  2124, 2035  ,  2124, 2341  ,  1924, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2124, 1117  ,  2324, 1154  ,  2324, 1440  ,  2124, 1423  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2124, 1423  ,  2324, 1440  ,  2324, 1726  ,  2124, 1729  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2124, 1729  ,  2324, 1726  ,  2324, 2013  ,  2124, 2035  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2124, 2035  ,  2324, 2013  ,  2324, 2299  ,  2124, 2341  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2324, 1154  ,  2524, 1186  ,  2524, 1454  ,  2324, 1440  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2324, 1440  ,  2524, 1454  ,  2524, 1721  ,  2324, 1726  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2324, 1726  ,  2524, 1721  ,  2524, 1988  ,  2324, 2013  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2324, 2013  ,  2524, 1988  ,  2524, 2255  ,  2324, 2299  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2524, 1186  ,  2724, 1213  ,  2724, 1545  ,  2524, 1543  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2524, 1543  ,  2724, 1545  ,  2724, 1877  ,  2524, 1899  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2524, 1899  ,  2724, 1877  ,  2724, 2209  ,  2524, 2255  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2724, 1213  ,  2924, 1235  ,  2924, 1544  ,  2724, 1545  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2724, 1545  ,  2924, 1544  ,  2924, 1853  ,  2724, 1877  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2724, 1877  ,  2924, 1853  ,  2924, 2162  ,  2724, 2209  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2924, 1235  ,  3124, 1256  ,  3124, 1545  ,  2924, 1544  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2924, 1544  ,  3124, 1545  ,  3124, 1834  ,  2924, 1853  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2924, 1853  ,  3124, 1834  ,  3124, 2122  ,  2924, 2162  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3124, 1256  ,  3324, 1282  ,  3324, 1553  ,  3124, 1545  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3124, 1545  ,  3324, 1553  ,  3324, 1823  ,  3124, 1834  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3124, 1834  ,  3324, 1823  ,  3324, 2094  ,  3124, 2122  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3324, 1282  ,  3524, 1315  ,  3524, 1569  ,  3324, 1553  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3324, 1553  ,  3524, 1569  ,  3524, 1823  ,  3324, 1823  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3324, 1823  ,  3524, 1823  ,  3524, 2077  ,  3324, 2094  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3524, 1315  ,  3724, 1351  ,  3724, 1709  ,  3524, 1696  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3524, 1696  ,  3724, 1709  ,  3724, 2067  ,  3524, 2077  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3724, 1351  ,  3838, 1372  ,  3838, 1716  ,  3724, 1709  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3724, 1709  ,  3838, 1716  ,  3838, 2060  ,  3724, 2067  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1114, -1360  ,  1314, -1329  ,  1314, -1206  ,  1114, -1331  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1314, -1329  ,  1514, -1280  ,  1514, -1047  ,  1314, -1206  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1514, -1280  ,  1714, -1217  ,  1714, -918  ,  1514, -1047  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1714, -1217  ,  1914, -1155  ,  1914, -833  ,  1714, -918  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1914, -1155  ,  2114, -1106  ,  2114, -757  ,  1914, -833  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2114, -1106  ,  2314, -1083  ,  2314, -707  ,  2114, -757  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2314, -1083  ,  2514, -1082  ,  2514, -689  ,  2314, -707  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2514, -1082  ,  2714, -1092  ,  2714, -691  ,  2514, -689  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2714, -1092  ,  2914, -1095  ,  2914, -698  ,  2714, -691  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2914, -1095  ,  3114, -1083  ,  3114, -713  ,  2914, -698  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3114, -1083  ,  3314, -1053  ,  3314, -788  ,  3114, -713  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3314, -1053  ,  3514, -1009  ,  3514, -875  ,  3314, -788  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3514, -1009  ,  3714, -969  ,  3714, -937  ,  3514, -875  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3714, -969  ,  3724, -968  ,  3724, -939  ,  3714, -937  }
                    }
                    }
		,
		["4"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1474  ,  -3640, -1396  ,  -3640, -1086  ,  -3840, -1164  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1164  ,  -3640, -1086  ,  -3640, -775  ,  -3840, -853  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -853  ,  -3640, -775  ,  -3640, -465  ,  -3840, -542  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -542  ,  -3640, -465  ,  -3640, -154  ,  -3840, -231  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -231  ,  -3640, -154  ,  -3640, 156  ,  -3840, 80  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 80  ,  -3640, 156  ,  -3640, 467  ,  -3840, 391  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 391  ,  -3640, 467  ,  -3640, 777  ,  -3840, 702  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 702  ,  -3640, 777  ,  -3640, 1088  ,  -3840, 1012  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1012  ,  -3640, 1088  ,  -3640, 1398  ,  -3840, 1323  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1396  ,  -3440, -1313  ,  -3440, -1002  ,  -3640, -1086  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1086  ,  -3440, -1002  ,  -3440, -690  ,  -3640, -775  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -775  ,  -3440, -690  ,  -3440, -379  ,  -3640, -465  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -465  ,  -3440, -379  ,  -3440, -68  ,  -3640, -154  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -154  ,  -3440, -68  ,  -3440, 244  ,  -3640, 156  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 156  ,  -3440, 244  ,  -3440, 555  ,  -3640, 467  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 467  ,  -3440, 555  ,  -3440, 867  ,  -3640, 777  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 777  ,  -3440, 867  ,  -3440, 1178  ,  -3640, 1088  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1088  ,  -3440, 1178  ,  -3440, 1490  ,  -3640, 1398  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1313  ,  -3240, -1227  ,  -3240, -914  ,  -3440, -1002  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1002  ,  -3240, -914  ,  -3240, -600  ,  -3440, -690  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -690  ,  -3240, -600  ,  -3240, -287  ,  -3440, -379  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -379  ,  -3240, -287  ,  -3240, 27  ,  -3440, -68  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -68  ,  -3240, 27  ,  -3240, 340  ,  -3440, 244  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 244  ,  -3240, 340  ,  -3240, 654  ,  -3440, 555  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 555  ,  -3240, 654  ,  -3240, 967  ,  -3440, 867  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 867  ,  -3240, 967  ,  -3240, 1280  ,  -3440, 1178  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1178  ,  -3240, 1280  ,  -3240, 1594  ,  -3440, 1490  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1227  ,  -3040, -1139  ,  -3040, -823  ,  -3240, -914  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -914  ,  -3040, -823  ,  -3040, -507  ,  -3240, -600  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -600  ,  -3040, -507  ,  -3040, -191  ,  -3240, -287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -287  ,  -3040, -191  ,  -3040, 125  ,  -3240, 27  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 27  ,  -3040, 125  ,  -3040, 441  ,  -3240, 340  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 340  ,  -3040, 441  ,  -3040, 757  ,  -3240, 654  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 654  ,  -3040, 757  ,  -3040, 1074  ,  -3240, 967  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 967  ,  -3040, 1074  ,  -3040, 1390  ,  -3240, 1280  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1280  ,  -3040, 1390  ,  -3040, 1706  ,  -3240, 1594  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1139  ,  -2840, -1050  ,  -2840, -731  ,  -3040, -823  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -823  ,  -2840, -731  ,  -2840, -412  ,  -3040, -507  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -507  ,  -2840, -412  ,  -2840, -94  ,  -3040, -191  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -191  ,  -2840, -94  ,  -2840, 225  ,  -3040, 125  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 125  ,  -2840, 225  ,  -2840, 544  ,  -3040, 441  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 441  ,  -2840, 544  ,  -2840, 863  ,  -3040, 757  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 757  ,  -2840, 863  ,  -2840, 1182  ,  -3040, 1074  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1074  ,  -2840, 1182  ,  -2840, 1500  ,  -3040, 1390  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1390  ,  -2840, 1500  ,  -2840, 1819  ,  -3040, 1706  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1050  ,  -2640, -959  ,  -2640, -638  ,  -2840, -731  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -731  ,  -2640, -638  ,  -2640, -318  ,  -2840, -412  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -412  ,  -2640, -318  ,  -2640, 3  ,  -2840, -94  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -94  ,  -2640, 3  ,  -2640, 324  ,  -2840, 225  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 225  ,  -2640, 324  ,  -2640, 645  ,  -2840, 544  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 544  ,  -2640, 645  ,  -2640, 966  ,  -2840, 863  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 863  ,  -2640, 966  ,  -2640, 1287  ,  -2840, 1182  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1182  ,  -2640, 1287  ,  -2640, 1608  ,  -2840, 1500  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1500  ,  -2640, 1608  ,  -2640, 1929  ,  -2840, 1819  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -959  ,  -2440, -868  ,  -2440, -546  ,  -2640, -638  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -638  ,  -2440, -546  ,  -2440, -224  ,  -2640, -318  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -318  ,  -2440, -224  ,  -2440, 98  ,  -2640, 3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 3  ,  -2440, 98  ,  -2440, 420  ,  -2640, 324  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 324  ,  -2440, 420  ,  -2440, 742  ,  -2640, 645  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 645  ,  -2440, 742  ,  -2440, 1065  ,  -2640, 966  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 966  ,  -2440, 1065  ,  -2440, 1387  ,  -2640, 1287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1287  ,  -2440, 1387  ,  -2440, 1709  ,  -2640, 1608  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1608  ,  -2440, 1709  ,  -2440, 2031  ,  -2640, 1929  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -868  ,  -2240, -778  ,  -2240, -456  ,  -2440, -546  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -546  ,  -2240, -456  ,  -2240, -133  ,  -2440, -224  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -224  ,  -2240, -133  ,  -2240, 189  ,  -2440, 98  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 98  ,  -2240, 189  ,  -2240, 511  ,  -2440, 420  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 420  ,  -2240, 511  ,  -2240, 834  ,  -2440, 742  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 742  ,  -2240, 834  ,  -2240, 1156  ,  -2440, 1065  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1065  ,  -2240, 1156  ,  -2240, 1479  ,  -2440, 1387  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1387  ,  -2240, 1479  ,  -2240, 1801  ,  -2440, 1709  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1709  ,  -2240, 1801  ,  -2240, 2124  ,  -2440, 2031  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -778  ,  -2040, -692  ,  -2040, -370  ,  -2240, -456  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -456  ,  -2040, -370  ,  -2040, -48  ,  -2240, -133  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -133  ,  -2040, -48  ,  -2040, 274  ,  -2240, 189  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 189  ,  -2040, 274  ,  -2040, 595  ,  -2240, 511  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 511  ,  -2040, 595  ,  -2040, 917  ,  -2240, 834  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 834  ,  -2040, 917  ,  -2040, 1239  ,  -2240, 1156  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1156  ,  -2040, 1239  ,  -2040, 1561  ,  -2240, 1479  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1479  ,  -2040, 1561  ,  -2040, 1883  ,  -2240, 1801  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1801  ,  -2040, 1883  ,  -2040, 2204  ,  -2240, 2124  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -692  ,  -1840, -612  ,  -1840, -292  ,  -2040, -370  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -370  ,  -1840, -292  ,  -1840, 28  ,  -2040, -48  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -48  ,  -1840, 28  ,  -1840, 349  ,  -2040, 274  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 274  ,  -1840, 349  ,  -1840, 669  ,  -2040, 595  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 595  ,  -1840, 669  ,  -1840, 990  ,  -2040, 917  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 917  ,  -1840, 990  ,  -1840, 1310  ,  -2040, 1239  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1239  ,  -1840, 1310  ,  -1840, 1630  ,  -2040, 1561  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1561  ,  -1840, 1630  ,  -1840, 1951  ,  -2040, 1883  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1883  ,  -1840, 1951  ,  -1840, 2271  ,  -2040, 2204  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -612  ,  -1640, -542  ,  -1640, -224  ,  -1840, -292  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -292  ,  -1640, -224  ,  -1640, 95  ,  -1840, 28  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 28  ,  -1640, 95  ,  -1640, 413  ,  -1840, 349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 349  ,  -1640, 413  ,  -1640, 731  ,  -1840, 669  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 669  ,  -1640, 731  ,  -1640, 1049  ,  -1840, 990  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 990  ,  -1640, 1049  ,  -1640, 1368  ,  -1840, 1310  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 1310  ,  -1640, 1368  ,  -1640, 1686  ,  -1840, 1630  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 1630  ,  -1640, 1686  ,  -1640, 2004  ,  -1840, 1951  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 1951  ,  -1640, 2004  ,  -1640, 2322  ,  -1840, 2271  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -542  ,  -1440, -479  ,  -1440, -165  ,  -1640, -224  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -224  ,  -1440, -165  ,  -1440, 149  ,  -1640, 95  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 95  ,  -1440, 149  ,  -1440, 464  ,  -1640, 413  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 413  ,  -1440, 464  ,  -1440, 778  ,  -1640, 731  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 731  ,  -1440, 778  ,  -1440, 1092  ,  -1640, 1049  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 1049  ,  -1440, 1092  ,  -1440, 1406  ,  -1640, 1368  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 1368  ,  -1440, 1406  ,  -1440, 1721  ,  -1640, 1686  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 1686  ,  -1440, 1721  ,  -1440, 2035  ,  -1640, 2004  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 2004  ,  -1440, 2035  ,  -1440, 2349  ,  -1640, 2322  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, -479  ,  -1240, -421  ,  -1240, -113  ,  -1440, -165  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, -165  ,  -1240, -113  ,  -1240, 195  ,  -1440, 149  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 149  ,  -1240, 195  ,  -1240, 502  ,  -1440, 464  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 464  ,  -1240, 502  ,  -1240, 810  ,  -1440, 778  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 778  ,  -1240, 810  ,  -1240, 1118  ,  -1440, 1092  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 1092  ,  -1240, 1118  ,  -1240, 1426  ,  -1440, 1406  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 1406  ,  -1240, 1426  ,  -1240, 1733  ,  -1440, 1721  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 1721  ,  -1240, 1733  ,  -1240, 2041  ,  -1440, 2035  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 2035  ,  -1240, 2041  ,  -1240, 2349  ,  -1440, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, -421  ,  -1040, -364  ,  -1040, -63  ,  -1240, -113  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, -113  ,  -1040, -63  ,  -1040, 239  ,  -1240, 195  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 195  ,  -1040, 239  ,  -1040, 540  ,  -1240, 502  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 502  ,  -1040, 540  ,  -1040, 842  ,  -1240, 810  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 810  ,  -1040, 842  ,  -1040, 1143  ,  -1240, 1118  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 1118  ,  -1040, 1143  ,  -1040, 1445  ,  -1240, 1426  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 1426  ,  -1040, 1445  ,  -1040, 1746  ,  -1240, 1733  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 1733  ,  -1040, 1746  ,  -1040, 2048  ,  -1240, 2041  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 2041  ,  -1040, 2048  ,  -1040, 2349  ,  -1240, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, -364  ,  -840, -308  ,  -840, 24  ,  -1040, -25  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, -25  ,  -840, 24  ,  -840, 357  ,  -1040, 314  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 314  ,  -840, 357  ,  -840, 689  ,  -1040, 653  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 653  ,  -840, 689  ,  -840, 1021  ,  -1040, 992  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 992  ,  -840, 1021  ,  -840, 1353  ,  -1040, 1331  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 1331  ,  -840, 1353  ,  -840, 1685  ,  -1040, 1671  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 1671  ,  -840, 1685  ,  -840, 2017  ,  -1040, 2010  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 2010  ,  -840, 2017  ,  -840, 2349  ,  -1040, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, -308  ,  -640, -250  ,  -640, 65  ,  -840, 24  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 24  ,  -640, 65  ,  -640, 380  ,  -840, 357  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 357  ,  -640, 380  ,  -640, 695  ,  -840, 689  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 689  ,  -640, 695  ,  -640, 1010  ,  -840, 1021  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 1021  ,  -640, 1010  ,  -640, 1324  ,  -840, 1353  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 1353  ,  -640, 1324  ,  -640, 1639  ,  -840, 1685  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 1685  ,  -640, 1639  ,  -640, 1954  ,  -840, 2017  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 2017  ,  -640, 1954  ,  -640, 2269  ,  -840, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, -250  ,  -456, -196  ,  -456, -192  ,  -640, 65  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 65  ,  -456, -192  ,  -456, -187  ,  -640, 380  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 380  ,  -456, -187  ,  -456, -183  ,  -640, 695  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 695  ,  -456, -183  ,  -456, -178  ,  -640, 1010  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 1010  ,  -456, -178  ,  -456, -174  ,  -640, 1324  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 1324  ,  -456, -174  ,  -456, -170  ,  -640, 1639  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 1639  ,  -456, -170  ,  -456, -165  ,  -640, 1954  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 1954  ,  -456, -165  ,  -456, -161  ,  -640, 2269  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 890  ,  164, 916  ,  164, 1274  ,  -36, 904  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 904  ,  164, 1274  ,  164, 1632  ,  -36, 919  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 919  ,  164, 1632  ,  164, 1991  ,  -36, 933  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 933  ,  164, 1991  ,  164, 2349  ,  -36, 948  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 916  ,  364, 941  ,  364, 1293  ,  164, 1274  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 1274  ,  364, 1293  ,  364, 1645  ,  164, 1632  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 1632  ,  364, 1645  ,  364, 1997  ,  164, 1991  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 1991  ,  364, 1997  ,  364, 2349  ,  164, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 941  ,  564, 966  ,  564, 1312  ,  364, 1293  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 1293  ,  564, 1312  ,  564, 1657  ,  364, 1645  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 1645  ,  564, 1657  ,  564, 2003  ,  364, 1997  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 1997  ,  564, 2003  ,  564, 2349  ,  364, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 966  ,  764, 990  ,  764, 1330  ,  564, 1312  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 1312  ,  764, 1330  ,  764, 1670  ,  564, 1657  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 1657  ,  764, 1670  ,  764, 2009  ,  564, 2003  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 2003  ,  764, 2009  ,  764, 2349  ,  564, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 990  ,  964, 1015  ,  964, 1348  ,  764, 1330  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 1330  ,  964, 1348  ,  964, 1682  ,  764, 1670  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 1670  ,  964, 1682  ,  964, 2015  ,  764, 2009  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 2009  ,  964, 2015  ,  964, 2349  ,  764, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  964, 1015  ,  1164, 1039  ,  1164, 1366  ,  964, 1348  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  964, 1348  ,  1164, 1366  ,  1164, 1694  ,  964, 1682  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  964, 1682  ,  1164, 1694  ,  1164, 2021  ,  964, 2015  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  964, 2015  ,  1164, 2021  ,  1164, 2349  ,  964, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 1039  ,  1364, 1063  ,  1364, 1384  ,  1164, 1366  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 1366  ,  1364, 1384  ,  1364, 1706  ,  1164, 1694  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 1694  ,  1364, 1706  ,  1364, 2027  ,  1164, 2021  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 2021  ,  1364, 2027  ,  1364, 2349  ,  1164, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 1063  ,  1564, 1088  ,  1564, 1403  ,  1364, 1384  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 1384  ,  1564, 1403  ,  1564, 1718  ,  1364, 1706  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 1706  ,  1564, 1718  ,  1564, 2034  ,  1364, 2027  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 2027  ,  1564, 2034  ,  1564, 2349  ,  1364, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1088  ,  1764, 1114  ,  1764, 1422  ,  1564, 1403  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1403  ,  1764, 1422  ,  1764, 1730  ,  1564, 1718  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1718  ,  1764, 1730  ,  1764, 2038  ,  1564, 2034  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 2034  ,  1764, 2038  ,  1764, 2346  ,  1564, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1114  ,  1964, 1141  ,  1964, 1430  ,  1764, 1422  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1422  ,  1964, 1430  ,  1964, 1718  ,  1764, 1730  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1730  ,  1964, 1718  ,  1964, 2006  ,  1764, 2038  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 2038  ,  1964, 2006  ,  1964, 2294  ,  1764, 2346  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1141  ,  2164, 1172  ,  2164, 1438  ,  1964, 1430  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1430  ,  2164, 1438  ,  2164, 1704  ,  1964, 1718  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1718  ,  2164, 1704  ,  2164, 1970  ,  1964, 2006  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 2006  ,  2164, 1970  ,  2164, 2237  ,  1964, 2294  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1172  ,  2364, 1205  ,  2364, 1528  ,  2164, 1527  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1527  ,  2364, 1528  ,  2364, 1852  ,  2164, 1882  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1882  ,  2364, 1852  ,  2364, 2176  ,  2164, 2237  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1205  ,  2564, 1241  ,  2564, 1532  ,  2364, 1528  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1528  ,  2564, 1532  ,  2564, 1823  ,  2364, 1852  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1852  ,  2564, 1823  ,  2564, 2114  ,  2364, 2176  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1241  ,  2764, 1284  ,  2764, 1540  ,  2564, 1532  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1532  ,  2764, 1540  ,  2764, 1797  ,  2564, 1823  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1823  ,  2764, 1797  ,  2764, 2053  ,  2564, 2114  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 1284  ,  2964, 1334  ,  2964, 1667  ,  2764, 1669  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 1669  ,  2964, 1667  ,  2964, 2000  ,  2764, 2053  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 1334  ,  3164, 1393  ,  3164, 1676  ,  2964, 1667  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 1667  ,  3164, 1676  ,  3164, 1959  ,  2964, 2000  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 1393  ,  3364, 1462  ,  3364, 1697  ,  3164, 1676  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 1676  ,  3364, 1697  ,  3364, 1932  ,  3164, 1959  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3364, 1462  ,  3564, 1536  ,  3564, 1918  ,  3364, 1932  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3564, 1536  ,  3764, 1611  ,  3764, 1913  ,  3564, 1918  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3764, 1611  ,  3838, 1637  ,  3838, 1912  ,  3764, 1913  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -644, -1158  ,  -444, -1175  ,  -444, -961  ,  -644, -1129  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -444, -1175  ,  -244, -1191  ,  -244, -752  ,  -444, -961  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -244, -1191  ,  -44, -1206  ,  -44, -921  ,  -244, -971  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -244, -971  ,  -44, -921  ,  -44, -637  ,  -244, -752  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -44, -1206  ,  156, -1219  ,  156, -938  ,  -44, -921  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -44, -921  ,  156, -938  ,  156, -657  ,  -44, -637  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  156, -1219  ,  356, -1231  ,  356, -957  ,  156, -938  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  156, -938  ,  356, -957  ,  356, -682  ,  156, -657  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  356, -1231  ,  556, -1245  ,  556, -976  ,  356, -957  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  356, -957  ,  556, -976  ,  556, -707  ,  356, -682  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  556, -1245  ,  756, -1259  ,  756, -997  ,  556, -976  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  556, -976  ,  756, -997  ,  756, -734  ,  556, -707  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  756, -1259  ,  956, -1277  ,  956, -1021  ,  756, -997  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  756, -997  ,  956, -1021  ,  956, -765  ,  756, -734  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  956, -1277  ,  1156, -1296  ,  1156, -1048  ,  956, -1021  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  956, -1021  ,  1156, -1048  ,  1156, -800  ,  956, -765  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1156, -1296  ,  1356, -1317  ,  1356, -1077  ,  1156, -1048  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1156, -1048  ,  1356, -1077  ,  1356, -838  ,  1156, -800  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1356, -1317  ,  1556, -1337  ,  1556, -877  ,  1356, -838  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1556, -1337  ,  1756, -1357  ,  1756, -918  ,  1556, -877  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1756, -1357  ,  1956, -1374  ,  1956, -957  ,  1756, -918  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1956, -1374  ,  2156, -1390  ,  2156, -994  ,  1956, -957  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2156, -1390  ,  2356, -1404  ,  2356, -1030  ,  2156, -994  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2356, -1404  ,  2556, -1419  ,  2556, -1065  ,  2356, -1030  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2556, -1419  ,  2756, -1435  ,  2756, -1100  ,  2556, -1065  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2756, -1435  ,  2956, -1453  ,  2956, -1145  ,  2756, -1100  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2956, -1453  ,  3156, -1472  ,  3156, -1219  ,  2956, -1145  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3156, -1472  ,  3356, -1492  ,  3356, -1306  ,  3156, -1219  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3356, -1492  ,  3556, -1510  ,  3556, -1393  ,  3356, -1306  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3556, -1510  ,  3756, -1526  ,  3756, -1467  ,  3556, -1393  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3756, -1526  ,  3838, -1532  ,  3838, -1492  ,  3756, -1467  }
                    }
                    }
		,
		["del1"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   12, 7.5  ,  1, 9.5  ,  -11, 7.5  ,  -15, 3.5  ,  -16, -0.5  ,  1, -9.5  ,  17, -0.5  ,  16, 4.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -11, -9.5  ,  1, -9.5  ,  -16, -0.5  ,  -15, -5.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 1, friction = 0.3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   17, -0.5  ,  1, -9.5  ,  12, -9.5  ,  16, -5.5  }
                    }
                    
                    
                    
		}
	} }

        -- apply scale factor
        local s = scale or 1.0
        for bi,body in pairs(physics.data) do
                for fi,fixture in ipairs(body) do
                    if(fixture.shape) then
                        for ci,coordinate in ipairs(fixture.shape) do
                            fixture.shape[ci] = s * coordinate
                        end
                    else
                        fixture.radius = s * fixture.radius
                    end
                end
        end

	function physics:get(name)
		return unpack(self.data[name])
	end

	function physics:getFixtureId(name, index)
                return self.data[name][index].pe_fixture_id
	end

	return physics;
end

return M
