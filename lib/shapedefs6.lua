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
                    shape = {  -3840, -2059  ,  -3640, -1969  ,  -3640, -1659  ,  -3840, -1740  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1740  ,  -3640, -1659  ,  -3640, -1349  ,  -3840, -1420  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1420  ,  -3640, -1349  ,  -3640, -1039  ,  -3840, -1101  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1101  ,  -3640, -1039  ,  -3640, -729  ,  -3840, -782  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -782  ,  -3640, -729  ,  -3640, -419  ,  -3840, -463  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -463  ,  -3640, -419  ,  -3640, -108  ,  -3840, -144  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -144  ,  -3640, -108  ,  -3640, 202  ,  -3840, 175  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 175  ,  -3640, 202  ,  -3640, 512  ,  -3840, 494  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 494  ,  -3640, 512  ,  -3640, 822  ,  -3840, 814  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 814  ,  -3640, 822  ,  -3640, 1132  ,  -3840, 1133  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1133  ,  -3640, 1132  ,  -3640, 1442  ,  -3840, 1452  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1969  ,  -3440, -1880  ,  -3440, -1580  ,  -3640, -1659  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1659  ,  -3440, -1580  ,  -3440, -1280  ,  -3640, -1349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1349  ,  -3440, -1280  ,  -3440, -980  ,  -3640, -1039  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1039  ,  -3440, -980  ,  -3440, -680  ,  -3640, -729  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -729  ,  -3440, -680  ,  -3440, -380  ,  -3640, -419  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -419  ,  -3440, -380  ,  -3440, -80  ,  -3640, -108  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -108  ,  -3440, -80  ,  -3440, 220  ,  -3640, 202  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 202  ,  -3440, 220  ,  -3440, 520  ,  -3640, 512  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 512  ,  -3440, 520  ,  -3440, 820  ,  -3640, 822  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 822  ,  -3440, 820  ,  -3440, 1119  ,  -3640, 1132  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1132  ,  -3440, 1119  ,  -3440, 1419  ,  -3640, 1442  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1880  ,  -3240, -1791  ,  -3240, -1473  ,  -3440, -1550  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1550  ,  -3240, -1473  ,  -3240, -1156  ,  -3440, -1220  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1220  ,  -3240, -1156  ,  -3240, -838  ,  -3440, -890  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -890  ,  -3240, -838  ,  -3240, -521  ,  -3440, -560  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -560  ,  -3240, -521  ,  -3240, -203  ,  -3440, -230  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -230  ,  -3240, -203  ,  -3240, 114  ,  -3440, 100  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 100  ,  -3240, 114  ,  -3240, 432  ,  -3440, 430  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 430  ,  -3240, 432  ,  -3240, 749  ,  -3440, 760  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 760  ,  -3240, 749  ,  -3240, 1067  ,  -3440, 1089  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1089  ,  -3240, 1067  ,  -3240, 1384  ,  -3440, 1419  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1791  ,  -3040, -1701  ,  -3040, -1397  ,  -3240, -1473  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1473  ,  -3040, -1397  ,  -3040, -1093  ,  -3240, -1156  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1156  ,  -3040, -1093  ,  -3040, -789  ,  -3240, -838  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -838  ,  -3040, -789  ,  -3040, -486  ,  -3240, -521  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -521  ,  -3040, -486  ,  -3040, -182  ,  -3240, -203  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -203  ,  -3040, -182  ,  -3040, 122  ,  -3240, 114  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 114  ,  -3040, 122  ,  -3040, 426  ,  -3240, 432  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 432  ,  -3040, 426  ,  -3040, 730  ,  -3240, 749  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 749  ,  -3040, 730  ,  -3040, 1034  ,  -3240, 1067  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1067  ,  -3040, 1034  ,  -3040, 1338  ,  -3240, 1384  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1701  ,  -2840, -1612  ,  -2840, -1291  ,  -3040, -1364  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1364  ,  -2840, -1291  ,  -2840, -970  ,  -3040, -1026  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1026  ,  -2840, -970  ,  -2840, -649  ,  -3040, -688  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -688  ,  -2840, -649  ,  -2840, -328  ,  -3040, -350  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -350  ,  -2840, -328  ,  -2840, -7  ,  -3040, -13  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -13  ,  -2840, -7  ,  -2840, 313  ,  -3040, 325  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 325  ,  -2840, 313  ,  -2840, 634  ,  -3040, 663  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 663  ,  -2840, 634  ,  -2840, 955  ,  -3040, 1000  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1000  ,  -2840, 955  ,  -2840, 1276  ,  -3040, 1338  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1612  ,  -2640, -1526  ,  -2640, -1224  ,  -2840, -1291  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1291  ,  -2640, -1224  ,  -2640, -923  ,  -2840, -970  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -970  ,  -2640, -923  ,  -2640, -622  ,  -2840, -649  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -649  ,  -2640, -622  ,  -2640, -320  ,  -2840, -328  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -328  ,  -2640, -320  ,  -2640, -19  ,  -2840, -7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -7  ,  -2640, -19  ,  -2640, 283  ,  -2840, 313  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 313  ,  -2640, 283  ,  -2640, 584  ,  -2840, 634  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 634  ,  -2640, 584  ,  -2640, 885  ,  -2840, 955  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 955  ,  -2640, 885  ,  -2640, 1187  ,  -2840, 1276  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1526  ,  -2440, -1448  ,  -2440, -1134  ,  -2640, -1187  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1187  ,  -2440, -1134  ,  -2440, -820  ,  -2640, -848  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -848  ,  -2440, -820  ,  -2440, -507  ,  -2640, -509  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -509  ,  -2440, -507  ,  -2440, -193  ,  -2640, -170  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -170  ,  -2440, -193  ,  -2440, 121  ,  -2640, 170  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 170  ,  -2440, 121  ,  -2440, 435  ,  -2640, 509  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 509  ,  -2440, 435  ,  -2440, 749  ,  -2640, 848  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 848  ,  -2440, 749  ,  -2440, 1063  ,  -2640, 1187  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1448  ,  -2240, -1374  ,  -2240, -1085  ,  -2440, -1134  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1134  ,  -2240, -1085  ,  -2240, -796  ,  -2440, -820  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -820  ,  -2240, -796  ,  -2240, -507  ,  -2440, -507  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -507  ,  -2240, -507  ,  -2240, -218  ,  -2440, -193  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -193  ,  -2240, -218  ,  -2240, 71  ,  -2440, 121  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 121  ,  -2240, 71  ,  -2240, 360  ,  -2440, 435  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 435  ,  -2240, 360  ,  -2240, 649  ,  -2440, 749  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 749  ,  -2240, 649  ,  -2240, 938  ,  -2440, 1063  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1374  ,  -2040, -1296  ,  -2040, -988  ,  -2240, -1043  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1043  ,  -2040, -988  ,  -2040, -680  ,  -2240, -713  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -713  ,  -2040, -680  ,  -2040, -372  ,  -2240, -383  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -383  ,  -2040, -372  ,  -2040, -64  ,  -2240, -53  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -53  ,  -2040, -64  ,  -2040, 244  ,  -2240, 278  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 278  ,  -2040, 244  ,  -2040, 553  ,  -2240, 608  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 608  ,  -2040, 553  ,  -2040, 861  ,  -2240, 938  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -1296  ,  -1840, -1218  ,  -1840, -923  ,  -2040, -988  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -988  ,  -1840, -923  ,  -1840, -628  ,  -2040, -680  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -680  ,  -1840, -628  ,  -1840, -333  ,  -2040, -372  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -372  ,  -1840, -333  ,  -1840, -37  ,  -2040, -64  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -64  ,  -1840, -37  ,  -1840, 258  ,  -2040, 244  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 244  ,  -1840, 258  ,  -1840, 553  ,  -2040, 553  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 553  ,  -1840, 553  ,  -1840, 848  ,  -2040, 861  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -1218  ,  -1640, -1145  ,  -1640, -809  ,  -1840, -874  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -874  ,  -1640, -809  ,  -1640, -472  ,  -1840, -529  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -529  ,  -1640, -472  ,  -1640, -135  ,  -1840, -185  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -185  ,  -1640, -135  ,  -1640, 201  ,  -1840, 159  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 159  ,  -1640, 201  ,  -1640, 538  ,  -1840, 504  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 504  ,  -1640, 538  ,  -1640, 874  ,  -1840, 848  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -1145  ,  -1544, -1113  ,  -1544, -1101  ,  -1640, -809  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -809  ,  -1544, -1101  ,  -1544, -1090  ,  -1640, -472  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -472  ,  -1544, -1090  ,  -1544, -1078  ,  -1640, -135  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -135  ,  -1544, -1078  ,  -1544, -1067  ,  -1640, 201  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 201  ,  -1544, -1067  ,  -1544, -1056  ,  -1640, 538  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 538  ,  -1544, -1056  ,  -1544, -1044  ,  -1640, 874  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -557  ,  -1036, -493  ,  -1036, -168  ,  -1236, -546  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -546  ,  -1036, -168  ,  -1036, 156  ,  -1236, -534  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -534  ,  -1036, 156  ,  -1036, 480  ,  -1236, -523  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -523  ,  -1036, 480  ,  -1036, 804  ,  -1236, -512  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -512  ,  -1036, 804  ,  -1036, 1129  ,  -1236, -500  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -500  ,  -1036, 1129  ,  -1036, 1453  ,  -1236, -489  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1236, -489  ,  -1036, 1453  ,  -1036, 1777  ,  -1236, -478  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, -493  ,  -936, -479  ,  -936, -157  ,  -1036, -168  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, -168  ,  -936, -157  ,  -936, 165  ,  -1036, 156  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, 156  ,  -936, 165  ,  -936, 486  ,  -1036, 480  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, 480  ,  -936, 486  ,  -936, 808  ,  -1036, 804  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, 804  ,  -936, 808  ,  -936, 1130  ,  -1036, 1129  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, 1129  ,  -936, 1130  ,  -936, 1451  ,  -1036, 1453  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1036, 1453  ,  -936, 1451  ,  -936, 1773  ,  -1036, 1777  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -936, -479  ,  -836, -491  ,  -836, -171  ,  -936, -157  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -936, -157  ,  -836, -171  ,  -836, 149  ,  -936, 165  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -936, 165  ,  -836, 149  ,  -836, 469  ,  -936, 486  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -936, 486  ,  -836, 469  ,  -836, 789  ,  -936, 808  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -936, 808  ,  -836, 789  ,  -836, 1109  ,  -936, 1130  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -936, 1130  ,  -836, 1109  ,  -836, 1428  ,  -936, 1451  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -936, 1451  ,  -836, 1428  ,  -836, 1748  ,  -936, 1773  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, -491  ,  -636, -597  ,  -636, -276  ,  -836, -171  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, -171  ,  -636, -276  ,  -636, 44  ,  -836, 149  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, 149  ,  -636, 44  ,  -636, 364  ,  -836, 469  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, 469  ,  -636, 364  ,  -636, 685  ,  -836, 789  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, 789  ,  -636, 685  ,  -636, 1005  ,  -836, 1109  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, 1109  ,  -636, 1005  ,  -636, 1325  ,  -836, 1428  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -836, 1428  ,  -636, 1325  ,  -636, 1646  ,  -836, 1748  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, -597  ,  -436, -725  ,  -436, -398  ,  -636, -276  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, -276  ,  -436, -398  ,  -436, -71  ,  -636, 44  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, 44  ,  -436, -71  ,  -436, 256  ,  -636, 364  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, 364  ,  -436, 256  ,  -436, 583  ,  -636, 685  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, 685  ,  -436, 583  ,  -436, 910  ,  -636, 1005  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, 1005  ,  -436, 910  ,  -436, 1237  ,  -636, 1325  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -636, 1325  ,  -436, 1237  ,  -436, 1564  ,  -636, 1646  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, -725  ,  -336, -757  ,  -336, -424  ,  -436, -398  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, -398  ,  -336, -424  ,  -336, -92  ,  -436, -71  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, -71  ,  -336, -92  ,  -336, 241  ,  -436, 256  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, 256  ,  -336, 241  ,  -336, 574  ,  -436, 583  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, 583  ,  -336, 574  ,  -336, 907  ,  -436, 910  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, 910  ,  -336, 907  ,  -336, 1239  ,  -436, 1237  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -436, 1237  ,  -336, 1239  ,  -336, 1572  ,  -436, 1564  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -336, -757  ,  -236, -753  ,  -236, -414  ,  -336, -424  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -336, -424  ,  -236, -414  ,  -236, -75  ,  -336, -92  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -336, -92  ,  -236, -75  ,  -236, 264  ,  -336, 241  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -336, 241  ,  -236, 264  ,  -236, 603  ,  -336, 574  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -336, 574  ,  -236, 603  ,  -236, 943  ,  -336, 907  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -336, 907  ,  -236, 943  ,  -236, 1282  ,  -336, 1239  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -336, 1239  ,  -236, 1282  ,  -236, 1621  ,  -336, 1572  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, -753  ,  -136, -715  ,  -136, -413  ,  -236, -456  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, -456  ,  -136, -413  ,  -136, -110  ,  -236, -160  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, -160  ,  -136, -110  ,  -136, 192  ,  -236, 137  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, 137  ,  -136, 192  ,  -136, 495  ,  -236, 434  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, 434  ,  -136, 495  ,  -136, 797  ,  -236, 731  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, 731  ,  -136, 797  ,  -136, 1100  ,  -236, 1027  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, 1027  ,  -136, 1100  ,  -136, 1402  ,  -236, 1324  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -236, 1324  ,  -136, 1402  ,  -136, 1705  ,  -236, 1621  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -136, -715  ,  64, -581  ,  64, -270  ,  -136, -413  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -136, -413  ,  64, -270  ,  64, 41  ,  -136, -110  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -136, -110  ,  64, 41  ,  64, 352  ,  -136, 192  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -136, 192  ,  64, 352  ,  64, 663  ,  -136, 495  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -136, 495  ,  64, 663  ,  64, 974  ,  -136, 797  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -136, 797  ,  64, 974  ,  64, 1285  ,  -136, 1100  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -136, 1100  ,  64, 1285  ,  64, 1596  ,  -136, 1402  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -136, 1402  ,  64, 1596  ,  64, 1907  ,  -136, 1705  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  64, -581  ,  264, -474  ,  264, -162  ,  64, -270  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  64, -270  ,  264, -162  ,  264, 150  ,  64, 41  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  64, 41  ,  264, 150  ,  264, 462  ,  64, 352  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  64, 352  ,  264, 462  ,  264, 773  ,  64, 663  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  64, 663  ,  264, 773  ,  264, 1085  ,  64, 974  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  64, 974  ,  264, 1085  ,  264, 1397  ,  64, 1285  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  64, 1285  ,  264, 1397  ,  264, 1709  ,  64, 1596  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  64, 1596  ,  264, 1709  ,  264, 2021  ,  64, 1907  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  264, -474  ,  464, -442  ,  464, -136  ,  264, -162  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  264, -162  ,  464, -136  ,  464, 170  ,  264, 150  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  264, 150  ,  464, 170  ,  464, 476  ,  264, 462  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  264, 462  ,  464, 476  ,  464, 782  ,  264, 773  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  264, 773  ,  464, 782  ,  464, 1088  ,  264, 1085  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  264, 1085  ,  464, 1088  ,  464, 1394  ,  264, 1397  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  264, 1397  ,  464, 1394  ,  464, 1700  ,  264, 1709  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  264, 1709  ,  464, 1700  ,  464, 2006  ,  264, 2021  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  464, -442  ,  664, -430  ,  664, -130  ,  464, -136  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  464, -136  ,  664, -130  ,  664, 171  ,  464, 170  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  464, 170  ,  664, 171  ,  664, 471  ,  464, 476  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  464, 476  ,  664, 471  ,  664, 771  ,  464, 782  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  464, 782  ,  664, 771  ,  664, 1072  ,  464, 1088  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  464, 1088  ,  664, 1072  ,  664, 1372  ,  464, 1394  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  464, 1394  ,  664, 1372  ,  664, 1672  ,  464, 1700  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  464, 1700  ,  664, 1672  ,  664, 1973  ,  464, 2006  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  664, -430  ,  856, -386  ,  856, -375  ,  664, -130  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  664, -130  ,  856, -375  ,  856, -365  ,  664, 171  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  664, 171  ,  856, -365  ,  856, -355  ,  664, 471  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  664, 471  ,  856, -355  ,  856, -345  ,  664, 771  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  664, 771  ,  856, -345  ,  856, -334  ,  664, 1072  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  664, 1072  ,  856, -334  ,  856, -324  ,  664, 1372  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  664, 1372  ,  856, -324  ,  856, -314  ,  664, 1672  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  664, 1672  ,  856, -314  ,  856, -303  ,  664, 1973  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 313  ,  1364, 363  ,  1364, 694  ,  1164, 326  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 326  ,  1364, 694  ,  1364, 1025  ,  1164, 339  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 339  ,  1364, 1025  ,  1364, 1356  ,  1164, 352  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 352  ,  1364, 1356  ,  1364, 1687  ,  1164, 364  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 364  ,  1364, 1687  ,  1364, 2018  ,  1164, 377  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 377  ,  1364, 2018  ,  1364, 2349  ,  1164, 390  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 363  ,  1564, 393  ,  1564, 719  ,  1364, 694  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 694  ,  1564, 719  ,  1564, 1045  ,  1364, 1025  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 1025  ,  1564, 1045  ,  1564, 1371  ,  1364, 1356  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 1356  ,  1564, 1371  ,  1564, 1697  ,  1364, 1687  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 1687  ,  1564, 1697  ,  1564, 2023  ,  1364, 2018  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 2018  ,  1564, 2023  ,  1564, 2349  ,  1364, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 393  ,  1764, 406  ,  1764, 730  ,  1564, 719  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 719  ,  1764, 730  ,  1764, 1054  ,  1564, 1045  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1045  ,  1764, 1054  ,  1764, 1378  ,  1564, 1371  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1371  ,  1764, 1378  ,  1764, 1701  ,  1564, 1697  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1697  ,  1764, 1701  ,  1764, 2025  ,  1564, 2023  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 2023  ,  1764, 2025  ,  1764, 2349  ,  1564, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 406  ,  1964, 412  ,  1964, 735  ,  1764, 730  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 730  ,  1964, 735  ,  1964, 1057  ,  1764, 1054  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1054  ,  1964, 1057  ,  1964, 1380  ,  1764, 1378  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1378  ,  1964, 1380  ,  1964, 1703  ,  1764, 1701  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1701  ,  1964, 1703  ,  1964, 2026  ,  1764, 2025  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 2025  ,  1964, 2026  ,  1964, 2349  ,  1764, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 412  ,  2164, 420  ,  2164, 733  ,  1964, 735  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 735  ,  2164, 733  ,  2164, 1045  ,  1964, 1057  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1057  ,  2164, 1045  ,  2164, 1358  ,  1964, 1380  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1380  ,  2164, 1358  ,  2164, 1671  ,  1964, 1703  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1703  ,  2164, 1671  ,  2164, 1984  ,  1964, 2026  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 2026  ,  2164, 1984  ,  2164, 2296  ,  1964, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 420  ,  2364, 435  ,  2364, 727  ,  2164, 733  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 733  ,  2364, 727  ,  2364, 1019  ,  2164, 1045  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1045  ,  2364, 1019  ,  2364, 1311  ,  2164, 1358  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1358  ,  2364, 1311  ,  2364, 1603  ,  2164, 1671  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1671  ,  2364, 1603  ,  2364, 1895  ,  2164, 1984  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1984  ,  2364, 1895  ,  2364, 2187  ,  2164, 2296  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 435  ,  2564, 455  ,  2564, 777  ,  2364, 785  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 785  ,  2564, 777  ,  2564, 1099  ,  2364, 1135  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1135  ,  2564, 1099  ,  2564, 1421  ,  2364, 1486  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1486  ,  2564, 1421  ,  2564, 1743  ,  2364, 1836  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1836  ,  2564, 1743  ,  2564, 2065  ,  2364, 2187  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 455  ,  2764, 481  ,  2764, 772  ,  2564, 777  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 777  ,  2764, 772  ,  2764, 1063  ,  2564, 1099  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1099  ,  2764, 1063  ,  2764, 1353  ,  2564, 1421  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1421  ,  2764, 1353  ,  2764, 1644  ,  2564, 1743  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1743  ,  2764, 1644  ,  2764, 1935  ,  2564, 2065  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 481  ,  2964, 512  ,  2964, 769  ,  2764, 772  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 772  ,  2964, 769  ,  2964, 1026  ,  2764, 1063  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 1063  ,  2964, 1026  ,  2964, 1282  ,  2764, 1353  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 1353  ,  2964, 1282  ,  2964, 1539  ,  2764, 1644  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 1644  ,  2964, 1539  ,  2964, 1796  ,  2764, 1935  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 512  ,  3164, 546  ,  3164, 821  ,  2964, 833  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 833  ,  3164, 821  ,  3164, 1096  ,  2964, 1154  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 1154  ,  3164, 1096  ,  3164, 1371  ,  2964, 1475  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 1475  ,  3164, 1371  ,  3164, 1647  ,  2964, 1796  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 546  ,  3364, 580  ,  3364, 882  ,  3164, 913  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 913  ,  3364, 882  ,  3364, 1184  ,  3164, 1280  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 1280  ,  3364, 1184  ,  3364, 1487  ,  3164, 1647  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3364, 580  ,  3564, 612  ,  3564, 848  ,  3364, 882  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3364, 882  ,  3564, 848  ,  3564, 1084  ,  3364, 1184  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3364, 1184  ,  3564, 1084  ,  3564, 1321  ,  3364, 1487  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3564, 612  ,  3764, 643  ,  3764, 885  ,  3564, 966  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3564, 966  ,  3764, 885  ,  3764, 1126  ,  3564, 1321  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3764, 643  ,  3838, 655  ,  3838, 842  ,  3764, 885  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3764, 885  ,  3838, 842  ,  3838, 1029  ,  3764, 1126  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -228, -2042  ,  -28, -1979  ,  -28, -1803  ,  -228, -2013  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -28, -1979  ,  172, -1903  ,  172, -1558  ,  -28, -1803  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  172, -1903  ,  372, -1824  ,  372, -1395  ,  172, -1558  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  372, -1824  ,  572, -1754  ,  572, -1345  ,  372, -1395  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  572, -1754  ,  772, -1704  ,  772, -1318  ,  572, -1345  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  772, -1704  ,  972, -1677  ,  972, -1314  ,  772, -1318  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  972, -1677  ,  1172, -1669  ,  1172, -1327  ,  972, -1314  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1172, -1669  ,  1372, -1669  ,  1372, -1348  ,  1172, -1327  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1372, -1669  ,  1572, -1667  ,  1572, -1364  ,  1372, -1348  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1572, -1667  ,  1772, -1657  ,  1772, -1372  ,  1572, -1364  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1772, -1657  ,  1972, -1644  ,  1972, -1371  ,  1772, -1372  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1972, -1644  ,  2172, -1630  ,  2172, -1414  ,  1972, -1371  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2172, -1630  ,  2372, -1616  ,  2372, -1494  ,  2172, -1414  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2372, -1616  ,  2572, -1596  ,  2572, -1561  ,  2372, -1494  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2572, -1596  ,  2592, -1593  ,  2592, -1565  ,  2572, -1561  }
                    }
                    }
		,
		["2"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1575  ,  -3640, -1611  ,  -3640, -1295  ,  -3840, -1252  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1252  ,  -3640, -1295  ,  -3640, -979  ,  -3840, -929  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -929  ,  -3640, -979  ,  -3640, -663  ,  -3840, -606  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -606  ,  -3640, -663  ,  -3640, -346  ,  -3840, -283  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -283  ,  -3640, -346  ,  -3640, -30  ,  -3840, 40  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 40  ,  -3640, -30  ,  -3640, 286  ,  -3840, 363  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 363  ,  -3640, 286  ,  -3640, 602  ,  -3840, 686  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 686  ,  -3640, 602  ,  -3640, 918  ,  -3840, 1009  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1009  ,  -3640, 918  ,  -3640, 1235  ,  -3840, 1332  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1332  ,  -3640, 1235  ,  -3640, 1551  ,  -3840, 1655  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1655  ,  -3640, 1551  ,  -3640, 1867  ,  -3840, 1977  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1611  ,  -3440, -1561  ,  -3440, -1252  ,  -3640, -1295  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1295  ,  -3440, -1252  ,  -3440, -943  ,  -3640, -979  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -979  ,  -3440, -943  ,  -3440, -634  ,  -3640, -663  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -663  ,  -3440, -634  ,  -3440, -325  ,  -3640, -346  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -346  ,  -3440, -325  ,  -3440, -15  ,  -3640, -30  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -30  ,  -3440, -15  ,  -3440, 294  ,  -3640, 286  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 286  ,  -3440, 294  ,  -3440, 603  ,  -3640, 602  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 602  ,  -3440, 603  ,  -3440, 912  ,  -3640, 918  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 918  ,  -3440, 912  ,  -3440, 1222  ,  -3640, 1235  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1235  ,  -3440, 1222  ,  -3440, 1531  ,  -3640, 1551  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1551  ,  -3440, 1531  ,  -3440, 1840  ,  -3640, 1867  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1561  ,  -3240, -1478  ,  -3240, -1175  ,  -3440, -1252  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1252  ,  -3240, -1175  ,  -3240, -873  ,  -3440, -943  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -943  ,  -3240, -873  ,  -3240, -570  ,  -3440, -634  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -634  ,  -3240, -570  ,  -3240, -267  ,  -3440, -325  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -325  ,  -3240, -267  ,  -3240, 36  ,  -3440, -15  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -15  ,  -3240, 36  ,  -3240, 338  ,  -3440, 294  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 294  ,  -3240, 338  ,  -3240, 641  ,  -3440, 603  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 603  ,  -3240, 641  ,  -3240, 944  ,  -3440, 912  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 912  ,  -3240, 944  ,  -3240, 1247  ,  -3440, 1222  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1222  ,  -3240, 1247  ,  -3240, 1550  ,  -3440, 1531  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1531  ,  -3240, 1550  ,  -3240, 1852  ,  -3440, 1840  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1478  ,  -3040, -1434  ,  -3040, -1108  ,  -3240, -1145  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1145  ,  -3040, -1108  ,  -3040, -782  ,  -3240, -812  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -812  ,  -3040, -782  ,  -3040, -456  ,  -3240, -479  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -479  ,  -3040, -456  ,  -3040, -129  ,  -3240, -146  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -146  ,  -3040, -129  ,  -3040, 197  ,  -3240, 187  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 187  ,  -3040, 197  ,  -3040, 523  ,  -3240, 520  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 520  ,  -3040, 523  ,  -3040, 850  ,  -3240, 853  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 853  ,  -3040, 850  ,  -3040, 1176  ,  -3240, 1186  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1186  ,  -3040, 1176  ,  -3040, 1502  ,  -3240, 1519  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1519  ,  -3040, 1502  ,  -3040, 1829  ,  -3240, 1852  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1434  ,  -2840, -1461  ,  -2840, -1142  ,  -3040, -1108  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1108  ,  -2840, -1142  ,  -2840, -823  ,  -3040, -782  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -782  ,  -2840, -823  ,  -2840, -504  ,  -3040, -456  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -456  ,  -2840, -504  ,  -2840, -186  ,  -3040, -129  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -129  ,  -2840, -186  ,  -2840, 133  ,  -3040, 197  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 197  ,  -2840, 133  ,  -2840, 452  ,  -3040, 523  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 523  ,  -2840, 452  ,  -2840, 770  ,  -3040, 850  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 850  ,  -2840, 770  ,  -2840, 1089  ,  -3040, 1176  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1176  ,  -2840, 1089  ,  -2840, 1408  ,  -3040, 1502  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1502  ,  -2840, 1408  ,  -2840, 1727  ,  -3040, 1829  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1461  ,  -2640, -1535  ,  -2640, -1225  ,  -2840, -1142  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1142  ,  -2640, -1225  ,  -2640, -915  ,  -2840, -823  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -823  ,  -2640, -915  ,  -2640, -605  ,  -2840, -504  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -504  ,  -2640, -605  ,  -2640, -295  ,  -2840, -186  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -186  ,  -2640, -295  ,  -2640, 14  ,  -2840, 133  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 133  ,  -2640, 14  ,  -2640, 324  ,  -2840, 452  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 452  ,  -2640, 324  ,  -2640, 634  ,  -2840, 770  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 770  ,  -2640, 634  ,  -2640, 944  ,  -2840, 1089  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1089  ,  -2640, 944  ,  -2640, 1254  ,  -2840, 1408  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1408  ,  -2640, 1254  ,  -2640, 1563  ,  -2840, 1727  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1535  ,  -2440, -1621  ,  -2440, -1321  ,  -2640, -1225  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1225  ,  -2440, -1321  ,  -2440, -1021  ,  -2640, -915  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -915  ,  -2440, -1021  ,  -2440, -721  ,  -2640, -605  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -605  ,  -2440, -721  ,  -2440, -421  ,  -2640, -295  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -295  ,  -2440, -421  ,  -2440, -121  ,  -2640, 14  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 14  ,  -2440, -121  ,  -2440, 179  ,  -2640, 324  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 324  ,  -2440, 179  ,  -2440, 479  ,  -2640, 634  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 634  ,  -2440, 479  ,  -2440, 779  ,  -2640, 944  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 944  ,  -2440, 779  ,  -2440, 1079  ,  -2640, 1254  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1254  ,  -2440, 1079  ,  -2440, 1379  ,  -2640, 1563  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1621  ,  -2240, -1700  ,  -2240, -1377  ,  -2440, -1287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1287  ,  -2240, -1377  ,  -2240, -1054  ,  -2440, -954  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -954  ,  -2240, -1054  ,  -2240, -732  ,  -2440, -621  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -621  ,  -2240, -732  ,  -2240, -409  ,  -2440, -287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -287  ,  -2240, -409  ,  -2240, -86  ,  -2440, 46  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 46  ,  -2240, -86  ,  -2240, 237  ,  -2440, 379  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 379  ,  -2240, 237  ,  -2240, 560  ,  -2440, 712  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 712  ,  -2240, 560  ,  -2240, 883  ,  -2440, 1046  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1046  ,  -2240, 883  ,  -2240, 1206  ,  -2440, 1379  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1700  ,  -2040, -1761  ,  -2040, -1446  ,  -2240, -1377  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1377  ,  -2040, -1446  ,  -2040, -1131  ,  -2240, -1054  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1054  ,  -2040, -1131  ,  -2040, -816  ,  -2240, -732  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -732  ,  -2040, -816  ,  -2040, -500  ,  -2240, -409  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -409  ,  -2040, -500  ,  -2040, -185  ,  -2240, -86  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -86  ,  -2040, -185  ,  -2040, 130  ,  -2240, 237  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 237  ,  -2040, 130  ,  -2040, 445  ,  -2240, 560  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 560  ,  -2040, 445  ,  -2040, 761  ,  -2240, 883  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 883  ,  -2040, 761  ,  -2040, 1076  ,  -2240, 1206  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -1761  ,  -1844, -1780  ,  -1844, -1769  ,  -2040, -1446  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -1446  ,  -1844, -1769  ,  -1844, -1759  ,  -2040, -1131  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -1131  ,  -1844, -1759  ,  -1844, -1748  ,  -2040, -816  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -816  ,  -1844, -1748  ,  -1844, -1737  ,  -2040, -500  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -500  ,  -1844, -1737  ,  -1844, -1726  ,  -2040, -185  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -185  ,  -1844, -1726  ,  -1844, -1716  ,  -2040, 130  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 130  ,  -1844, -1716  ,  -1844, -1705  ,  -2040, 445  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 445  ,  -1844, -1705  ,  -1844, -1694  ,  -2040, 761  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 761  ,  -1844, -1694  ,  -1844, -1684  ,  -2040, 1076  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -931  ,  -1316, -861  ,  -1316, -558  ,  -1516, -920  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -920  ,  -1316, -558  ,  -1316, -255  ,  -1516, -909  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -909  ,  -1316, -255  ,  -1316, 48  ,  -1516, -899  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -899  ,  -1316, 48  ,  -1316, 352  ,  -1516, -888  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -888  ,  -1316, 352  ,  -1316, 655  ,  -1516, -878  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -878  ,  -1316, 655  ,  -1316, 958  ,  -1516, -867  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -867  ,  -1316, 958  ,  -1316, 1262  ,  -1516, -856  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -856  ,  -1316, 1262  ,  -1316, 1565  ,  -1516, -846  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1516, -846  ,  -1316, 1565  ,  -1316, 1868  ,  -1516, -835  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, -861  ,  -1116, -811  ,  -1116, -511  ,  -1316, -558  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, -558  ,  -1116, -511  ,  -1116, -210  ,  -1316, -255  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, -255  ,  -1116, -210  ,  -1116, 91  ,  -1316, 48  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, 48  ,  -1116, 91  ,  -1116, 392  ,  -1316, 352  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, 352  ,  -1116, 392  ,  -1116, 693  ,  -1316, 655  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, 655  ,  -1116, 693  ,  -1116, 994  ,  -1316, 958  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, 958  ,  -1116, 994  ,  -1116, 1295  ,  -1316, 1262  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, 1262  ,  -1116, 1295  ,  -1116, 1596  ,  -1316, 1565  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1316, 1565  ,  -1116, 1596  ,  -1116, 1897  ,  -1316, 1868  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, -811  ,  -916, -785  ,  -916, -447  ,  -1116, -473  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, -473  ,  -916, -447  ,  -916, -108  ,  -1116, -134  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, -134  ,  -916, -108  ,  -916, 231  ,  -1116, 204  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, 204  ,  -916, 231  ,  -916, 570  ,  -1116, 543  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, 543  ,  -916, 570  ,  -916, 909  ,  -1116, 881  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, 881  ,  -916, 909  ,  -916, 1248  ,  -1116, 1220  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, 1220  ,  -916, 1248  ,  -916, 1586  ,  -1116, 1558  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1116, 1558  ,  -916, 1586  ,  -916, 1925  ,  -1116, 1897  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, -785  ,  -716, -779  ,  -716, -476  ,  -916, -484  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, -484  ,  -716, -476  ,  -716, -173  ,  -916, -183  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, -183  ,  -716, -173  ,  -716, 131  ,  -916, 118  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 118  ,  -716, 131  ,  -716, 434  ,  -916, 419  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 419  ,  -716, 434  ,  -716, 738  ,  -916, 720  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 720  ,  -716, 738  ,  -716, 1041  ,  -916, 1022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 1022  ,  -716, 1041  ,  -716, 1344  ,  -916, 1323  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 1323  ,  -716, 1344  ,  -716, 1648  ,  -916, 1624  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -916, 1624  ,  -716, 1648  ,  -716, 1951  ,  -916, 1925  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, -779  ,  -516, -775  ,  -516, -469  ,  -716, -476  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, -476  ,  -516, -469  ,  -516, -162  ,  -716, -173  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, -173  ,  -516, -162  ,  -516, 144  ,  -716, 131  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 131  ,  -516, 144  ,  -516, 450  ,  -716, 434  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 434  ,  -516, 450  ,  -516, 757  ,  -716, 738  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 738  ,  -516, 757  ,  -516, 1063  ,  -716, 1041  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 1041  ,  -516, 1063  ,  -516, 1370  ,  -716, 1344  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 1344  ,  -516, 1370  ,  -516, 1676  ,  -716, 1648  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -716, 1648  ,  -516, 1676  ,  -516, 1983  ,  -716, 1951  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, -775  ,  -316, -756  ,  -316, -447  ,  -516, -469  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, -469  ,  -316, -447  ,  -316, -137  ,  -516, -162  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, -162  ,  -316, -137  ,  -316, 172  ,  -516, 144  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 144  ,  -316, 172  ,  -316, 481  ,  -516, 450  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 450  ,  -316, 481  ,  -316, 791  ,  -516, 757  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 757  ,  -316, 791  ,  -316, 1100  ,  -516, 1063  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 1063  ,  -316, 1100  ,  -316, 1409  ,  -516, 1370  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 1370  ,  -316, 1409  ,  -316, 1719  ,  -516, 1676  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -516, 1676  ,  -316, 1719  ,  -316, 2028  ,  -516, 1983  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, -756  ,  -116, -718  ,  -116, -407  ,  -316, -447  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, -447  ,  -116, -407  ,  -116, -97  ,  -316, -137  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, -137  ,  -116, -97  ,  -116, 214  ,  -316, 172  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 172  ,  -116, 214  ,  -116, 524  ,  -316, 481  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 481  ,  -116, 524  ,  -116, 835  ,  -316, 791  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 791  ,  -116, 835  ,  -116, 1145  ,  -316, 1100  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 1100  ,  -116, 1145  ,  -116, 1456  ,  -316, 1409  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 1409  ,  -116, 1456  ,  -116, 1767  ,  -316, 1719  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -316, 1719  ,  -116, 1767  ,  -116, 2077  ,  -316, 2028  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, -718  ,  84, -672  ,  84, -362  ,  -116, -407  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, -407  ,  84, -362  ,  84, -52  ,  -116, -97  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, -97  ,  84, -52  ,  84, 258  ,  -116, 214  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 214  ,  84, 258  ,  84, 568  ,  -116, 524  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 524  ,  84, 568  ,  84, 878  ,  -116, 835  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 835  ,  84, 878  ,  84, 1188  ,  -116, 1145  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 1145  ,  84, 1188  ,  84, 1498  ,  -116, 1456  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 1456  ,  84, 1498  ,  84, 1808  ,  -116, 1767  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -116, 1767  ,  84, 1808  ,  84, 2117  ,  -116, 2077  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, -672  ,  284, -629  ,  284, -321  ,  84, -362  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, -362  ,  284, -321  ,  284, -12  ,  84, -52  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, -52  ,  284, -12  ,  284, 297  ,  84, 258  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 258  ,  284, 297  ,  284, 606  ,  84, 568  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 568  ,  284, 606  ,  284, 915  ,  84, 878  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 878  ,  284, 915  ,  284, 1224  ,  84, 1188  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 1188  ,  284, 1224  ,  284, 1533  ,  84, 1498  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 1498  ,  284, 1533  ,  284, 1842  ,  84, 1808  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  84, 1808  ,  284, 1842  ,  284, 2150  ,  84, 2117  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, -629  ,  484, -591  ,  484, -282  ,  284, -321  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, -321  ,  484, -282  ,  484, 26  ,  284, -12  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, -12  ,  484, 26  ,  484, 335  ,  284, 297  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 297  ,  484, 335  ,  484, 643  ,  284, 606  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 606  ,  484, 643  ,  484, 952  ,  284, 915  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 915  ,  484, 952  ,  484, 1260  ,  284, 1224  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 1224  ,  484, 1260  ,  484, 1569  ,  284, 1533  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 1533  ,  484, 1569  ,  484, 1877  ,  284, 1842  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  284, 1842  ,  484, 1877  ,  484, 2186  ,  284, 2150  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, -591  ,  684, -546  ,  684, -238  ,  484, -282  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, -282  ,  684, -238  ,  684, 69  ,  484, 26  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 26  ,  684, 69  ,  684, 377  ,  484, 335  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 335  ,  684, 377  ,  684, 684  ,  484, 643  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 643  ,  684, 684  ,  684, 992  ,  484, 952  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 952  ,  684, 992  ,  684, 1300  ,  484, 1260  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 1260  ,  684, 1300  ,  684, 1607  ,  484, 1569  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 1569  ,  684, 1607  ,  684, 1915  ,  484, 1877  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  484, 1877  ,  684, 1915  ,  684, 2223  ,  484, 2186  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, -546  ,  884, -491  ,  884, -257  ,  684, -238  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, -238  ,  884, -257  ,  884, -23  ,  684, 69  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 69  ,  884, -23  ,  884, 210  ,  684, 377  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 377  ,  884, 210  ,  884, 444  ,  684, 684  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 684  ,  884, 444  ,  884, 678  ,  684, 992  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 992  ,  884, 678  ,  884, 912  ,  684, 1300  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 1300  ,  884, 912  ,  884, 1145  ,  684, 1607  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 1607  ,  884, 1145  ,  884, 1379  ,  684, 1915  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  684, 1915  ,  884, 1379  ,  884, 1613  ,  684, 2223  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, -491  ,  1084, -431  ,  1084, -395  ,  884, -190  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, -190  ,  1084, -395  ,  1084, -359  ,  884, 110  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 110  ,  1084, -359  ,  1084, -323  ,  884, 411  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 411  ,  1084, -323  ,  1084, -287  ,  884, 711  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 711  ,  1084, -287  ,  1084, -251  ,  884, 1012  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 1012  ,  1084, -251  ,  1084, -215  ,  884, 1312  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  884, 1312  ,  1084, -215  ,  1084, -179  ,  884, 1613  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1084, -431  ,  1134, -416  ,  1134, -384  ,  1084, -179  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1484, -361  ,  1684, -201  ,  1684, 94  ,  1484, -350  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1484, -350  ,  1684, 94  ,  1684, 388  ,  1484, -340  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1484, -340  ,  1684, 388  ,  1684, 683  ,  1484, -329  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1484, -329  ,  1684, 683  ,  1684, 978  ,  1484, -319  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1484, -319  ,  1684, 978  ,  1684, 1272  ,  1484, -308  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1484, -308  ,  1684, 1272  ,  1684, 1567  ,  1484, -298  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1684, -201  ,  1884, 5  ,  1884, 291  ,  1684, 94  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1684, 94  ,  1884, 291  ,  1884, 578  ,  1684, 388  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1684, 388  ,  1884, 578  ,  1884, 864  ,  1684, 683  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1684, 683  ,  1884, 864  ,  1884, 1150  ,  1684, 978  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1684, 978  ,  1884, 1150  ,  1884, 1437  ,  1684, 1272  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1684, 1272  ,  1884, 1437  ,  1884, 1723  ,  1684, 1567  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1884, 5  ,  2084, 218  ,  2084, 555  ,  1884, 348  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1884, 348  ,  2084, 555  ,  2084, 892  ,  1884, 692  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1884, 692  ,  2084, 892  ,  2084, 1228  ,  1884, 1036  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1884, 1036  ,  2084, 1228  ,  2084, 1565  ,  1884, 1380  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1884, 1380  ,  2084, 1565  ,  2084, 1902  ,  1884, 1723  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2084, 218  ,  2284, 415  ,  2284, 747  ,  2084, 555  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2084, 555  ,  2284, 747  ,  2284, 1079  ,  2084, 892  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2084, 892  ,  2284, 1079  ,  2284, 1411  ,  2084, 1228  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2084, 1228  ,  2284, 1411  ,  2284, 1743  ,  2084, 1565  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2084, 1565  ,  2284, 1743  ,  2284, 2076  ,  2084, 1902  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2284, 415  ,  2484, 592  ,  2484, 920  ,  2284, 747  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2284, 747  ,  2484, 920  ,  2484, 1249  ,  2284, 1079  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2284, 1079  ,  2484, 1249  ,  2484, 1577  ,  2284, 1411  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2284, 1411  ,  2484, 1577  ,  2484, 1906  ,  2284, 1743  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2284, 1743  ,  2484, 1906  ,  2484, 2234  ,  2284, 2076  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2484, 592  ,  2684, 743  ,  2684, 1064  ,  2484, 920  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2484, 920  ,  2684, 1064  ,  2684, 1386  ,  2484, 1249  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2484, 1249  ,  2684, 1386  ,  2684, 1707  ,  2484, 1577  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2484, 1577  ,  2684, 1707  ,  2684, 2028  ,  2484, 1906  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2484, 1906  ,  2684, 2028  ,  2684, 2349  ,  2484, 2234  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2684, 743  ,  2884, 856  ,  2884, 1155  ,  2684, 1064  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2684, 1064  ,  2884, 1155  ,  2884, 1453  ,  2684, 1386  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2684, 1386  ,  2884, 1453  ,  2884, 1752  ,  2684, 1707  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2684, 1707  ,  2884, 1752  ,  2884, 2050  ,  2684, 2028  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2684, 2028  ,  2884, 2050  ,  2884, 2349  ,  2684, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2884, 856  ,  3084, 927  ,  3084, 1211  ,  2884, 1155  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2884, 1155  ,  3084, 1211  ,  3084, 1496  ,  2884, 1453  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2884, 1453  ,  3084, 1496  ,  3084, 1780  ,  2884, 1752  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2884, 1752  ,  3084, 1780  ,  3084, 2065  ,  2884, 2050  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2884, 2050  ,  3084, 2065  ,  3084, 2349  ,  2884, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3084, 927  ,  3284, 970  ,  3284, 1315  ,  3084, 1282  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3084, 1282  ,  3284, 1315  ,  3284, 1660  ,  3084, 1638  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3084, 1638  ,  3284, 1660  ,  3284, 2004  ,  3084, 1993  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3084, 1993  ,  3284, 2004  ,  3284, 2349  ,  3084, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3284, 970  ,  3484, 1008  ,  3484, 1343  ,  3284, 1315  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3284, 1315  ,  3484, 1343  ,  3484, 1679  ,  3284, 1660  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3284, 1660  ,  3484, 1679  ,  3484, 2014  ,  3284, 2004  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3284, 2004  ,  3484, 2014  ,  3484, 2349  ,  3284, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3484, 1008  ,  3684, 1054  ,  3684, 1377  ,  3484, 1343  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3484, 1343  ,  3684, 1377  ,  3684, 1701  ,  3484, 1679  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3484, 1679  ,  3684, 1701  ,  3684, 2025  ,  3484, 2014  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3484, 2014  ,  3684, 2025  ,  3684, 2349  ,  3484, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3684, 1054  ,  3838, 1095  ,  3838, 1408  ,  3684, 1377  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3684, 1377  ,  3838, 1408  ,  3838, 1722  ,  3684, 1701  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3684, 1701  ,  3838, 1722  ,  3838, 2035  ,  3684, 2025  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3684, 2025  ,  3838, 2035  ,  3838, 2349  ,  3684, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1664, -1348  ,  1864, -1293  ,  1864, -1110  ,  1664, -1319  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1864, -1293  ,  2064, -1228  ,  2064, -879  ,  1864, -1110  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2064, -1228  ,  2264, -1161  ,  2264, -750  ,  2064, -879  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2264, -1161  ,  2464, -1096  ,  2464, -703  ,  2264, -750  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2464, -1096  ,  2664, -1040  ,  2664, -658  ,  2464, -703  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2664, -1040  ,  2864, -999  ,  2864, -629  ,  2664, -658  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2864, -999  ,  3064, -969  ,  3064, -618  ,  2864, -629  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3064, -969  ,  3264, -939  ,  3264, -616  ,  3064, -618  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3264, -939  ,  3464, -898  ,  3464, -610  ,  3264, -616  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3464, -898  ,  3664, -844  ,  3664, -630  ,  3464, -610  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3664, -844  ,  3838, -784  ,  3838, -659  ,  3664, -630  }
                    }
                    }
		,
		["3"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1288  ,  -3640, -1236  ,  -3640, -928  ,  -3840, -974  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -974  ,  -3640, -928  ,  -3640, -620  ,  -3840, -660  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -660  ,  -3640, -620  ,  -3640, -313  ,  -3840, -346  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -346  ,  -3640, -313  ,  -3640, -5  ,  -3840, -32  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -32  ,  -3640, -5  ,  -3640, 303  ,  -3840, 282  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 282  ,  -3640, 303  ,  -3640, 611  ,  -3840, 596  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 596  ,  -3640, 611  ,  -3640, 919  ,  -3840, 910  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 910  ,  -3640, 919  ,  -3640, 1227  ,  -3840, 1224  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1224  ,  -3640, 1227  ,  -3640, 1534  ,  -3840, 1538  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1538  ,  -3640, 1534  ,  -3640, 1842  ,  -3840, 1852  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1852  ,  -3640, 1842  ,  -3640, 2150  ,  -3840, 2166  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1236  ,  -3440, -1188  ,  -3440, -887  ,  -3640, -928  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -928  ,  -3440, -887  ,  -3440, -586  ,  -3640, -620  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -620  ,  -3440, -586  ,  -3440, -285  ,  -3640, -313  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -313  ,  -3440, -285  ,  -3440, 16  ,  -3640, -5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -5  ,  -3440, 16  ,  -3440, 317  ,  -3640, 303  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 303  ,  -3440, 317  ,  -3440, 618  ,  -3640, 611  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 611  ,  -3440, 618  ,  -3440, 919  ,  -3640, 919  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 919  ,  -3440, 919  ,  -3440, 1220  ,  -3640, 1227  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1227  ,  -3440, 1220  ,  -3440, 1521  ,  -3640, 1534  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1534  ,  -3440, 1521  ,  -3440, 1821  ,  -3640, 1842  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1842  ,  -3440, 1821  ,  -3440, 2122  ,  -3640, 2150  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1188  ,  -3240, -1140  ,  -3240, -818  ,  -3440, -857  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -857  ,  -3240, -818  ,  -3240, -495  ,  -3440, -526  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -526  ,  -3240, -495  ,  -3240, -172  ,  -3440, -195  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -195  ,  -3240, -172  ,  -3240, 151  ,  -3440, 136  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 136  ,  -3240, 151  ,  -3240, 474  ,  -3440, 467  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 467  ,  -3240, 474  ,  -3240, 796  ,  -3440, 798  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 798  ,  -3240, 796  ,  -3240, 1119  ,  -3440, 1129  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1129  ,  -3240, 1119  ,  -3240, 1442  ,  -3440, 1460  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1460  ,  -3240, 1442  ,  -3240, 1765  ,  -3440, 1791  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1791  ,  -3240, 1765  ,  -3240, 2087  ,  -3440, 2122  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1140  ,  -3040, -1091  ,  -3040, -777  ,  -3240, -818  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -818  ,  -3040, -777  ,  -3040, -463  ,  -3240, -495  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -495  ,  -3040, -463  ,  -3040, -149  ,  -3240, -172  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -172  ,  -3040, -149  ,  -3040, 165  ,  -3240, 151  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 151  ,  -3040, 165  ,  -3040, 479  ,  -3240, 474  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 474  ,  -3040, 479  ,  -3040, 793  ,  -3240, 796  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 796  ,  -3040, 793  ,  -3040, 1106  ,  -3240, 1119  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1119  ,  -3040, 1106  ,  -3040, 1420  ,  -3240, 1442  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1442  ,  -3040, 1420  ,  -3040, 1734  ,  -3240, 1765  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1765  ,  -3040, 1734  ,  -3040, 2048  ,  -3240, 2087  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1091  ,  -2840, -1039  ,  -2840, -734  ,  -3040, -777  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -777  ,  -2840, -734  ,  -2840, -430  ,  -3040, -463  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -463  ,  -2840, -430  ,  -2840, -125  ,  -3040, -149  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -149  ,  -2840, -125  ,  -2840, 179  ,  -3040, 165  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 165  ,  -2840, 179  ,  -2840, 484  ,  -3040, 479  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 479  ,  -2840, 484  ,  -2840, 788  ,  -3040, 793  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 793  ,  -2840, 788  ,  -2840, 1092  ,  -3040, 1106  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1106  ,  -2840, 1092  ,  -2840, 1397  ,  -3040, 1420  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1420  ,  -2840, 1397  ,  -2840, 1701  ,  -3040, 1734  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1734  ,  -2840, 1701  ,  -2840, 2006  ,  -3040, 2048  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1039  ,  -2640, -986  ,  -2640, -691  ,  -2840, -734  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -734  ,  -2640, -691  ,  -2640, -397  ,  -2840, -430  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -430  ,  -2640, -397  ,  -2640, -102  ,  -2840, -125  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -125  ,  -2640, -102  ,  -2640, 192  ,  -2840, 179  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 179  ,  -2640, 192  ,  -2640, 487  ,  -2840, 484  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 484  ,  -2640, 487  ,  -2640, 781  ,  -2840, 788  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 788  ,  -2640, 781  ,  -2640, 1076  ,  -2840, 1092  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1092  ,  -2640, 1076  ,  -2640, 1370  ,  -2840, 1397  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1397  ,  -2640, 1370  ,  -2640, 1665  ,  -2840, 1701  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1701  ,  -2640, 1665  ,  -2640, 1960  ,  -2840, 2006  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -986  ,  -2440, -936  ,  -2440, -620  ,  -2640, -659  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -659  ,  -2440, -620  ,  -2440, -304  ,  -2640, -331  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -331  ,  -2440, -304  ,  -2440, 12  ,  -2640, -4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -4  ,  -2440, 12  ,  -2440, 328  ,  -2640, 323  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 323  ,  -2440, 328  ,  -2440, 644  ,  -2640, 650  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 650  ,  -2440, 644  ,  -2440, 960  ,  -2640, 978  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 978  ,  -2440, 960  ,  -2440, 1276  ,  -2640, 1305  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1305  ,  -2440, 1276  ,  -2440, 1591  ,  -2640, 1632  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1632  ,  -2440, 1591  ,  -2440, 1907  ,  -2640, 1960  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -936  ,  -2240, -890  ,  -2240, -586  ,  -2440, -620  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -620  ,  -2240, -586  ,  -2240, -282  ,  -2440, -304  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -304  ,  -2240, -282  ,  -2240, 22  ,  -2440, 12  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 12  ,  -2240, 22  ,  -2240, 326  ,  -2440, 328  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 328  ,  -2240, 326  ,  -2240, 630  ,  -2440, 644  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 644  ,  -2240, 630  ,  -2240, 935  ,  -2440, 960  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 960  ,  -2240, 935  ,  -2240, 1239  ,  -2440, 1276  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1276  ,  -2240, 1239  ,  -2240, 1543  ,  -2440, 1591  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1591  ,  -2240, 1543  ,  -2240, 1847  ,  -2440, 1907  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -890  ,  -2040, -850  ,  -2040, -558  ,  -2240, -586  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -586  ,  -2040, -558  ,  -2040, -266  ,  -2240, -282  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -282  ,  -2040, -266  ,  -2040, 25  ,  -2240, 22  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 22  ,  -2040, 25  ,  -2040, 317  ,  -2240, 326  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 326  ,  -2040, 317  ,  -2040, 609  ,  -2240, 630  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 630  ,  -2040, 609  ,  -2040, 901  ,  -2240, 935  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 935  ,  -2040, 901  ,  -2040, 1193  ,  -2240, 1239  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1239  ,  -2040, 1193  ,  -2040, 1485  ,  -2240, 1543  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1543  ,  -2040, 1485  ,  -2040, 1777  ,  -2240, 1847  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -850  ,  -1840, -816  ,  -1840, -501  ,  -2040, -522  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -522  ,  -1840, -501  ,  -1840, -187  ,  -2040, -193  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -193  ,  -1840, -187  ,  -1840, 127  ,  -2040, 135  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 135  ,  -1840, 127  ,  -1840, 442  ,  -2040, 463  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 463  ,  -1840, 442  ,  -1840, 756  ,  -2040, 792  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 792  ,  -1840, 756  ,  -1840, 1070  ,  -2040, 1120  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1120  ,  -1840, 1070  ,  -1840, 1385  ,  -2040, 1449  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1449  ,  -1840, 1385  ,  -1840, 1699  ,  -2040, 1777  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -816  ,  -1640, -784  ,  -1640, -484  ,  -1840, -501  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -501  ,  -1640, -484  ,  -1640, -183  ,  -1840, -187  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -187  ,  -1640, -183  ,  -1640, 117  ,  -1840, 127  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 127  ,  -1640, 117  ,  -1640, 417  ,  -1840, 442  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 442  ,  -1640, 417  ,  -1640, 717  ,  -1840, 756  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 756  ,  -1640, 717  ,  -1640, 1017  ,  -1840, 1070  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 1070  ,  -1640, 1017  ,  -1640, 1317  ,  -1840, 1385  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 1385  ,  -1640, 1317  ,  -1640, 1617  ,  -1840, 1699  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -784  ,  -1440, -751  ,  -1440, -465  ,  -1640, -484  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -484  ,  -1440, -465  ,  -1440, -179  ,  -1640, -183  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -183  ,  -1440, -179  ,  -1440, 106  ,  -1640, 117  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 117  ,  -1440, 106  ,  -1440, 392  ,  -1640, 417  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 417  ,  -1440, 392  ,  -1440, 678  ,  -1640, 717  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 717  ,  -1440, 678  ,  -1440, 964  ,  -1640, 1017  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 1017  ,  -1440, 964  ,  -1440, 1250  ,  -1640, 1317  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 1317  ,  -1440, 1250  ,  -1440, 1536  ,  -1640, 1617  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, -751  ,  -1240, -717  ,  -1240, -406  ,  -1440, -425  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, -425  ,  -1240, -406  ,  -1240, -94  ,  -1440, -98  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, -98  ,  -1240, -94  ,  -1240, 217  ,  -1440, 229  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 229  ,  -1240, 217  ,  -1240, 528  ,  -1440, 556  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 556  ,  -1240, 528  ,  -1240, 839  ,  -1440, 883  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 883  ,  -1240, 839  ,  -1240, 1150  ,  -1440, 1210  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 1210  ,  -1240, 1150  ,  -1240, 1462  ,  -1440, 1536  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, -717  ,  -1040, -678  ,  -1040, -382  ,  -1240, -406  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, -406  ,  -1040, -382  ,  -1040, -86  ,  -1240, -94  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, -94  ,  -1040, -86  ,  -1040, 211  ,  -1240, 217  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 217  ,  -1040, 211  ,  -1040, 507  ,  -1240, 528  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 528  ,  -1040, 507  ,  -1040, 803  ,  -1240, 839  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 839  ,  -1040, 803  ,  -1040, 1100  ,  -1240, 1150  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 1150  ,  -1040, 1100  ,  -1040, 1396  ,  -1240, 1462  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, -678  ,  -840, -636  ,  -840, -306  ,  -1040, -333  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, -333  ,  -840, -306  ,  -840, 23  ,  -1040, 13  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 13  ,  -840, 23  ,  -840, 353  ,  -1040, 359  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 359  ,  -840, 353  ,  -840, 683  ,  -1040, 705  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 705  ,  -840, 683  ,  -840, 1013  ,  -1040, 1050  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 1050  ,  -840, 1013  ,  -840, 1342  ,  -1040, 1396  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, -636  ,  -640, -589  ,  -640, -279  ,  -840, -306  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, -306  ,  -640, -279  ,  -640, 31  ,  -840, 23  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 23  ,  -640, 31  ,  -640, 342  ,  -840, 353  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 353  ,  -640, 342  ,  -640, 652  ,  -840, 683  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 683  ,  -640, 652  ,  -640, 962  ,  -840, 1013  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 1013  ,  -640, 962  ,  -640, 1272  ,  -840, 1342  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, -589  ,  -440, -536  ,  -440, -333  ,  -640, -279  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, -279  ,  -440, -333  ,  -440, -130  ,  -640, 31  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 31  ,  -440, -130  ,  -440, 74  ,  -640, 342  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 342  ,  -440, 74  ,  -440, 277  ,  -640, 652  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 652  ,  -440, 277  ,  -440, 480  ,  -640, 962  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 962  ,  -440, 480  ,  -440, 684  ,  -640, 1272  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -440, -536  ,  -240, -475  ,  -240, -376  ,  -440, -231  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -440, -231  ,  -240, -376  ,  -240, -277  ,  -440, 74  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -440, 74  ,  -240, -277  ,  -240, -178  ,  -440, 379  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -440, 379  ,  -240, -178  ,  -240, -79  ,  -440, 684  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -240, -475  ,  -90, -423  ,  -90, -394  ,  -240, -79  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, -223  ,  524, -152  ,  524, 161  ,  324, -211  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, -211  ,  524, 161  ,  524, 473  ,  324, -200  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, -200  ,  524, 473  ,  524, 786  ,  324, -188  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, -188  ,  524, 786  ,  524, 1099  ,  324, -176  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, -176  ,  524, 1099  ,  524, 1411  ,  324, -165  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, -165  ,  524, 1411  ,  524, 1724  ,  324, -153  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, -153  ,  524, 1724  ,  524, 2036  ,  324, -141  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  324, -141  ,  524, 2036  ,  524, 2349  ,  324, -129  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, -152  ,  724, -57  ,  724, 244  ,  524, 161  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 161  ,  724, 244  ,  724, 544  ,  524, 473  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 473  ,  724, 544  ,  724, 845  ,  524, 786  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 786  ,  724, 845  ,  724, 1146  ,  524, 1099  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 1099  ,  724, 1146  ,  724, 1447  ,  524, 1411  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 1411  ,  724, 1447  ,  724, 1747  ,  524, 1724  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 1724  ,  724, 1747  ,  724, 2048  ,  524, 2036  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  524, 2036  ,  724, 2048  ,  724, 2349  ,  524, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, -57  ,  924, 54  ,  924, 341  ,  724, 244  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 244  ,  924, 341  ,  924, 628  ,  724, 544  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 544  ,  924, 628  ,  924, 915  ,  724, 845  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 845  ,  924, 915  ,  924, 1202  ,  724, 1146  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 1146  ,  924, 1202  ,  924, 1488  ,  724, 1447  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 1447  ,  924, 1488  ,  924, 1775  ,  724, 1747  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 1747  ,  924, 1775  ,  924, 2062  ,  724, 2048  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  724, 2048  ,  924, 2062  ,  924, 2349  ,  724, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 54  ,  1124, 171  ,  1124, 471  ,  924, 382  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 382  ,  1124, 471  ,  1124, 772  ,  924, 710  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 710  ,  1124, 772  ,  1124, 1073  ,  924, 1038  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 1038  ,  1124, 1073  ,  1124, 1374  ,  924, 1365  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 1365  ,  1124, 1374  ,  1124, 1675  ,  924, 1693  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 1693  ,  1124, 1675  ,  1124, 1975  ,  924, 2021  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  924, 2021  ,  1124, 1975  ,  1124, 2276  ,  924, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 171  ,  1324, 282  ,  1324, 554  ,  1124, 471  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 471  ,  1324, 554  ,  1324, 826  ,  1124, 772  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 772  ,  1324, 826  ,  1324, 1097  ,  1124, 1073  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 1073  ,  1324, 1097  ,  1324, 1369  ,  1124, 1374  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 1374  ,  1324, 1369  ,  1324, 1640  ,  1124, 1675  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 1675  ,  1324, 1640  ,  1324, 1912  ,  1124, 1975  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1124, 1975  ,  1324, 1912  ,  1324, 2183  ,  1124, 2276  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1324, 282  ,  1524, 384  ,  1524, 672  ,  1324, 599  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1324, 599  ,  1524, 672  ,  1524, 960  ,  1324, 916  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1324, 916  ,  1524, 960  ,  1524, 1248  ,  1324, 1233  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1324, 1233  ,  1524, 1248  ,  1524, 1536  ,  1324, 1550  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1324, 1550  ,  1524, 1536  ,  1524, 1824  ,  1324, 1867  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1324, 1867  ,  1524, 1824  ,  1524, 2112  ,  1324, 2183  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1524, 384  ,  1724, 475  ,  1724, 796  ,  1524, 730  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1524, 730  ,  1724, 796  ,  1724, 1117  ,  1524, 1075  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1524, 1075  ,  1724, 1117  ,  1724, 1437  ,  1524, 1421  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1524, 1421  ,  1724, 1437  ,  1724, 1758  ,  1524, 1766  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1524, 1766  ,  1724, 1758  ,  1724, 2078  ,  1524, 2112  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1724, 475  ,  1924, 560  ,  1924, 866  ,  1724, 796  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1724, 796  ,  1924, 866  ,  1924, 1172  ,  1724, 1117  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1724, 1117  ,  1924, 1172  ,  1924, 1478  ,  1724, 1437  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1724, 1437  ,  1924, 1478  ,  1924, 1785  ,  1724, 1758  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1724, 1758  ,  1924, 1785  ,  1924, 2091  ,  1724, 2078  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1924, 560  ,  2124, 639  ,  2124, 940  ,  1924, 866  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1924, 866  ,  2124, 940  ,  2124, 1241  ,  1924, 1172  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1924, 1172  ,  2124, 1241  ,  2124, 1542  ,  1924, 1478  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1924, 1478  ,  2124, 1542  ,  2124, 1843  ,  1924, 1785  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1924, 1785  ,  2124, 1843  ,  2124, 2144  ,  1924, 2091  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2124, 639  ,  2324, 713  ,  2324, 1015  ,  2124, 940  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2124, 940  ,  2324, 1015  ,  2324, 1317  ,  2124, 1241  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2124, 1241  ,  2324, 1317  ,  2324, 1619  ,  2124, 1542  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2124, 1542  ,  2324, 1619  ,  2324, 1921  ,  2124, 1843  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2124, 1843  ,  2324, 1921  ,  2324, 2224  ,  2124, 2144  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2324, 713  ,  2524, 782  ,  2524, 1087  ,  2324, 1015  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2324, 1015  ,  2524, 1087  ,  2524, 1392  ,  2324, 1317  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2324, 1317  ,  2524, 1392  ,  2524, 1697  ,  2324, 1619  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2324, 1619  ,  2524, 1697  ,  2524, 2002  ,  2324, 1921  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2324, 1921  ,  2524, 2002  ,  2524, 2307  ,  2324, 2224  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2524, 782  ,  2724, 845  ,  2724, 1146  ,  2524, 1087  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2524, 1087  ,  2724, 1146  ,  2724, 1446  ,  2524, 1392  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2524, 1392  ,  2724, 1446  ,  2724, 1747  ,  2524, 1697  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2524, 1697  ,  2724, 1747  ,  2724, 2048  ,  2524, 2002  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2524, 2002  ,  2724, 2048  ,  2724, 2349  ,  2524, 2307  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2724, 845  ,  2924, 906  ,  2924, 1194  ,  2724, 1146  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2724, 1146  ,  2924, 1194  ,  2924, 1483  ,  2724, 1446  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2724, 1446  ,  2924, 1483  ,  2924, 1772  ,  2724, 1747  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2724, 1747  ,  2924, 1772  ,  2924, 2060  ,  2724, 2048  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2724, 2048  ,  2924, 2060  ,  2924, 2349  ,  2724, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2924, 906  ,  3124, 970  ,  3124, 1246  ,  2924, 1194  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2924, 1194  ,  3124, 1246  ,  3124, 1522  ,  2924, 1483  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2924, 1483  ,  3124, 1522  ,  3124, 1797  ,  2924, 1772  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2924, 1772  ,  3124, 1797  ,  3124, 2073  ,  2924, 2060  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2924, 2060  ,  3124, 2073  ,  3124, 2349  ,  2924, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3124, 970  ,  3324, 1041  ,  3324, 1368  ,  3124, 1315  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3124, 1315  ,  3324, 1368  ,  3324, 1695  ,  3124, 1659  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3124, 1659  ,  3324, 1695  ,  3324, 2022  ,  3124, 2004  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3124, 2004  ,  3324, 2022  ,  3324, 2349  ,  3124, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3324, 1041  ,  3524, 1117  ,  3524, 1425  ,  3324, 1368  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3324, 1368  ,  3524, 1425  ,  3524, 1733  ,  3324, 1695  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3324, 1695  ,  3524, 1733  ,  3524, 2041  ,  3324, 2022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3324, 2022  ,  3524, 2041  ,  3524, 2349  ,  3324, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3524, 1117  ,  3724, 1191  ,  3724, 1467  ,  3524, 1425  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3524, 1425  ,  3724, 1467  ,  3724, 1743  ,  3524, 1733  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3524, 1733  ,  3724, 1743  ,  3724, 2020  ,  3524, 2041  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3524, 2041  ,  3724, 2020  ,  3724, 2296  ,  3524, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3724, 1191  ,  3838, 1229  ,  3838, 1570  ,  3724, 1559  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3724, 1559  ,  3838, 1570  ,  3838, 1912  ,  3724, 1928  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3724, 1928  ,  3838, 1912  ,  3838, 2254  ,  3724, 2296  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1114, -1523  ,  1314, -1471  ,  1314, -1349  ,  1114, -1494  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1314, -1471  ,  1514, -1401  ,  1514, -1169  ,  1314, -1349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1514, -1401  ,  1714, -1318  ,  1714, -1019  ,  1514, -1169  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1714, -1318  ,  1914, -1234  ,  1914, -912  ,  1714, -1019  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1914, -1234  ,  2114, -1165  ,  2114, -815  ,  1914, -912  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2114, -1165  ,  2314, -1120  ,  2314, -745  ,  2114, -815  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2314, -1120  ,  2514, -1099  ,  2514, -705  ,  2314, -745  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2514, -1099  ,  2714, -1087  ,  2714, -686  ,  2514, -705  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2714, -1087  ,  2914, -1070  ,  2914, -672  ,  2714, -686  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2914, -1070  ,  3114, -1037  ,  3114, -667  ,  2914, -672  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3114, -1037  ,  3314, -985  ,  3314, -721  ,  3114, -667  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3314, -985  ,  3514, -921  ,  3514, -787  ,  3314, -721  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3514, -921  ,  3714, -860  ,  3714, -828  ,  3514, -787  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3714, -860  ,  3724, -857  ,  3724, -829  ,  3714, -828  }
                    }
                    }
		,
		["4"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1752  ,  -3640, -1633  ,  -3640, -1324  ,  -3840, -1446  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1446  ,  -3640, -1324  ,  -3640, -1015  ,  -3840, -1140  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1140  ,  -3640, -1015  ,  -3640, -705  ,  -3840, -834  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -834  ,  -3640, -705  ,  -3640, -396  ,  -3840, -529  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -529  ,  -3640, -396  ,  -3640, -87  ,  -3840, -223  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -223  ,  -3640, -87  ,  -3640, 222  ,  -3840, 83  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 83  ,  -3640, 222  ,  -3640, 532  ,  -3840, 389  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 389  ,  -3640, 532  ,  -3640, 841  ,  -3840, 694  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 694  ,  -3640, 841  ,  -3640, 1150  ,  -3840, 1000  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1633  ,  -3440, -1509  ,  -3440, -1194  ,  -3640, -1324  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1324  ,  -3440, -1194  ,  -3440, -880  ,  -3640, -1015  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1015  ,  -3440, -880  ,  -3440, -565  ,  -3640, -705  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -705  ,  -3440, -565  ,  -3440, -251  ,  -3640, -396  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -396  ,  -3440, -251  ,  -3440, 64  ,  -3640, -87  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -87  ,  -3440, 64  ,  -3440, 378  ,  -3640, 222  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 222  ,  -3440, 378  ,  -3440, 693  ,  -3640, 532  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 532  ,  -3440, 693  ,  -3440, 1007  ,  -3640, 841  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 841  ,  -3440, 1007  ,  -3440, 1322  ,  -3640, 1150  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1509  ,  -3240, -1381  ,  -3240, -1060  ,  -3440, -1194  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1194  ,  -3240, -1060  ,  -3240, -739  ,  -3440, -880  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -880  ,  -3240, -739  ,  -3240, -419  ,  -3440, -565  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -565  ,  -3240, -419  ,  -3240, -98  ,  -3440, -251  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -251  ,  -3240, -98  ,  -3240, 223  ,  -3440, 64  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 64  ,  -3240, 223  ,  -3240, 543  ,  -3440, 378  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 378  ,  -3240, 543  ,  -3240, 864  ,  -3440, 693  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 693  ,  -3240, 864  ,  -3240, 1185  ,  -3440, 1007  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1007  ,  -3240, 1185  ,  -3240, 1505  ,  -3440, 1322  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1381  ,  -3040, -1251  ,  -3040, -924  ,  -3240, -1060  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1060  ,  -3040, -924  ,  -3040, -598  ,  -3240, -739  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -739  ,  -3040, -598  ,  -3040, -271  ,  -3240, -419  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -419  ,  -3040, -271  ,  -3040, 56  ,  -3240, -98  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -98  ,  -3040, 56  ,  -3040, 383  ,  -3240, 223  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 223  ,  -3040, 383  ,  -3040, 709  ,  -3240, 543  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 543  ,  -3040, 709  ,  -3040, 1036  ,  -3240, 864  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 864  ,  -3040, 1036  ,  -3040, 1363  ,  -3240, 1185  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1185  ,  -3040, 1363  ,  -3040, 1690  ,  -3240, 1505  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1251  ,  -2840, -1120  ,  -2840, -789  ,  -3040, -924  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -924  ,  -2840, -789  ,  -2840, -457  ,  -3040, -598  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -598  ,  -2840, -457  ,  -2840, -125  ,  -3040, -271  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -271  ,  -2840, -125  ,  -2840, 206  ,  -3040, 56  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 56  ,  -2840, 206  ,  -2840, 538  ,  -3040, 383  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 383  ,  -2840, 538  ,  -2840, 870  ,  -3040, 709  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 709  ,  -2840, 870  ,  -2840, 1201  ,  -3040, 1036  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1036  ,  -2840, 1201  ,  -2840, 1533  ,  -3040, 1363  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1363  ,  -2840, 1533  ,  -2840, 1865  ,  -3040, 1690  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1120  ,  -2640, -989  ,  -2640, -654  ,  -2840, -789  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -789  ,  -2640, -654  ,  -2640, -320  ,  -2840, -457  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -457  ,  -2640, -320  ,  -2640, 15  ,  -2840, -125  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -125  ,  -2640, 15  ,  -2640, 349  ,  -2840, 206  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 206  ,  -2640, 349  ,  -2640, 684  ,  -2840, 538  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 538  ,  -2640, 684  ,  -2640, 1019  ,  -2840, 870  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 870  ,  -2640, 1019  ,  -2640, 1353  ,  -2840, 1201  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1201  ,  -2640, 1353  ,  -2640, 1688  ,  -2840, 1533  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1533  ,  -2640, 1688  ,  -2640, 2022  ,  -2840, 1865  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -989  ,  -2440, -857  ,  -2440, -522  ,  -2640, -654  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -654  ,  -2440, -522  ,  -2440, -187  ,  -2640, -320  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -320  ,  -2440, -187  ,  -2440, 148  ,  -2640, 15  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 15  ,  -2440, 148  ,  -2440, 483  ,  -2640, 349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 349  ,  -2440, 483  ,  -2440, 818  ,  -2640, 684  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 684  ,  -2440, 818  ,  -2440, 1154  ,  -2640, 1019  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1019  ,  -2440, 1154  ,  -2440, 1489  ,  -2640, 1353  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1353  ,  -2440, 1489  ,  -2440, 1824  ,  -2640, 1688  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1688  ,  -2440, 1824  ,  -2440, 2159  ,  -2640, 2022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -857  ,  -2240, -726  ,  -2240, -393  ,  -2440, -522  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -522  ,  -2240, -393  ,  -2240, -59  ,  -2440, -187  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -187  ,  -2240, -59  ,  -2240, 274  ,  -2440, 148  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 148  ,  -2240, 274  ,  -2240, 607  ,  -2440, 483  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 483  ,  -2240, 607  ,  -2240, 940  ,  -2440, 818  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 818  ,  -2240, 940  ,  -2240, 1273  ,  -2440, 1154  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1154  ,  -2240, 1273  ,  -2240, 1606  ,  -2440, 1489  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1489  ,  -2240, 1606  ,  -2240, 1939  ,  -2440, 1824  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1824  ,  -2240, 1939  ,  -2240, 2273  ,  -2440, 2159  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -726  ,  -2040, -600  ,  -2040, -273  ,  -2240, -393  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -393  ,  -2040, -273  ,  -2040, 55  ,  -2240, -59  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -59  ,  -2040, 55  ,  -2040, 383  ,  -2240, 274  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 274  ,  -2040, 383  ,  -2040, 711  ,  -2240, 607  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 607  ,  -2040, 711  ,  -2040, 1038  ,  -2240, 940  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 940  ,  -2040, 1038  ,  -2040, 1366  ,  -2240, 1273  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1273  ,  -2040, 1366  ,  -2040, 1694  ,  -2240, 1606  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1606  ,  -2040, 1694  ,  -2040, 2021  ,  -2240, 1939  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1939  ,  -2040, 2021  ,  -2040, 2349  ,  -2240, 2273  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -600  ,  -1840, -487  ,  -1840, -172  ,  -2040, -273  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -273  ,  -1840, -172  ,  -1840, 143  ,  -2040, 55  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 55  ,  -1840, 143  ,  -1840, 458  ,  -2040, 383  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 383  ,  -1840, 458  ,  -1840, 773  ,  -2040, 711  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 711  ,  -1840, 773  ,  -1840, 1089  ,  -2040, 1038  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1038  ,  -1840, 1089  ,  -1840, 1404  ,  -2040, 1366  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1366  ,  -1840, 1404  ,  -1840, 1719  ,  -2040, 1694  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1694  ,  -1840, 1719  ,  -1840, 2034  ,  -2040, 2021  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 2021  ,  -1840, 2034  ,  -1840, 2349  ,  -2040, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -487  ,  -1640, -392  ,  -1640, -88  ,  -1840, -172  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -172  ,  -1640, -88  ,  -1640, 217  ,  -1840, 143  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 143  ,  -1640, 217  ,  -1640, 522  ,  -1840, 458  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 458  ,  -1640, 522  ,  -1640, 826  ,  -1840, 773  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 773  ,  -1640, 826  ,  -1640, 1131  ,  -1840, 1089  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 1089  ,  -1640, 1131  ,  -1640, 1435  ,  -1840, 1404  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 1404  ,  -1640, 1435  ,  -1640, 1740  ,  -1840, 1719  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 1719  ,  -1640, 1740  ,  -1640, 2044  ,  -1840, 2034  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, 2034  ,  -1640, 2044  ,  -1640, 2349  ,  -1840, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -392  ,  -1440, -317  ,  -1440, -21  ,  -1640, -88  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, -88  ,  -1440, -21  ,  -1440, 276  ,  -1640, 217  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 217  ,  -1440, 276  ,  -1440, 572  ,  -1640, 522  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 522  ,  -1440, 572  ,  -1440, 868  ,  -1640, 826  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 826  ,  -1440, 868  ,  -1440, 1164  ,  -1640, 1131  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 1131  ,  -1440, 1164  ,  -1440, 1460  ,  -1640, 1435  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 1435  ,  -1440, 1460  ,  -1440, 1757  ,  -1640, 1740  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 1740  ,  -1440, 1757  ,  -1440, 2053  ,  -1640, 2044  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1640, 2044  ,  -1440, 2053  ,  -1440, 2349  ,  -1640, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, -317  ,  -1240, -257  ,  -1240, 69  ,  -1440, 16  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 16  ,  -1240, 69  ,  -1240, 394  ,  -1440, 350  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 350  ,  -1240, 394  ,  -1240, 720  ,  -1440, 683  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 683  ,  -1240, 720  ,  -1240, 1046  ,  -1440, 1016  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 1016  ,  -1240, 1046  ,  -1240, 1372  ,  -1440, 1349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 1349  ,  -1240, 1372  ,  -1240, 1697  ,  -1440, 1683  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 1683  ,  -1240, 1697  ,  -1240, 2023  ,  -1440, 2016  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1440, 2016  ,  -1240, 2023  ,  -1240, 2349  ,  -1440, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, -257  ,  -1040, -206  ,  -1040, 113  ,  -1240, 69  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 69  ,  -1040, 113  ,  -1040, 433  ,  -1240, 394  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 394  ,  -1040, 433  ,  -1040, 752  ,  -1240, 720  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 720  ,  -1040, 752  ,  -1040, 1072  ,  -1240, 1046  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 1046  ,  -1040, 1072  ,  -1040, 1391  ,  -1240, 1372  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 1372  ,  -1040, 1391  ,  -1040, 1710  ,  -1240, 1697  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 1697  ,  -1040, 1710  ,  -1040, 2030  ,  -1240, 2023  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, 2023  ,  -1040, 2030  ,  -1040, 2349  ,  -1240, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, -206  ,  -840, -155  ,  -840, 152  ,  -1040, 113  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 113  ,  -840, 152  ,  -840, 459  ,  -1040, 433  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 433  ,  -840, 459  ,  -840, 766  ,  -1040, 752  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 752  ,  -840, 766  ,  -840, 1073  ,  -1040, 1072  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 1072  ,  -840, 1073  ,  -840, 1381  ,  -1040, 1391  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 1391  ,  -840, 1381  ,  -840, 1688  ,  -1040, 1710  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 1710  ,  -840, 1688  ,  -840, 1995  ,  -1040, 2030  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, 2030  ,  -840, 1995  ,  -840, 2302  ,  -1040, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, -155  ,  -640, -98  ,  -640, 26  ,  -840, 152  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 152  ,  -640, 26  ,  -640, 151  ,  -840, 459  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 459  ,  -640, 151  ,  -640, 275  ,  -840, 766  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 766  ,  -640, 275  ,  -640, 399  ,  -840, 1073  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 1073  ,  -640, 399  ,  -640, 524  ,  -840, 1381  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 1381  ,  -640, 524  ,  -640, 648  ,  -840, 1688  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 1688  ,  -640, 648  ,  -640, 772  ,  -840, 1995  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -840, 1995  ,  -640, 772  ,  -640, 897  ,  -840, 2302  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, -98  ,  -470, -41  ,  -470, -31  ,  -640, 234  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 234  ,  -470, -31  ,  -470, -22  ,  -640, 565  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -640, 565  ,  -470, -22  ,  -470, -12  ,  -640, 897  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 524  ,  164, 543  ,  164, 840  ,  -36, 534  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 534  ,  164, 840  ,  164, 1138  ,  -36, 545  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 545  ,  164, 1138  ,  164, 1436  ,  -36, 555  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 555  ,  164, 1436  ,  164, 1734  ,  -36, 565  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 565  ,  164, 1734  ,  164, 2032  ,  -36, 576  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -36, 576  ,  164, 2032  ,  164, 2330  ,  -36, 586  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 543  ,  364, 561  ,  364, 858  ,  164, 840  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 840  ,  364, 858  ,  364, 1156  ,  164, 1138  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 1138  ,  364, 1156  ,  364, 1453  ,  164, 1436  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 1436  ,  364, 1453  ,  364, 1751  ,  164, 1734  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 1734  ,  364, 1751  ,  364, 2048  ,  164, 2032  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  164, 2032  ,  364, 2048  ,  364, 2346  ,  164, 2330  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 561  ,  564, 577  ,  564, 873  ,  364, 858  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 858  ,  564, 873  ,  564, 1168  ,  364, 1156  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 1156  ,  564, 1168  ,  564, 1463  ,  364, 1453  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 1453  ,  564, 1463  ,  564, 1758  ,  364, 1751  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 1751  ,  564, 1758  ,  564, 2054  ,  364, 2048  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  364, 2048  ,  564, 2054  ,  564, 2349  ,  364, 2346  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 577  ,  764, 592  ,  764, 885  ,  564, 873  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 873  ,  764, 885  ,  764, 1178  ,  564, 1168  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 1168  ,  764, 1178  ,  764, 1470  ,  564, 1463  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 1463  ,  764, 1470  ,  764, 1763  ,  564, 1758  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 1758  ,  764, 1763  ,  764, 2056  ,  564, 2054  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  564, 2054  ,  764, 2056  ,  764, 2349  ,  564, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 592  ,  964, 605  ,  964, 954  ,  764, 943  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 943  ,  964, 954  ,  964, 1303  ,  764, 1295  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 1295  ,  964, 1303  ,  964, 1651  ,  764, 1646  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 1646  ,  964, 1651  ,  964, 2000  ,  764, 1998  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  764, 1998  ,  964, 2000  ,  964, 2349  ,  764, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  964, 605  ,  1164, 618  ,  1164, 964  ,  964, 954  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  964, 954  ,  1164, 964  ,  1164, 1310  ,  964, 1303  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  964, 1303  ,  1164, 1310  ,  1164, 1657  ,  964, 1651  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  964, 1651  ,  1164, 1657  ,  1164, 2003  ,  964, 2000  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  964, 2000  ,  1164, 2003  ,  1164, 2349  ,  964, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 618  ,  1364, 632  ,  1364, 976  ,  1164, 964  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 964  ,  1364, 976  ,  1364, 1319  ,  1164, 1310  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 1310  ,  1364, 1319  ,  1364, 1662  ,  1164, 1657  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 1657  ,  1364, 1662  ,  1364, 2006  ,  1164, 2003  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1164, 2003  ,  1364, 2006  ,  1364, 2349  ,  1164, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 632  ,  1564, 648  ,  1564, 988  ,  1364, 976  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 976  ,  1564, 988  ,  1564, 1328  ,  1364, 1319  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 1319  ,  1564, 1328  ,  1564, 1669  ,  1364, 1662  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 1662  ,  1564, 1669  ,  1564, 2009  ,  1364, 2006  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1364, 2006  ,  1564, 2009  ,  1564, 2349  ,  1364, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 648  ,  1764, 663  ,  1764, 1000  ,  1564, 988  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 988  ,  1764, 1000  ,  1764, 1337  ,  1564, 1328  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1328  ,  1764, 1337  ,  1764, 1675  ,  1564, 1669  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 1669  ,  1764, 1675  ,  1764, 2012  ,  1564, 2009  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1564, 2009  ,  1764, 2012  ,  1764, 2349  ,  1564, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 663  ,  1964, 673  ,  1964, 1009  ,  1764, 1000  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1000  ,  1964, 1009  ,  1964, 1344  ,  1764, 1337  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1337  ,  1964, 1344  ,  1964, 1679  ,  1764, 1675  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 1675  ,  1964, 1679  ,  1964, 2014  ,  1764, 2012  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1764, 2012  ,  1964, 2014  ,  1964, 2349  ,  1764, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 673  ,  2164, 676  ,  2164, 1011  ,  1964, 1009  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1009  ,  2164, 1011  ,  2164, 1345  ,  1964, 1344  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1344  ,  2164, 1345  ,  2164, 1680  ,  1964, 1679  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 1679  ,  2164, 1680  ,  2164, 2014  ,  1964, 2014  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1964, 2014  ,  2164, 2014  ,  2164, 2349  ,  1964, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 676  ,  2364, 673  ,  2364, 1002  ,  2164, 1011  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1011  ,  2364, 1002  ,  2364, 1331  ,  2164, 1345  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1345  ,  2364, 1331  ,  2364, 1660  ,  2164, 1680  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 1680  ,  2364, 1660  ,  2364, 1989  ,  2164, 2014  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2164, 2014  ,  2364, 1989  ,  2364, 2318  ,  2164, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 673  ,  2564, 669  ,  2564, 982  ,  2364, 1002  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1002  ,  2564, 982  ,  2564, 1295  ,  2364, 1331  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1331  ,  2564, 1295  ,  2564, 1608  ,  2364, 1660  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1660  ,  2564, 1608  ,  2564, 1921  ,  2364, 1989  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2364, 1989  ,  2564, 1921  ,  2564, 2234  ,  2364, 2318  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 669  ,  2764, 677  ,  2764, 972  ,  2564, 982  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 982  ,  2764, 972  ,  2764, 1267  ,  2564, 1295  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1295  ,  2764, 1267  ,  2764, 1561  ,  2564, 1608  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1608  ,  2764, 1561  ,  2764, 1856  ,  2564, 1921  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2564, 1921  ,  2764, 1856  ,  2764, 2150  ,  2564, 2234  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 677  ,  2964, 714  ,  2964, 988  ,  2764, 972  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 972  ,  2964, 988  ,  2964, 1262  ,  2764, 1267  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 1267  ,  2964, 1262  ,  2964, 1536  ,  2764, 1561  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 1561  ,  2964, 1536  ,  2964, 1810  ,  2764, 1856  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2764, 1856  ,  2964, 1810  ,  2964, 2084  ,  2764, 2150  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 714  ,  3164, 791  ,  3164, 1106  ,  2964, 1057  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 1057  ,  3164, 1106  ,  3164, 1421  ,  2964, 1399  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 1399  ,  3164, 1421  ,  3164, 1737  ,  2964, 1742  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2964, 1742  ,  3164, 1737  ,  3164, 2052  ,  2964, 2084  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 791  ,  3364, 909  ,  3364, 1198  ,  3164, 1106  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 1106  ,  3364, 1198  ,  3364, 1486  ,  3164, 1421  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 1421  ,  3364, 1486  ,  3364, 1774  ,  3164, 1737  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3164, 1737  ,  3364, 1774  ,  3364, 2062  ,  3164, 2052  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3364, 909  ,  3564, 1059  ,  3564, 1322  ,  3364, 1198  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3364, 1198  ,  3564, 1322  ,  3564, 1584  ,  3364, 1486  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3364, 1486  ,  3564, 1584  ,  3564, 1847  ,  3364, 1774  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3364, 1774  ,  3564, 1847  ,  3564, 2110  ,  3364, 2062  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3564, 1059  ,  3764, 1218  ,  3764, 1538  ,  3564, 1409  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3564, 1409  ,  3764, 1538  ,  3764, 1858  ,  3564, 1759  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3564, 1759  ,  3764, 1858  ,  3764, 2178  ,  3564, 2110  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3764, 1218  ,  3838, 1275  ,  3838, 1584  ,  3764, 1538  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3764, 1538  ,  3838, 1584  ,  3838, 1894  ,  3764, 1858  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3764, 1858  ,  3838, 1894  ,  3838, 2204  ,  3764, 2178  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -644, -1055  ,  -444, -1080  ,  -444, -867  ,  -644, -1026  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -444, -1080  ,  -244, -1105  ,  -244, -666  ,  -444, -867  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -244, -1105  ,  -44, -1129  ,  -44, -845  ,  -244, -886  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -244, -886  ,  -44, -845  ,  -44, -561  ,  -244, -666  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -44, -1129  ,  156, -1151  ,  156, -871  ,  -44, -845  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -44, -845  ,  156, -871  ,  156, -590  ,  -44, -561  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  156, -1151  ,  356, -1173  ,  356, -898  ,  156, -871  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  156, -871  ,  356, -898  ,  356, -623  ,  156, -590  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  356, -1173  ,  556, -1195  ,  556, -926  ,  356, -898  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  356, -898  ,  556, -926  ,  556, -657  ,  356, -623  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  556, -1195  ,  756, -1219  ,  756, -956  ,  556, -926  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  556, -926  ,  756, -956  ,  756, -693  ,  556, -657  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  756, -1219  ,  956, -1245  ,  956, -989  ,  756, -956  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  756, -956  ,  956, -989  ,  956, -733  ,  756, -693  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  956, -1245  ,  1156, -1273  ,  1156, -1025  ,  956, -989  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  956, -989  ,  1156, -1025  ,  1156, -777  ,  956, -733  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1156, -1273  ,  1356, -1302  ,  1356, -1063  ,  1156, -1025  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1156, -1025  ,  1356, -1063  ,  1356, -823  ,  1156, -777  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1356, -1302  ,  1556, -1332  ,  1556, -872  ,  1356, -823  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1556, -1332  ,  1756, -1360  ,  1756, -921  ,  1556, -872  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1756, -1360  ,  1956, -1387  ,  1956, -969  ,  1756, -921  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1956, -1387  ,  2156, -1411  ,  2156, -1016  ,  1956, -969  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2156, -1411  ,  2356, -1435  ,  2356, -1060  ,  2156, -1016  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2356, -1435  ,  2556, -1458  ,  2556, -1104  ,  2356, -1060  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2556, -1458  ,  2756, -1483  ,  2756, -1148  ,  2556, -1104  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2756, -1483  ,  2956, -1510  ,  2956, -1203  ,  2756, -1148  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2956, -1510  ,  3156, -1539  ,  3156, -1285  ,  2956, -1203  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3156, -1539  ,  3356, -1567  ,  3356, -1381  ,  3156, -1285  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3356, -1567  ,  3556, -1594  ,  3556, -1477  ,  3356, -1381  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3556, -1594  ,  3756, -1619  ,  3756, -1560  ,  3556, -1477  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3756, -1619  ,  3838, -1628  ,  3838, -1589  ,  3756, -1560  }
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
