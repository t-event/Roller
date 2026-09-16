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
                    shape = {  -3840, -2177  ,  -3640, -2042  ,  -3640, -1728  ,  -3840, -1853  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1853  ,  -3640, -1728  ,  -3640, -1415  ,  -3840, -1530  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1530  ,  -3640, -1415  ,  -3640, -1101  ,  -3840, -1207  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1207  ,  -3640, -1101  ,  -3640, -788  ,  -3840, -884  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -884  ,  -3640, -788  ,  -3640, -474  ,  -3840, -560  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -560  ,  -3640, -474  ,  -3640, -160  ,  -3840, -237  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -237  ,  -3640, -160  ,  -3640, 153  ,  -3840, 86  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 86  ,  -3640, 153  ,  -3640, 467  ,  -3840, 409  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 409  ,  -3640, 467  ,  -3640, 781  ,  -3840, 733  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 733  ,  -3640, 781  ,  -3640, 1094  ,  -3840, 1056  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1056  ,  -3640, 1094  ,  -3640, 1408  ,  -3840, 1379  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1379  ,  -3640, 1408  ,  -3640, 1722  ,  -3840, 1702  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1702  ,  -3640, 1722  ,  -3640, 2035  ,  -3840, 2026  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 2026  ,  -3640, 2035  ,  -3640, 2349  ,  -3840, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -2042  ,  -3440, -1908  ,  -3440, -1607  ,  -3640, -1728  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1728  ,  -3440, -1607  ,  -3440, -1307  ,  -3640, -1415  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1415  ,  -3440, -1307  ,  -3440, -1007  ,  -3640, -1101  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1101  ,  -3440, -1007  ,  -3440, -706  ,  -3640, -788  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -788  ,  -3440, -706  ,  -3440, -406  ,  -3640, -474  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -474  ,  -3440, -406  ,  -3440, -105  ,  -3640, -160  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -160  ,  -3440, -105  ,  -3440, 195  ,  -3640, 153  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 153  ,  -3440, 195  ,  -3440, 495  ,  -3640, 467  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 467  ,  -3440, 495  ,  -3440, 796  ,  -3640, 781  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 781  ,  -3440, 796  ,  -3440, 1096  ,  -3640, 1094  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1094  ,  -3440, 1096  ,  -3440, 1396  ,  -3640, 1408  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1408  ,  -3440, 1396  ,  -3440, 1697  ,  -3640, 1722  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1722  ,  -3440, 1697  ,  -3440, 1997  ,  -3640, 2035  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 2035  ,  -3440, 1997  ,  -3440, 2298  ,  -3640, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1908  ,  -3240, -1782  ,  -3240, -1478  ,  -3440, -1584  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1584  ,  -3240, -1478  ,  -3240, -1174  ,  -3440, -1261  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1261  ,  -3240, -1174  ,  -3240, -871  ,  -3440, -937  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -937  ,  -3240, -871  ,  -3240, -567  ,  -3440, -614  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -614  ,  -3240, -567  ,  -3240, -263  ,  -3440, -290  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -290  ,  -3240, -263  ,  -3240, 40  ,  -3440, 33  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 33  ,  -3240, 40  ,  -3240, 344  ,  -3440, 357  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 357  ,  -3240, 344  ,  -3240, 648  ,  -3440, 680  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 680  ,  -3240, 648  ,  -3240, 951  ,  -3440, 1004  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1004  ,  -3240, 951  ,  -3240, 1255  ,  -3440, 1327  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1327  ,  -3240, 1255  ,  -3240, 1559  ,  -3440, 1651  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1651  ,  -3240, 1559  ,  -3240, 1862  ,  -3440, 1974  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1974  ,  -3240, 1862  ,  -3240, 2166  ,  -3440, 2298  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1782  ,  -3040, -1671  ,  -3040, -1365  ,  -3240, -1453  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1453  ,  -3040, -1365  ,  -3040, -1059  ,  -3240, -1124  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1124  ,  -3040, -1059  ,  -3040, -754  ,  -3240, -795  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -795  ,  -3040, -754  ,  -3040, -448  ,  -3240, -466  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -466  ,  -3040, -448  ,  -3040, -143  ,  -3240, -137  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -137  ,  -3040, -143  ,  -3040, 163  ,  -3240, 192  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 192  ,  -3040, 163  ,  -3040, 469  ,  -3240, 521  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 521  ,  -3040, 469  ,  -3040, 774  ,  -3240, 850  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 850  ,  -3040, 774  ,  -3040, 1080  ,  -3240, 1179  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1179  ,  -3040, 1080  ,  -3040, 1385  ,  -3240, 1508  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1508  ,  -3040, 1385  ,  -3040, 1691  ,  -3240, 1837  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1837  ,  -3040, 1691  ,  -3040, 1997  ,  -3240, 2166  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1671  ,  -2840, -1575  ,  -2840, -1268  ,  -3040, -1337  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1337  ,  -2840, -1268  ,  -2840, -961  ,  -3040, -1004  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1004  ,  -2840, -961  ,  -2840, -654  ,  -3040, -671  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -671  ,  -2840, -654  ,  -2840, -348  ,  -3040, -337  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -337  ,  -2840, -348  ,  -2840, -41  ,  -3040, -4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -4  ,  -2840, -41  ,  -2840, 266  ,  -3040, 330  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 330  ,  -2840, 266  ,  -2840, 573  ,  -3040, 663  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 663  ,  -2840, 573  ,  -2840, 880  ,  -3040, 997  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 997  ,  -2840, 880  ,  -2840, 1187  ,  -3040, 1330  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1330  ,  -2840, 1187  ,  -2840, 1494  ,  -3040, 1663  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1663  ,  -2840, 1494  ,  -2840, 1800  ,  -3040, 1997  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1575  ,  -2640, -1492  ,  -2640, -1214  ,  -2840, -1268  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1268  ,  -2640, -1214  ,  -2640, -935  ,  -2840, -961  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -961  ,  -2640, -935  ,  -2640, -657  ,  -2840, -654  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -654  ,  -2640, -657  ,  -2640, -379  ,  -2840, -348  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -348  ,  -2640, -379  ,  -2640, -101  ,  -2840, -41  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -41  ,  -2640, -101  ,  -2640, 178  ,  -2840, 266  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 266  ,  -2640, 178  ,  -2640, 456  ,  -2840, 573  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 573  ,  -2640, 456  ,  -2640, 734  ,  -2840, 880  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 880  ,  -2640, 734  ,  -2640, 1012  ,  -2840, 1187  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1187  ,  -2640, 1012  ,  -2640, 1290  ,  -2840, 1494  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1494  ,  -2640, 1290  ,  -2640, 1569  ,  -2840, 1800  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1492  ,  -2440, -1419  ,  -2440, -1147  ,  -2640, -1186  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1186  ,  -2440, -1147  ,  -2440, -876  ,  -2640, -880  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -880  ,  -2440, -876  ,  -2440, -605  ,  -2640, -574  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -574  ,  -2440, -605  ,  -2440, -334  ,  -2640, -268  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -268  ,  -2440, -334  ,  -2440, -63  ,  -2640, 38  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 38  ,  -2440, -63  ,  -2440, 208  ,  -2640, 344  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 344  ,  -2440, 208  ,  -2440, 479  ,  -2640, 651  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 651  ,  -2440, 479  ,  -2440, 750  ,  -2640, 957  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 957  ,  -2440, 750  ,  -2440, 1021  ,  -2640, 1263  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1263  ,  -2440, 1021  ,  -2440, 1293  ,  -2640, 1569  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1419  ,  -2240, -1352  ,  -2240, -1079  ,  -2440, -1080  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1080  ,  -2240, -1079  ,  -2240, -806  ,  -2440, -741  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -741  ,  -2240, -806  ,  -2240, -533  ,  -2440, -402  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -402  ,  -2240, -533  ,  -2240, -260  ,  -2440, -63  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -63  ,  -2240, -260  ,  -2240, 14  ,  -2440, 276  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 276  ,  -2240, 14  ,  -2240, 287  ,  -2440, 615  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 615  ,  -2240, 287  ,  -2240, 560  ,  -2440, 954  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 954  ,  -2240, 560  ,  -2240, 833  ,  -2440, 1293  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1352  ,  -2058, -1297  ,  -2058, -1292  ,  -2240, -1040  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1040  ,  -2058, -1292  ,  -2058, -1287  ,  -2240, -728  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -728  ,  -2058, -1287  ,  -2058, -1282  ,  -2240, -416  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -416  ,  -2058, -1282  ,  -2058, -1277  ,  -2240, -103  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -103  ,  -2058, -1277  ,  -2058, -1273  ,  -2240, 209  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 209  ,  -2058, -1273  ,  -2058, -1268  ,  -2240, 521  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 521  ,  -2058, -1268  ,  -2058, -1263  ,  -2240, 833  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1664, -658  ,  -1464, -500  ,  -1464, -172  ,  -1664, -654  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1664, -654  ,  -1464, -172  ,  -1464, 156  ,  -1664, -649  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1664, -649  ,  -1464, 156  ,  -1464, 485  ,  -1664, -644  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1664, -644  ,  -1464, 485  ,  -1464, 813  ,  -1664, -639  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1664, -639  ,  -1464, 813  ,  -1464, 1141  ,  -1664, -635  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1664, -635  ,  -1464, 1141  ,  -1464, 1469  ,  -1664, -630  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1464, -500  ,  -1264, -345  ,  -1264, -29  ,  -1464, -172  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1464, -172  ,  -1264, -29  ,  -1264, 287  ,  -1464, 156  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1464, 156  ,  -1264, 287  ,  -1264, 603  ,  -1464, 485  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1464, 485  ,  -1264, 603  ,  -1264, 918  ,  -1464, 813  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1464, 813  ,  -1264, 918  ,  -1264, 1234  ,  -1464, 1141  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1464, 1141  ,  -1264, 1234  ,  -1264, 1550  ,  -1464, 1469  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1264, -345  ,  -1210, -304  ,  -1210, 8  ,  -1264, -29  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1264, -29  ,  -1210, 8  ,  -1210, 321  ,  -1264, 287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1264, 287  ,  -1210, 321  ,  -1210, 633  ,  -1264, 603  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1264, 603  ,  -1210, 633  ,  -1210, 946  ,  -1264, 918  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1264, 918  ,  -1210, 946  ,  -1210, 1258  ,  -1264, 1234  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1264, 1234  ,  -1210, 1258  ,  -1210, 1571  ,  -1264, 1550  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1210, -304  ,  -1064, -204  ,  -1064, 107  ,  -1210, 8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1210, 8  ,  -1064, 107  ,  -1064, 418  ,  -1210, 321  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1210, 321  ,  -1064, 418  ,  -1064, 729  ,  -1210, 633  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1210, 633  ,  -1064, 729  ,  -1064, 1041  ,  -1210, 946  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1210, 946  ,  -1064, 1041  ,  -1064, 1352  ,  -1210, 1258  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1210, 1258  ,  -1064, 1352  ,  -1064, 1663  ,  -1210, 1571  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1064, -204  ,  -864, -104  ,  -864, 221  ,  -1064, 107  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1064, 107  ,  -864, 221  ,  -864, 547  ,  -1064, 418  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1064, 418  ,  -864, 547  ,  -864, 872  ,  -1064, 729  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1064, 729  ,  -864, 872  ,  -864, 1198  ,  -1064, 1041  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1064, 1041  ,  -864, 1198  ,  -864, 1523  ,  -1064, 1352  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1064, 1352  ,  -864, 1523  ,  -864, 1849  ,  -1064, 1663  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -864, -104  ,  -664, -44  ,  -664, 256  ,  -864, 175  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -864, 175  ,  -664, 256  ,  -664, 557  ,  -864, 454  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -864, 454  ,  -664, 557  ,  -664, 857  ,  -864, 733  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -864, 733  ,  -664, 857  ,  -664, 1157  ,  -864, 1012  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -864, 1012  ,  -664, 1157  ,  -664, 1458  ,  -864, 1291  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -864, 1291  ,  -664, 1458  ,  -664, 1758  ,  -864, 1570  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -864, 1570  ,  -664, 1758  ,  -664, 2058  ,  -864, 1849  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -664, -44  ,  -464, 5  ,  -464, 329  ,  -664, 256  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -664, 256  ,  -464, 329  ,  -464, 653  ,  -664, 557  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -664, 557  ,  -464, 653  ,  -464, 977  ,  -664, 857  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -664, 857  ,  -464, 977  ,  -464, 1301  ,  -664, 1157  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -664, 1157  ,  -464, 1301  ,  -464, 1624  ,  -664, 1458  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -664, 1458  ,  -464, 1624  ,  -464, 1948  ,  -664, 1758  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -664, 1758  ,  -464, 1948  ,  -464, 2272  ,  -664, 2058  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -464, 5  ,  -264, 57  ,  -264, 384  ,  -464, 329  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -464, 329  ,  -264, 384  ,  -264, 712  ,  -464, 653  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -464, 653  ,  -264, 712  ,  -264, 1039  ,  -464, 977  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -464, 977  ,  -264, 1039  ,  -264, 1367  ,  -464, 1301  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -464, 1301  ,  -264, 1367  ,  -264, 1694  ,  -464, 1624  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -464, 1624  ,  -264, 1694  ,  -264, 2022  ,  -464, 1948  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -464, 1948  ,  -264, 2022  ,  -264, 2349  ,  -464, 2272  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -264, 57  ,  -152, 87  ,  -152, 410  ,  -264, 384  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -264, 384  ,  -152, 410  ,  -152, 733  ,  -264, 712  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -264, 712  ,  -152, 733  ,  -152, 1056  ,  -264, 1039  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -264, 1039  ,  -152, 1056  ,  -152, 1380  ,  -264, 1367  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -264, 1367  ,  -152, 1380  ,  -152, 1703  ,  -264, 1694  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -264, 1694  ,  -152, 1703  ,  -152, 2026  ,  -264, 2022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -264, 2022  ,  -152, 2026  ,  -152, 2349  ,  -264, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -152, 87  ,  -64, 111  ,  -64, 431  ,  -152, 410  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -152, 410  ,  -64, 431  ,  -64, 751  ,  -152, 733  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -152, 733  ,  -64, 751  ,  -64, 1070  ,  -152, 1056  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -152, 1056  ,  -64, 1070  ,  -64, 1390  ,  -152, 1380  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -152, 1380  ,  -64, 1390  ,  -64, 1710  ,  -152, 1703  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -152, 1703  ,  -64, 1710  ,  -64, 2029  ,  -152, 2026  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -152, 2026  ,  -64, 2029  ,  -64, 2349  ,  -152, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -64, 111  ,  136, 164  ,  136, 321  ,  -64, 431  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -64, 431  ,  136, 321  ,  136, 478  ,  -64, 751  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -64, 751  ,  136, 478  ,  136, 635  ,  -64, 1070  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -64, 1070  ,  136, 635  ,  136, 791  ,  -64, 1390  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -64, 1390  ,  136, 791  ,  136, 948  ,  -64, 1710  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -64, 1710  ,  136, 948  ,  136, 1105  ,  -64, 2029  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -64, 2029  ,  136, 1105  ,  136, 1262  ,  -64, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  136, 164  ,  336, 213  ,  336, 242  ,  136, 530  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  136, 530  ,  336, 242  ,  336, 272  ,  136, 896  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  136, 896  ,  336, 272  ,  336, 301  ,  136, 1262  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  336, 213  ,  364, 220  ,  364, 249  ,  336, 301  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  778, 857  ,  978, 950  ,  978, 1300  ,  778, 865  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  778, 865  ,  978, 1300  ,  978, 1650  ,  778, 874  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  778, 874  ,  978, 1650  ,  978, 1999  ,  778, 882  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  778, 882  ,  978, 1999  ,  978, 2349  ,  778, 890  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  978, 950  ,  1178, 1043  ,  1178, 1370  ,  978, 1300  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  978, 1300  ,  1178, 1370  ,  1178, 1696  ,  978, 1650  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  978, 1650  ,  1178, 1696  ,  1178, 2023  ,  978, 1999  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  978, 1999  ,  1178, 2023  ,  1178, 2349  ,  978, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1178, 1043  ,  1378, 1136  ,  1378, 1439  ,  1178, 1370  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1178, 1370  ,  1378, 1439  ,  1378, 1742  ,  1178, 1696  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1178, 1696  ,  1378, 1742  ,  1378, 2046  ,  1178, 2023  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1178, 2023  ,  1378, 2046  ,  1378, 2349  ,  1178, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1378, 1136  ,  1578, 1226  ,  1578, 1507  ,  1378, 1439  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1378, 1439  ,  1578, 1507  ,  1578, 1788  ,  1378, 1742  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1378, 1742  ,  1578, 1788  ,  1578, 2068  ,  1378, 2046  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1378, 2046  ,  1578, 2068  ,  1578, 2349  ,  1378, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1578, 1226  ,  1778, 1315  ,  1778, 1573  ,  1578, 1507  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1578, 1507  ,  1778, 1573  ,  1778, 1832  ,  1578, 1788  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1578, 1788  ,  1778, 1832  ,  1778, 2090  ,  1578, 2068  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1578, 2068  ,  1778, 2090  ,  1778, 2349  ,  1578, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1778, 1315  ,  1978, 1399  ,  1978, 1716  ,  1778, 1660  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1778, 1660  ,  1978, 1716  ,  1978, 2032  ,  1778, 2004  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1778, 2004  ,  1978, 2032  ,  1978, 2349  ,  1778, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1978, 1399  ,  2178, 1477  ,  2178, 1768  ,  1978, 1716  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1978, 1716  ,  2178, 1768  ,  2178, 2058  ,  1978, 2032  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1978, 2032  ,  2178, 2058  ,  2178, 2349  ,  1978, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2178, 1477  ,  2378, 1549  ,  2378, 1815  ,  2178, 1768  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2178, 1768  ,  2378, 1815  ,  2378, 2082  ,  2178, 2058  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2178, 2058  ,  2378, 2082  ,  2378, 2349  ,  2178, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2378, 1549  ,  2578, 1612  ,  2578, 1857  ,  2378, 1815  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2378, 1815  ,  2578, 1857  ,  2578, 2103  ,  2378, 2082  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2378, 2082  ,  2578, 2103  ,  2578, 2349  ,  2378, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2578, 1612  ,  2778, 1667  ,  2778, 2008  ,  2578, 1980  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2578, 1980  ,  2778, 2008  ,  2778, 2349  ,  2578, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2778, 1667  ,  2978, 1715  ,  2978, 1983  ,  2778, 2008  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2778, 2008  ,  2978, 1983  ,  2978, 2251  ,  2778, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2978, 1715  ,  3178, 1757  ,  3178, 1907  ,  2978, 1983  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2978, 1983  ,  3178, 1907  ,  3178, 2057  ,  2978, 2251  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3178, 1757  ,  3378, 1793  ,  3378, 1872  ,  3178, 2057  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3378, 1793  ,  3434, 1802  ,  3434, 1832  ,  3378, 1872  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -818, -1992  ,  -618, -1923  ,  -618, -1762  ,  -818, -1964  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -618, -1923  ,  -418, -1850  ,  -418, -1529  ,  -618, -1762  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -418, -1850  ,  -218, -1778  ,  -218, -1352  ,  -418, -1529  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -218, -1778  ,  -18, -1712  ,  -18, -1288  ,  -218, -1352  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -18, -1712  ,  182, -1658  ,  182, -1264  ,  -18, -1288  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  182, -1658  ,  382, -1620  ,  382, -1256  ,  182, -1264  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  382, -1620  ,  582, -1597  ,  582, -1262  ,  382, -1256  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  582, -1597  ,  782, -1584  ,  782, -1274  ,  582, -1262  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  782, -1584  ,  982, -1573  ,  982, -1283  ,  782, -1274  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  982, -1573  ,  1182, -1560  ,  1182, -1286  ,  982, -1283  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1182, -1560  ,  1382, -1541  ,  1382, -1279  ,  1182, -1286  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1382, -1541  ,  1582, -1516  ,  1582, -1260  ,  1382, -1279  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1582, -1516  ,  1782, -1481  ,  1782, -1256  ,  1582, -1260  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1782, -1481  ,  1982, -1439  ,  1982, -1279  ,  1782, -1256  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1982, -1439  ,  2182, -1391  ,  2182, -1306  ,  1982, -1279  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2182, -1391  ,  2358, -1345  ,  2358, -1317  ,  2182, -1306  }
                    }
                    }
		,
		["2"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1928  ,  -3640, -1874  ,  -3640, -1569  ,  -3840, -1600  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1600  ,  -3640, -1569  ,  -3640, -1264  ,  -3840, -1273  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1273  ,  -3640, -1264  ,  -3640, -958  ,  -3840, -945  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -945  ,  -3640, -958  ,  -3640, -653  ,  -3840, -618  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -618  ,  -3640, -653  ,  -3640, -348  ,  -3840, -290  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -290  ,  -3640, -348  ,  -3640, -43  ,  -3840, 37  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 37  ,  -3640, -43  ,  -3640, 262  ,  -3840, 365  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 365  ,  -3640, 262  ,  -3640, 567  ,  -3840, 692  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 692  ,  -3640, 567  ,  -3640, 873  ,  -3840, 1020  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1020  ,  -3640, 873  ,  -3640, 1178  ,  -3840, 1347  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1347  ,  -3640, 1178  ,  -3640, 1483  ,  -3840, 1675  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1675  ,  -3640, 1483  ,  -3640, 1788  ,  -3840, 2002  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 2002  ,  -3640, 1788  ,  -3640, 2093  ,  -3840, 2330  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1874  ,  -3440, -1828  ,  -3440, -1520  ,  -3640, -1543  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1543  ,  -3440, -1520  ,  -3440, -1213  ,  -3640, -1213  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1213  ,  -3440, -1213  ,  -3440, -905  ,  -3640, -882  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -882  ,  -3440, -905  ,  -3440, -597  ,  -3640, -552  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -552  ,  -3440, -597  ,  -3440, -290  ,  -3640, -221  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -221  ,  -3440, -290  ,  -3440, 18  ,  -3640, 110  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 110  ,  -3440, 18  ,  -3440, 325  ,  -3640, 440  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 440  ,  -3440, 325  ,  -3440, 633  ,  -3640, 771  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 771  ,  -3440, 633  ,  -3440, 941  ,  -3640, 1102  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1102  ,  -3440, 941  ,  -3440, 1248  ,  -3640, 1432  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1432  ,  -3440, 1248  ,  -3440, 1556  ,  -3640, 1763  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1763  ,  -3440, 1556  ,  -3440, 1864  ,  -3640, 2093  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1828  ,  -3240, -1767  ,  -3240, -1477  ,  -3440, -1520  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1520  ,  -3240, -1477  ,  -3240, -1188  ,  -3440, -1213  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1213  ,  -3240, -1188  ,  -3240, -899  ,  -3440, -905  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -905  ,  -3240, -899  ,  -3240, -609  ,  -3440, -597  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -597  ,  -3240, -609  ,  -3240, -320  ,  -3440, -290  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -290  ,  -3240, -320  ,  -3240, -31  ,  -3440, 18  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 18  ,  -3240, -31  ,  -3240, 259  ,  -3440, 325  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 325  ,  -3240, 259  ,  -3240, 548  ,  -3440, 633  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 633  ,  -3240, 548  ,  -3240, 837  ,  -3440, 941  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 941  ,  -3240, 837  ,  -3240, 1127  ,  -3440, 1248  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1248  ,  -3240, 1127  ,  -3240, 1416  ,  -3440, 1556  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1556  ,  -3240, 1416  ,  -3240, 1705  ,  -3440, 1864  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1767  ,  -3040, -1683  ,  -3040, -1385  ,  -3240, -1451  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1451  ,  -3040, -1385  ,  -3040, -1086  ,  -3240, -1135  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1135  ,  -3040, -1086  ,  -3040, -787  ,  -3240, -820  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -820  ,  -3040, -787  ,  -3040, -488  ,  -3240, -504  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -504  ,  -3040, -488  ,  -3040, -189  ,  -3240, -188  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -188  ,  -3040, -189  ,  -3040, 109  ,  -3240, 127  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 127  ,  -3040, 109  ,  -3040, 408  ,  -3240, 443  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 443  ,  -3040, 408  ,  -3040, 707  ,  -3240, 758  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 758  ,  -3040, 707  ,  -3040, 1006  ,  -3240, 1074  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1074  ,  -3040, 1006  ,  -3040, 1304  ,  -3240, 1390  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1390  ,  -3040, 1304  ,  -3040, 1603  ,  -3240, 1705  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1683  ,  -2840, -1600  ,  -2840, -1289  ,  -3040, -1355  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1355  ,  -2840, -1289  ,  -2840, -979  ,  -3040, -1026  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1026  ,  -2840, -979  ,  -2840, -668  ,  -3040, -697  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -697  ,  -2840, -668  ,  -2840, -358  ,  -3040, -369  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -369  ,  -2840, -358  ,  -2840, -47  ,  -3040, -40  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -40  ,  -2840, -47  ,  -2840, 263  ,  -3040, 289  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 289  ,  -2840, 263  ,  -2840, 574  ,  -3040, 617  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 617  ,  -2840, 574  ,  -2840, 884  ,  -3040, 946  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 946  ,  -2840, 884  ,  -2840, 1195  ,  -3040, 1275  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1275  ,  -2840, 1195  ,  -2840, 1505  ,  -3040, 1603  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1600  ,  -2640, -1533  ,  -2640, -1242  ,  -2840, -1289  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1289  ,  -2640, -1242  ,  -2640, -951  ,  -2840, -979  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -979  ,  -2640, -951  ,  -2640, -660  ,  -2840, -668  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -668  ,  -2640, -660  ,  -2640, -369  ,  -2840, -358  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -358  ,  -2640, -369  ,  -2640, -78  ,  -2840, -47  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -47  ,  -2640, -78  ,  -2640, 213  ,  -2840, 263  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 263  ,  -2640, 213  ,  -2640, 505  ,  -2840, 574  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 574  ,  -2640, 505  ,  -2640, 796  ,  -2840, 884  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 884  ,  -2640, 796  ,  -2640, 1087  ,  -2840, 1195  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1195  ,  -2640, 1087  ,  -2640, 1378  ,  -2840, 1505  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1533  ,  -2440, -1478  ,  -2440, -1255  ,  -2640, -1210  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1210  ,  -2440, -1255  ,  -2440, -1032  ,  -2640, -886  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -886  ,  -2440, -1032  ,  -2440, -809  ,  -2640, -563  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -563  ,  -2440, -809  ,  -2440, -587  ,  -2640, -239  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -239  ,  -2440, -587  ,  -2440, -364  ,  -2640, 84  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 84  ,  -2440, -364  ,  -2440, -141  ,  -2640, 407  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 407  ,  -2440, -141  ,  -2440, 82  ,  -2640, 731  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 731  ,  -2440, 82  ,  -2440, 305  ,  -2640, 1054  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1054  ,  -2440, 305  ,  -2440, 528  ,  -2640, 1378  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1478  ,  -2296, -1436  ,  -2296, -1431  ,  -2440, -1144  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1144  ,  -2296, -1431  ,  -2296, -1425  ,  -2440, -809  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -809  ,  -2296, -1425  ,  -2296, -1420  ,  -2440, -475  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -475  ,  -2296, -1420  ,  -2296, -1414  ,  -2440, -141  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -141  ,  -2296, -1414  ,  -2296, -1409  ,  -2440, 194  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 194  ,  -2296, -1409  ,  -2296, -1404  ,  -2440, 528  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1904, -799  ,  -1704, -653  ,  -1704, -341  ,  -1904, -795  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1904, -795  ,  -1704, -341  ,  -1704, -30  ,  -1904, -791  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1904, -791  ,  -1704, -30  ,  -1704, 282  ,  -1904, -786  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1904, -786  ,  -1704, 282  ,  -1704, 594  ,  -1904, -782  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1904, -782  ,  -1704, 594  ,  -1704, 905  ,  -1904, -778  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1904, -778  ,  -1704, 905  ,  -1704, 1217  ,  -1904, -773  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1904, -773  ,  -1704, 1217  ,  -1704, 1529  ,  -1904, -769  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1704, -653  ,  -1504, -510  ,  -1504, -198  ,  -1704, -341  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1704, -341  ,  -1504, -198  ,  -1504, 114  ,  -1704, -30  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1704, -30  ,  -1504, 114  ,  -1504, 427  ,  -1704, 282  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1704, 282  ,  -1504, 427  ,  -1504, 739  ,  -1704, 594  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1704, 594  ,  -1504, 739  ,  -1504, 1051  ,  -1704, 905  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1704, 905  ,  -1504, 1051  ,  -1504, 1363  ,  -1704, 1217  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1704, 1217  ,  -1504, 1363  ,  -1504, 1675  ,  -1704, 1529  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1504, -510  ,  -1304, -374  ,  -1304, -54  ,  -1504, -198  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1504, -198  ,  -1304, -54  ,  -1304, 265  ,  -1504, 114  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1504, 114  ,  -1304, 265  ,  -1304, 584  ,  -1504, 427  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1504, 427  ,  -1304, 584  ,  -1304, 903  ,  -1504, 739  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1504, 739  ,  -1304, 903  ,  -1304, 1223  ,  -1504, 1051  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1504, 1051  ,  -1304, 1223  ,  -1304, 1542  ,  -1504, 1363  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1504, 1363  ,  -1304, 1542  ,  -1304, 1861  ,  -1504, 1675  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1304, -374  ,  -1104, -254  ,  -1104, 76  ,  -1304, -54  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1304, -54  ,  -1104, 76  ,  -1104, 406  ,  -1304, 265  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1304, 265  ,  -1104, 406  ,  -1104, 736  ,  -1304, 584  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1304, 584  ,  -1104, 736  ,  -1104, 1065  ,  -1304, 903  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1304, 903  ,  -1104, 1065  ,  -1104, 1395  ,  -1304, 1223  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1304, 1223  ,  -1104, 1395  ,  -1104, 1725  ,  -1304, 1542  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1304, 1542  ,  -1104, 1725  ,  -1104, 2054  ,  -1304, 1861  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1104, -254  ,  -904, -160  ,  -904, 174  ,  -1104, 76  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1104, 76  ,  -904, 174  ,  -904, 508  ,  -1104, 406  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1104, 406  ,  -904, 508  ,  -904, 842  ,  -1104, 736  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1104, 736  ,  -904, 842  ,  -904, 1176  ,  -1104, 1065  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1104, 1065  ,  -904, 1176  ,  -904, 1510  ,  -1104, 1395  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1104, 1395  ,  -904, 1510  ,  -904, 1844  ,  -1104, 1725  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1104, 1725  ,  -904, 1844  ,  -904, 2178  ,  -1104, 2054  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -904, -160  ,  -704, -92  ,  -704, 247  ,  -904, 174  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -904, 174  ,  -704, 247  ,  -704, 585  ,  -904, 508  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -904, 508  ,  -704, 585  ,  -704, 923  ,  -904, 842  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -904, 842  ,  -704, 923  ,  -704, 1262  ,  -904, 1176  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -904, 1176  ,  -704, 1262  ,  -704, 1600  ,  -904, 1510  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -904, 1510  ,  -704, 1600  ,  -704, 1938  ,  -904, 1844  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -904, 1844  ,  -704, 1938  ,  -704, 2277  ,  -904, 2178  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -704, -92  ,  -504, -39  ,  -504, 302  ,  -704, 247  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -704, 247  ,  -504, 302  ,  -504, 644  ,  -704, 585  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -704, 585  ,  -504, 644  ,  -504, 985  ,  -704, 923  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -704, 923  ,  -504, 985  ,  -504, 1326  ,  -704, 1262  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -704, 1262  ,  -504, 1326  ,  -504, 1667  ,  -704, 1600  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -704, 1600  ,  -504, 1667  ,  -504, 2008  ,  -704, 1938  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -704, 1938  ,  -504, 2008  ,  -504, 2349  ,  -704, 2277  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -504, -39  ,  -304, 6  ,  -304, 341  ,  -504, 302  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -504, 302  ,  -304, 341  ,  -304, 676  ,  -504, 644  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -504, 644  ,  -304, 676  ,  -304, 1010  ,  -504, 985  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -504, 985  ,  -304, 1010  ,  -304, 1345  ,  -504, 1326  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -504, 1326  ,  -304, 1345  ,  -304, 1680  ,  -504, 1667  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -504, 1667  ,  -304, 1680  ,  -304, 2014  ,  -504, 2008  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -504, 2008  ,  -304, 2014  ,  -304, 2349  ,  -504, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -304, 6  ,  -104, 46  ,  -104, 375  ,  -304, 341  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -304, 341  ,  -104, 375  ,  -104, 704  ,  -304, 676  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -304, 676  ,  -104, 704  ,  -104, 1033  ,  -304, 1010  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -304, 1010  ,  -104, 1033  ,  -104, 1362  ,  -304, 1345  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -304, 1345  ,  -104, 1362  ,  -104, 1691  ,  -304, 1680  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -304, 1680  ,  -104, 1691  ,  -104, 2020  ,  -304, 2014  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -304, 2014  ,  -104, 2020  ,  -104, 2349  ,  -304, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -104, 46  ,  96, 83  ,  96, 376  ,  -104, 375  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -104, 375  ,  96, 376  ,  96, 669  ,  -104, 704  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -104, 704  ,  96, 669  ,  96, 962  ,  -104, 1033  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -104, 1033  ,  96, 962  ,  96, 1255  ,  -104, 1362  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -104, 1362  ,  96, 1255  ,  96, 1548  ,  -104, 1691  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -104, 1691  ,  96, 1548  ,  96, 1841  ,  -104, 2020  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -104, 2020  ,  96, 1841  ,  96, 2134  ,  -104, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  96, 83  ,  226, 106  ,  226, 112  ,  96, 425  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  96, 425  ,  226, 112  ,  226, 117  ,  96, 767  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  96, 767  ,  226, 117  ,  226, 123  ,  96, 1108  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  96, 1108  ,  226, 123  ,  226, 129  ,  96, 1450  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  96, 1450  ,  226, 129  ,  226, 134  ,  96, 1792  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  96, 1792  ,  226, 134  ,  226, 140  ,  96, 2134  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  624, 731  ,  824, 752  ,  824, 1084  ,  624, 741  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  624, 741  ,  824, 1084  ,  824, 1416  ,  624, 751  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  624, 751  ,  824, 1416  ,  824, 1748  ,  624, 761  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  824, 752  ,  1024, 774  ,  1024, 1114  ,  824, 1084  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  824, 1084  ,  1024, 1114  ,  1024, 1454  ,  824, 1416  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  824, 1416  ,  1024, 1454  ,  1024, 1794  ,  824, 1748  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1024, 774  ,  1224, 799  ,  1224, 1148  ,  1024, 1114  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1024, 1114  ,  1224, 1148  ,  1224, 1497  ,  1024, 1454  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1024, 1454  ,  1224, 1497  ,  1224, 1846  ,  1024, 1794  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1224, 799  ,  1262, 805  ,  1262, 1155  ,  1224, 1148  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1224, 1148  ,  1262, 1155  ,  1262, 1505  ,  1224, 1497  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1224, 1497  ,  1262, 1505  ,  1262, 1855  ,  1224, 1846  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1262, 805  ,  1424, 834  ,  1424, 1184  ,  1262, 1155  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1262, 1155  ,  1424, 1184  ,  1424, 1534  ,  1262, 1505  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1262, 1505  ,  1424, 1534  ,  1424, 1885  ,  1262, 1855  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1424, 834  ,  1624, 887  ,  1624, 1222  ,  1424, 1184  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1424, 1184  ,  1624, 1222  ,  1624, 1556  ,  1424, 1534  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1424, 1534  ,  1624, 1556  ,  1624, 1891  ,  1424, 1885  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1624, 887  ,  1824, 957  ,  1824, 1263  ,  1624, 1222  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1624, 1222  ,  1824, 1263  ,  1824, 1568  ,  1624, 1556  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1624, 1556  ,  1824, 1568  ,  1824, 1873  ,  1624, 1891  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1824, 957  ,  2024, 1038  ,  2024, 1311  ,  1824, 1263  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1824, 1263  ,  2024, 1311  ,  2024, 1585  ,  1824, 1568  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1824, 1568  ,  2024, 1585  ,  2024, 1859  ,  1824, 1873  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2024, 1038  ,  2224, 1122  ,  2224, 1373  ,  2024, 1311  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2024, 1311  ,  2224, 1373  ,  2224, 1624  ,  2024, 1585  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2024, 1585  ,  2224, 1624  ,  2224, 1875  ,  2024, 1859  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2224, 1122  ,  2424, 1208  ,  2424, 1570  ,  2224, 1499  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2224, 1499  ,  2424, 1570  ,  2424, 1932  ,  2224, 1875  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2424, 1208  ,  2624, 1293  ,  2624, 1658  ,  2424, 1570  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2424, 1570  ,  2624, 1658  ,  2624, 2023  ,  2424, 1932  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2624, 1293  ,  2824, 1375  ,  2824, 1754  ,  2624, 1658  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2624, 1658  ,  2824, 1754  ,  2824, 2132  ,  2624, 2023  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2824, 1375  ,  3024, 1453  ,  3024, 1828  ,  2824, 1754  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2824, 1754  ,  3024, 1828  ,  3024, 2202  ,  2824, 2132  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3024, 1453  ,  3224, 1527  ,  3224, 1868  ,  3024, 1828  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3024, 1828  ,  3224, 1868  ,  3224, 2210  ,  3024, 2202  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3224, 1527  ,  3398, 1586  ,  3398, 1878  ,  3224, 1868  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3224, 1868  ,  3398, 1878  ,  3398, 2170  ,  3224, 2210  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3398, 1586  ,  3424, 1595  ,  3424, 1878  ,  3398, 1878  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3398, 1878  ,  3424, 1878  ,  3424, 2162  ,  3398, 2170  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3424, 1595  ,  3624, 1659  ,  3624, 1867  ,  3424, 1878  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3424, 1878  ,  3624, 1867  ,  3624, 2074  ,  3424, 2162  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3624, 1659  ,  3824, 1722  ,  3824, 1974  ,  3624, 2074  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3824, 1722  ,  3838, 1726  ,  3838, 1968  ,  3824, 1974  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1118, -2052  ,  -918, -2012  ,  -918, -1852  ,  -1118, -2024  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -918, -2012  ,  -718, -1965  ,  -718, -1644  ,  -918, -1852  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -718, -1965  ,  -518, -1917  ,  -518, -1487  ,  -718, -1644  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -518, -1917  ,  -318, -1873  ,  -318, -1437  ,  -518, -1487  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -318, -1873  ,  -118, -1835  ,  -118, -1413  ,  -318, -1437  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -118, -1835  ,  82, -1804  ,  82, -1397  ,  -118, -1413  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  82, -1804  ,  282, -1772  ,  282, -1385  ,  82, -1397  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  282, -1772  ,  482, -1729  ,  482, -1365  ,  282, -1385  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  482, -1729  ,  682, -1669  ,  682, -1330  ,  482, -1365  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  682, -1669  ,  882, -1595  ,  882, -1282  ,  682, -1330  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  882, -1595  ,  1082, -1520  ,  1082, -1233  ,  882, -1282  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1082, -1520  ,  1282, -1458  ,  1282, -1201  ,  1082, -1233  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1282, -1458  ,  1482, -1416  ,  1482, -1227  ,  1282, -1201  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1482, -1416  ,  1682, -1392  ,  1682, -1285  ,  1482, -1227  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1682, -1392  ,  1882, -1378  ,  1882, -1338  ,  1682, -1285  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1882, -1378  ,  1928, -1375  ,  1928, -1347  ,  1882, -1338  }
                    }
                    }
		,
		["3"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1897  ,  -3640, -1763  ,  -3640, -1446  ,  -3840, -1570  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1570  ,  -3640, -1446  ,  -3640, -1130  ,  -3840, -1244  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1244  ,  -3640, -1130  ,  -3640, -814  ,  -3840, -917  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -917  ,  -3640, -814  ,  -3640, -497  ,  -3840, -590  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -590  ,  -3640, -497  ,  -3640, -181  ,  -3840, -264  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -264  ,  -3640, -181  ,  -3640, 135  ,  -3840, 63  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 63  ,  -3640, 135  ,  -3640, 451  ,  -3840, 389  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 389  ,  -3640, 451  ,  -3640, 768  ,  -3840, 716  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 716  ,  -3640, 768  ,  -3640, 1084  ,  -3840, 1043  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1043  ,  -3640, 1084  ,  -3640, 1400  ,  -3840, 1369  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1369  ,  -3640, 1400  ,  -3640, 1716  ,  -3840, 1696  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 1696  ,  -3640, 1716  ,  -3640, 2033  ,  -3840, 2022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 2022  ,  -3640, 2033  ,  -3640, 2349  ,  -3840, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1763  ,  -3440, -1638  ,  -3440, -1336  ,  -3640, -1446  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1446  ,  -3440, -1336  ,  -3440, -1035  ,  -3640, -1130  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1130  ,  -3440, -1035  ,  -3440, -733  ,  -3640, -814  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -814  ,  -3440, -733  ,  -3440, -431  ,  -3640, -497  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -497  ,  -3440, -431  ,  -3440, -130  ,  -3640, -181  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -181  ,  -3440, -130  ,  -3440, 172  ,  -3640, 135  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 135  ,  -3440, 172  ,  -3440, 473  ,  -3640, 451  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 451  ,  -3440, 473  ,  -3440, 775  ,  -3640, 768  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 768  ,  -3440, 775  ,  -3440, 1077  ,  -3640, 1084  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1084  ,  -3440, 1077  ,  -3440, 1378  ,  -3640, 1400  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1400  ,  -3440, 1378  ,  -3440, 1680  ,  -3640, 1716  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1716  ,  -3440, 1680  ,  -3440, 1981  ,  -3640, 2033  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 2033  ,  -3440, 1981  ,  -3440, 2283  ,  -3640, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1638  ,  -3240, -1535  ,  -3240, -1222  ,  -3440, -1311  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1311  ,  -3240, -1222  ,  -3240, -909  ,  -3440, -984  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -984  ,  -3240, -909  ,  -3240, -597  ,  -3440, -658  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -658  ,  -3240, -597  ,  -3240, -284  ,  -3440, -331  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -331  ,  -3240, -284  ,  -3240, 29  ,  -3440, -4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -4  ,  -3240, 29  ,  -3240, 341  ,  -3440, 323  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 323  ,  -3240, 341  ,  -3240, 654  ,  -3440, 649  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 649  ,  -3240, 654  ,  -3240, 967  ,  -3440, 976  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 976  ,  -3240, 967  ,  -3240, 1280  ,  -3440, 1303  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1303  ,  -3240, 1280  ,  -3240, 1592  ,  -3440, 1629  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1629  ,  -3240, 1592  ,  -3240, 1905  ,  -3440, 1956  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1956  ,  -3240, 1905  ,  -3240, 2218  ,  -3440, 2283  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1535  ,  -3040, -1460  ,  -3040, -1156  ,  -3240, -1222  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1222  ,  -3040, -1156  ,  -3040, -853  ,  -3240, -909  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -909  ,  -3040, -853  ,  -3040, -550  ,  -3240, -597  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -597  ,  -3040, -550  ,  -3040, -246  ,  -3240, -284  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -284  ,  -3040, -246  ,  -3040, 57  ,  -3240, 29  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 29  ,  -3040, 57  ,  -3040, 360  ,  -3240, 341  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 341  ,  -3040, 360  ,  -3040, 664  ,  -3240, 654  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 654  ,  -3040, 664  ,  -3040, 967  ,  -3240, 967  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 967  ,  -3040, 967  ,  -3040, 1270  ,  -3240, 1280  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1280  ,  -3040, 1270  ,  -3040, 1574  ,  -3240, 1592  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1592  ,  -3040, 1574  ,  -3040, 1877  ,  -3240, 1905  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1905  ,  -3040, 1877  ,  -3040, 2180  ,  -3240, 2218  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1460  ,  -2840, -1403  ,  -2840, -1081  ,  -3040, -1129  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1129  ,  -2840, -1081  ,  -2840, -760  ,  -3040, -798  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -798  ,  -2840, -760  ,  -2840, -438  ,  -3040, -467  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -467  ,  -2840, -438  ,  -2840, -116  ,  -3040, -136  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -136  ,  -2840, -116  ,  -2840, 206  ,  -3040, 195  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 195  ,  -2840, 206  ,  -2840, 527  ,  -3040, 526  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 526  ,  -2840, 527  ,  -2840, 849  ,  -3040, 857  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 857  ,  -2840, 849  ,  -2840, 1171  ,  -3040, 1188  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1188  ,  -2840, 1171  ,  -2840, 1493  ,  -3040, 1519  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1519  ,  -2840, 1493  ,  -2840, 1814  ,  -3040, 1849  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1849  ,  -2840, 1814  ,  -2840, 2136  ,  -3040, 2180  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1403  ,  -2640, -1355  ,  -2640, -1046  ,  -2840, -1081  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1081  ,  -2640, -1046  ,  -2640, -738  ,  -2840, -760  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -760  ,  -2640, -738  ,  -2640, -430  ,  -2840, -438  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -438  ,  -2640, -430  ,  -2640, -121  ,  -2840, -116  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -116  ,  -2640, -121  ,  -2640, 187  ,  -2840, 206  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 206  ,  -2640, 187  ,  -2640, 495  ,  -2840, 527  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 527  ,  -2640, 495  ,  -2640, 803  ,  -2840, 849  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 849  ,  -2640, 803  ,  -2640, 1112  ,  -2840, 1171  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1171  ,  -2640, 1112  ,  -2640, 1420  ,  -2840, 1493  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1493  ,  -2640, 1420  ,  -2640, 1728  ,  -2840, 1814  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1814  ,  -2640, 1728  ,  -2640, 2037  ,  -2840, 2136  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1355  ,  -2440, -1309  ,  -2440, -1021  ,  -2640, -1046  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1046  ,  -2440, -1021  ,  -2440, -734  ,  -2640, -738  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -738  ,  -2440, -734  ,  -2440, -447  ,  -2640, -430  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -430  ,  -2440, -447  ,  -2440, -160  ,  -2640, -121  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -121  ,  -2440, -160  ,  -2440, 127  ,  -2640, 187  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 187  ,  -2440, 127  ,  -2440, 415  ,  -2640, 495  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 495  ,  -2440, 415  ,  -2440, 702  ,  -2640, 803  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 803  ,  -2440, 702  ,  -2440, 989  ,  -2640, 1112  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1112  ,  -2440, 989  ,  -2440, 1276  ,  -2640, 1420  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1420  ,  -2440, 1276  ,  -2440, 1564  ,  -2640, 1728  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1728  ,  -2440, 1564  ,  -2440, 1851  ,  -2640, 2037  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1309  ,  -2240, -1265  ,  -2240, -979  ,  -2440, -993  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -993  ,  -2240, -979  ,  -2240, -693  ,  -2440, -677  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -677  ,  -2240, -693  ,  -2240, -408  ,  -2440, -361  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -361  ,  -2240, -408  ,  -2240, -122  ,  -2440, -45  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -45  ,  -2240, -122  ,  -2240, 164  ,  -2440, 271  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 271  ,  -2240, 164  ,  -2240, 450  ,  -2440, 587  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 587  ,  -2240, 450  ,  -2240, 736  ,  -2440, 903  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 903  ,  -2240, 736  ,  -2240, 1022  ,  -2440, 1219  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1219  ,  -2240, 1022  ,  -2240, 1308  ,  -2440, 1535  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1535  ,  -2240, 1308  ,  -2240, 1594  ,  -2440, 1851  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1265  ,  -2040, -1228  ,  -2040, -945  ,  -2240, -948  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -948  ,  -2040, -945  ,  -2040, -661  ,  -2240, -630  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -630  ,  -2040, -661  ,  -2040, -378  ,  -2240, -312  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -312  ,  -2040, -378  ,  -2040, -94  ,  -2240, 6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 6  ,  -2040, -94  ,  -2040, 189  ,  -2240, 323  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 323  ,  -2040, 189  ,  -2040, 473  ,  -2240, 641  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 641  ,  -2040, 473  ,  -2040, 756  ,  -2240, 959  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 959  ,  -2040, 756  ,  -2040, 1040  ,  -2240, 1276  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1276  ,  -2040, 1040  ,  -2040, 1323  ,  -2240, 1594  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -1228  ,  -1840, -1197  ,  -1840, -1176  ,  -2040, -909  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -909  ,  -1840, -1176  ,  -1840, -1154  ,  -2040, -590  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -590  ,  -1840, -1154  ,  -1840, -1133  ,  -2040, -271  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -271  ,  -1840, -1133  ,  -1840, -1112  ,  -2040, 48  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 48  ,  -1840, -1112  ,  -1840, -1090  ,  -2040, 366  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 366  ,  -1840, -1090  ,  -1840, -1069  ,  -2040, 685  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 685  ,  -1840, -1069  ,  -1840, -1048  ,  -2040, 1004  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1004  ,  -1840, -1048  ,  -1840, -1026  ,  -2040, 1323  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1840, -1197  ,  -1816, -1194  ,  -1816, -1165  ,  -1840, -1026  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -569  ,  -1226, -540  ,  -1226, -219  ,  -1426, -565  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -565  ,  -1226, -219  ,  -1226, 102  ,  -1426, -561  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -561  ,  -1226, 102  ,  -1226, 423  ,  -1426, -557  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -557  ,  -1226, 423  ,  -1226, 744  ,  -1426, -553  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -553  ,  -1226, 744  ,  -1226, 1065  ,  -1426, -550  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -550  ,  -1226, 1065  ,  -1226, 1386  ,  -1426, -546  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -546  ,  -1226, 1386  ,  -1226, 1707  ,  -1426, -542  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -542  ,  -1226, 1707  ,  -1226, 2028  ,  -1426, -538  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -538  ,  -1226, 2028  ,  -1226, 2349  ,  -1426, -534  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, -540  ,  -1026, -510  ,  -1026, -192  ,  -1226, -219  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, -219  ,  -1026, -192  ,  -1026, 126  ,  -1226, 102  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 102  ,  -1026, 126  ,  -1026, 443  ,  -1226, 423  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 423  ,  -1026, 443  ,  -1026, 761  ,  -1226, 744  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 744  ,  -1026, 761  ,  -1026, 1079  ,  -1226, 1065  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 1065  ,  -1026, 1079  ,  -1026, 1396  ,  -1226, 1386  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 1386  ,  -1026, 1396  ,  -1026, 1714  ,  -1226, 1707  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 1707  ,  -1026, 1714  ,  -1026, 2031  ,  -1226, 2028  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 2028  ,  -1026, 2031  ,  -1026, 2349  ,  -1226, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, -510  ,  -928, -493  ,  -928, -185  ,  -1026, -192  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, -192  ,  -928, -185  ,  -928, 123  ,  -1026, 126  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 126  ,  -928, 123  ,  -928, 431  ,  -1026, 443  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 443  ,  -928, 431  ,  -928, 739  ,  -1026, 761  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 761  ,  -928, 739  ,  -928, 1047  ,  -1026, 1079  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 1079  ,  -928, 1047  ,  -928, 1356  ,  -1026, 1396  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 1396  ,  -928, 1356  ,  -928, 1664  ,  -1026, 1714  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 1714  ,  -928, 1664  ,  -928, 1972  ,  -1026, 2031  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 2031  ,  -928, 1972  ,  -928, 2280  ,  -1026, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -928, -493  ,  -826, -474  ,  -826, -188  ,  -928, -185  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -928, -185  ,  -826, -188  ,  -826, 97  ,  -928, 123  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -928, 123  ,  -826, 97  ,  -826, 383  ,  -928, 431  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -928, 431  ,  -826, 383  ,  -826, 669  ,  -928, 739  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -928, 739  ,  -826, 669  ,  -826, 955  ,  -928, 1047  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -928, 1047  ,  -826, 955  ,  -826, 1241  ,  -928, 1356  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -928, 1356  ,  -826, 1241  ,  -826, 1527  ,  -928, 1664  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -928, 1664  ,  -826, 1527  ,  -826, 1813  ,  -928, 1972  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -928, 1972  ,  -826, 1813  ,  -826, 2099  ,  -928, 2280  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, -474  ,  -626, -423  ,  -626, -150  ,  -826, -153  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, -153  ,  -626, -150  ,  -626, 123  ,  -826, 169  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 169  ,  -626, 123  ,  -626, 396  ,  -826, 491  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 491  ,  -626, 396  ,  -626, 669  ,  -826, 812  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 812  ,  -626, 669  ,  -626, 942  ,  -826, 1134  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 1134  ,  -626, 942  ,  -626, 1216  ,  -826, 1456  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 1456  ,  -626, 1216  ,  -626, 1489  ,  -826, 1777  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 1777  ,  -626, 1489  ,  -626, 1762  ,  -826, 2099  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, -423  ,  -426, -342  ,  -426, -79  ,  -626, -111  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, -111  ,  -426, -79  ,  -426, 184  ,  -626, 201  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 201  ,  -426, 184  ,  -426, 448  ,  -626, 513  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 513  ,  -426, 448  ,  -426, 711  ,  -626, 825  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 825  ,  -426, 711  ,  -426, 975  ,  -626, 1138  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 1138  ,  -426, 975  ,  -426, 1238  ,  -626, 1450  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 1450  ,  -426, 1238  ,  -426, 1501  ,  -626, 1762  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, -342  ,  -226, -234  ,  -226, 32  ,  -426, -35  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, -35  ,  -226, 32  ,  -226, 298  ,  -426, 272  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 272  ,  -226, 298  ,  -226, 564  ,  -426, 580  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 580  ,  -226, 564  ,  -226, 830  ,  -426, 887  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 887  ,  -226, 830  ,  -226, 1096  ,  -426, 1194  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 1194  ,  -226, 1096  ,  -226, 1362  ,  -426, 1501  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, -234  ,  -26, -114  ,  -26, 180  ,  -226, 85  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 85  ,  -26, 180  ,  -26, 475  ,  -226, 404  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 404  ,  -26, 475  ,  -26, 769  ,  -226, 723  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 723  ,  -26, 769  ,  -26, 1063  ,  -226, 1042  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 1042  ,  -26, 1063  ,  -26, 1357  ,  -226, 1362  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, -114  ,  130, -16  ,  130, 274  ,  -26, 180  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 180  ,  130, 274  ,  130, 565  ,  -26, 475  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 475  ,  130, 565  ,  130, 855  ,  -26, 769  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 769  ,  130, 855  ,  130, 1146  ,  -26, 1063  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 1063  ,  130, 1146  ,  130, 1436  ,  -26, 1357  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  130, -16  ,  174, 11  ,  174, 303  ,  130, 274  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  130, 274  ,  174, 303  ,  174, 594  ,  130, 565  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  130, 565  ,  174, 594  ,  174, 886  ,  130, 855  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  130, 855  ,  174, 886  ,  174, 1177  ,  130, 1146  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  130, 1146  ,  174, 1177  ,  174, 1468  ,  130, 1436  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 11  ,  374, 138  ,  374, 439  ,  174, 303  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 303  ,  374, 439  ,  374, 740  ,  174, 594  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 594  ,  374, 740  ,  374, 1041  ,  174, 886  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 886  ,  374, 1041  ,  374, 1342  ,  174, 1177  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 1177  ,  374, 1342  ,  374, 1643  ,  174, 1468  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 138  ,  574, 267  ,  574, 341  ,  374, 439  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 439  ,  574, 341  ,  574, 416  ,  374, 740  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 740  ,  574, 416  ,  574, 491  ,  374, 1041  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 1041  ,  574, 491  ,  574, 566  ,  374, 1342  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 1342  ,  574, 566  ,  574, 641  ,  374, 1643  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  574, 267  ,  622, 298  ,  622, 331  ,  574, 641  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1036, 933  ,  1236, 959  ,  1236, 1384  ,  1036, 962  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1236, 959  ,  1436, 986  ,  1436, 1437  ,  1236, 1384  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1436, 986  ,  1636, 1015  ,  1636, 1288  ,  1436, 1211  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1436, 1211  ,  1636, 1288  ,  1636, 1561  ,  1436, 1437  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1636, 1015  ,  1836, 1049  ,  1836, 1395  ,  1636, 1288  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1636, 1288  ,  1836, 1395  ,  1836, 1741  ,  1636, 1561  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1836, 1049  ,  2036, 1090  ,  2036, 1377  ,  1836, 1280  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1836, 1280  ,  2036, 1377  ,  2036, 1665  ,  1836, 1511  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1836, 1511  ,  2036, 1665  ,  2036, 1952  ,  1836, 1741  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2036, 1090  ,  2236, 1138  ,  2236, 1478  ,  2036, 1377  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2036, 1377  ,  2236, 1478  ,  2236, 1817  ,  2036, 1665  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2036, 1665  ,  2236, 1817  ,  2236, 2157  ,  2036, 1952  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2236, 1138  ,  2436, 1191  ,  2436, 1475  ,  2236, 1393  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2236, 1393  ,  2436, 1475  ,  2436, 1758  ,  2236, 1648  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2236, 1648  ,  2436, 1758  ,  2436, 2042  ,  2236, 1902  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2236, 1902  ,  2436, 2042  ,  2436, 2325  ,  2236, 2157  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2436, 1191  ,  2636, 1248  ,  2636, 1524  ,  2436, 1475  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2436, 1475  ,  2636, 1524  ,  2636, 1799  ,  2436, 1758  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2436, 1758  ,  2636, 1799  ,  2636, 2074  ,  2436, 2042  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2436, 2042  ,  2636, 2074  ,  2636, 2349  ,  2436, 2325  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2636, 1248  ,  2836, 1308  ,  2836, 1655  ,  2636, 1615  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2636, 1615  ,  2836, 1655  ,  2836, 2002  ,  2636, 1982  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2636, 1982  ,  2836, 2002  ,  2836, 2349  ,  2636, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2836, 1308  ,  3036, 1372  ,  3036, 1697  ,  2836, 1655  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2836, 1655  ,  3036, 1697  ,  3036, 2023  ,  2836, 2002  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2836, 2002  ,  3036, 2023  ,  3036, 2349  ,  2836, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3036, 1372  ,  3236, 1440  ,  3236, 1734  ,  3036, 1697  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3036, 1697  ,  3236, 1734  ,  3236, 2028  ,  3036, 2023  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3036, 2023  ,  3236, 2028  ,  3236, 2321  ,  3036, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3236, 1440  ,  3436, 1516  ,  3436, 1713  ,  3236, 1734  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3236, 1734  ,  3436, 1713  ,  3436, 1910  ,  3236, 2028  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3236, 2028  ,  3436, 1910  ,  3436, 2107  ,  3236, 2321  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3436, 1516  ,  3636, 1600  ,  3636, 1760  ,  3436, 1811  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3436, 1811  ,  3636, 1760  ,  3636, 1920  ,  3436, 2107  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3636, 1600  ,  3836, 1692  ,  3836, 1821  ,  3636, 1920  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -590, -1979  ,  -390, -1931  ,  -390, -1807  ,  -590, -1950  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -390, -1931  ,  -190, -1885  ,  -190, -1652  ,  -390, -1807  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -190, -1885  ,  10, -1848  ,  10, -1549  ,  -190, -1652  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  10, -1848  ,  210, -1824  ,  210, -1530  ,  10, -1549  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  210, -1824  ,  410, -1809  ,  410, -1532  ,  210, -1530  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  410, -1809  ,  610, -1800  ,  610, -1534  ,  410, -1532  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  610, -1800  ,  810, -1793  ,  810, -1530  ,  610, -1534  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  810, -1793  ,  1010, -1789  ,  1010, -1519  ,  810, -1530  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1010, -1789  ,  1210, -1783  ,  1210, -1499  ,  1010, -1519  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1210, -1783  ,  1410, -1765  ,  1410, -1460  ,  1210, -1499  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1410, -1765  ,  1610, -1721  ,  1610, -1391  ,  1410, -1460  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1610, -1721  ,  1810, -1651  ,  1810, -1291  ,  1610, -1391  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1810, -1651  ,  2010, -1560  ,  2010, -1224  ,  1810, -1291  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2010, -1560  ,  2210, -1464  ,  2210, -1216  ,  2010, -1224  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2210, -1464  ,  2410, -1375  ,  2410, -1247  ,  2210, -1216  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2410, -1375  ,  2610, -1306  ,  2610, -1278  ,  2410, -1247  }
                    }
                    }
		,
		["4"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -2174  ,  -3640, -2133  ,  -3640, -1815  ,  -3840, -1866  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1866  ,  -3640, -1815  ,  -3640, -1497  ,  -3840, -1559  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1559  ,  -3640, -1497  ,  -3640, -1178  ,  -3840, -1251  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1251  ,  -3640, -1178  ,  -3640, -860  ,  -3840, -943  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -943  ,  -3640, -860  ,  -3640, -541  ,  -3840, -636  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -636  ,  -3640, -541  ,  -3640, -223  ,  -3840, -328  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -328  ,  -3640, -223  ,  -3640, 96  ,  -3840, -21  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -21  ,  -3640, 96  ,  -3640, 414  ,  -3840, 287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 287  ,  -3640, 414  ,  -3640, 732  ,  -3840, 595  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 595  ,  -3640, 732  ,  -3640, 1051  ,  -3840, 902  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, 902  ,  -3640, 1051  ,  -3640, 1369  ,  -3840, 1210  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -2133  ,  -3440, -2082  ,  -3440, -1751  ,  -3640, -1815  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1815  ,  -3440, -1751  ,  -3440, -1420  ,  -3640, -1497  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1497  ,  -3440, -1420  ,  -3440, -1090  ,  -3640, -1178  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -1178  ,  -3440, -1090  ,  -3440, -759  ,  -3640, -860  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -860  ,  -3440, -759  ,  -3440, -428  ,  -3640, -541  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -541  ,  -3440, -428  ,  -3440, -97  ,  -3640, -223  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, -223  ,  -3440, -97  ,  -3440, 234  ,  -3640, 96  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 96  ,  -3440, 234  ,  -3440, 565  ,  -3640, 414  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 414  ,  -3440, 565  ,  -3440, 896  ,  -3640, 732  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 732  ,  -3440, 896  ,  -3440, 1226  ,  -3640, 1051  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3640, 1051  ,  -3440, 1226  ,  -3440, 1557  ,  -3640, 1369  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -2082  ,  -3240, -2017  ,  -3240, -1700  ,  -3440, -1779  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1779  ,  -3240, -1700  ,  -3240, -1384  ,  -3440, -1475  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1475  ,  -3240, -1384  ,  -3240, -1068  ,  -3440, -1172  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -1172  ,  -3240, -1068  ,  -3240, -751  ,  -3440, -869  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -869  ,  -3240, -751  ,  -3240, -435  ,  -3440, -566  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -566  ,  -3240, -435  ,  -3240, -119  ,  -3440, -262  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, -262  ,  -3240, -119  ,  -3240, 197  ,  -3440, 41  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 41  ,  -3240, 197  ,  -3240, 514  ,  -3440, 344  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 344  ,  -3240, 514  ,  -3240, 830  ,  -3440, 647  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 647  ,  -3240, 830  ,  -3240, 1146  ,  -3440, 951  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 951  ,  -3240, 1146  ,  -3240, 1462  ,  -3440, 1254  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3440, 1254  ,  -3240, 1462  ,  -3240, 1779  ,  -3440, 1557  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -2017  ,  -3040, -1935  ,  -3040, -1606  ,  -3240, -1700  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1700  ,  -3040, -1606  ,  -3040, -1278  ,  -3240, -1384  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1384  ,  -3040, -1278  ,  -3040, -949  ,  -3240, -1068  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -1068  ,  -3040, -949  ,  -3040, -620  ,  -3240, -751  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -751  ,  -3040, -620  ,  -3040, -292  ,  -3240, -435  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -435  ,  -3040, -292  ,  -3040, 37  ,  -3240, -119  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, -119  ,  -3040, 37  ,  -3040, 366  ,  -3240, 197  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 197  ,  -3040, 366  ,  -3040, 694  ,  -3240, 514  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 514  ,  -3040, 694  ,  -3040, 1023  ,  -3240, 830  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 830  ,  -3040, 1023  ,  -3040, 1352  ,  -3240, 1146  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1146  ,  -3040, 1352  ,  -3040, 1680  ,  -3240, 1462  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3240, 1462  ,  -3040, 1680  ,  -3040, 2009  ,  -3240, 1779  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1935  ,  -2840, -1838  ,  -2840, -1527  ,  -3040, -1632  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1632  ,  -2840, -1527  ,  -2840, -1217  ,  -3040, -1328  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1328  ,  -2840, -1217  ,  -2840, -907  ,  -3040, -1025  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -1025  ,  -2840, -907  ,  -2840, -597  ,  -3040, -721  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -721  ,  -2840, -597  ,  -2840, -287  ,  -3040, -418  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -418  ,  -2840, -287  ,  -2840, 23  ,  -3040, -115  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, -115  ,  -2840, 23  ,  -2840, 334  ,  -3040, 189  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 189  ,  -2840, 334  ,  -2840, 644  ,  -3040, 492  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 492  ,  -2840, 644  ,  -2840, 954  ,  -3040, 795  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 795  ,  -2840, 954  ,  -2840, 1264  ,  -3040, 1099  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1099  ,  -2840, 1264  ,  -2840, 1574  ,  -3040, 1402  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1402  ,  -2840, 1574  ,  -2840, 1884  ,  -3040, 1706  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3040, 1706  ,  -2840, 1884  ,  -2840, 2194  ,  -3040, 2009  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1838  ,  -2640, -1727  ,  -2640, -1417  ,  -2840, -1527  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1527  ,  -2640, -1417  ,  -2640, -1107  ,  -2840, -1217  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -1217  ,  -2640, -1107  ,  -2640, -797  ,  -2840, -907  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -907  ,  -2640, -797  ,  -2640, -487  ,  -2840, -597  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -597  ,  -2640, -487  ,  -2640, -177  ,  -2840, -287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, -287  ,  -2640, -177  ,  -2640, 133  ,  -2840, 23  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 23  ,  -2640, 133  ,  -2640, 444  ,  -2840, 334  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 334  ,  -2640, 444  ,  -2640, 754  ,  -2840, 644  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 644  ,  -2640, 754  ,  -2640, 1064  ,  -2840, 954  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 954  ,  -2640, 1064  ,  -2640, 1374  ,  -2840, 1264  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1264  ,  -2640, 1374  ,  -2640, 1684  ,  -2840, 1574  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1574  ,  -2640, 1684  ,  -2640, 1994  ,  -2840, 1884  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2840, 1884  ,  -2640, 1994  ,  -2640, 2305  ,  -2840, 2194  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1727  ,  -2440, -1609  ,  -2440, -1305  ,  -2640, -1417  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1417  ,  -2440, -1305  ,  -2440, -1000  ,  -2640, -1107  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -1107  ,  -2440, -1000  ,  -2440, -696  ,  -2640, -797  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -797  ,  -2440, -696  ,  -2440, -391  ,  -2640, -487  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -487  ,  -2440, -391  ,  -2440, -87  ,  -2640, -177  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, -177  ,  -2440, -87  ,  -2440, 218  ,  -2640, 133  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 133  ,  -2440, 218  ,  -2440, 522  ,  -2640, 444  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 444  ,  -2440, 522  ,  -2440, 827  ,  -2640, 754  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 754  ,  -2440, 827  ,  -2440, 1131  ,  -2640, 1064  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1064  ,  -2440, 1131  ,  -2440, 1436  ,  -2640, 1374  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1374  ,  -2440, 1436  ,  -2440, 1740  ,  -2640, 1684  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1684  ,  -2440, 1740  ,  -2440, 2045  ,  -2640, 1994  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2640, 1994  ,  -2440, 2045  ,  -2440, 2349  ,  -2640, 2305  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1609  ,  -2240, -1485  ,  -2240, -1166  ,  -2440, -1279  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1279  ,  -2240, -1166  ,  -2240, -846  ,  -2440, -949  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -949  ,  -2240, -846  ,  -2240, -527  ,  -2440, -619  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -619  ,  -2240, -527  ,  -2240, -207  ,  -2440, -290  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -290  ,  -2240, -207  ,  -2240, 112  ,  -2440, 40  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 40  ,  -2240, 112  ,  -2240, 432  ,  -2440, 370  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 370  ,  -2240, 432  ,  -2240, 751  ,  -2440, 700  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 700  ,  -2240, 751  ,  -2240, 1071  ,  -2440, 1030  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1030  ,  -2240, 1071  ,  -2240, 1390  ,  -2440, 1360  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1360  ,  -2240, 1390  ,  -2240, 1710  ,  -2440, 1689  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 1689  ,  -2240, 1710  ,  -2240, 2029  ,  -2440, 2019  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, 2019  ,  -2240, 2029  ,  -2240, 2349  ,  -2440, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1485  ,  -2040, -1359  ,  -2040, -1069  ,  -2240, -1166  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -1166  ,  -2040, -1069  ,  -2040, -779  ,  -2240, -846  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -846  ,  -2040, -779  ,  -2040, -489  ,  -2240, -527  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -527  ,  -2040, -489  ,  -2040, -199  ,  -2240, -207  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, -207  ,  -2040, -199  ,  -2040, 91  ,  -2240, 112  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 112  ,  -2040, 91  ,  -2040, 381  ,  -2240, 432  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 432  ,  -2040, 381  ,  -2040, 671  ,  -2240, 751  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 751  ,  -2040, 671  ,  -2040, 962  ,  -2240, 1071  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1071  ,  -2040, 962  ,  -2040, 1252  ,  -2240, 1390  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1390  ,  -2040, 1252  ,  -2040, 1542  ,  -2240, 1710  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 1710  ,  -2040, 1542  ,  -2040, 1832  ,  -2240, 2029  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2240, 2029  ,  -2040, 1832  ,  -2040, 2122  ,  -2240, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -1359  ,  -1854, -1240  ,  -1854, -1236  ,  -2040, -1043  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -1043  ,  -1854, -1236  ,  -1854, -1233  ,  -2040, -726  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -726  ,  -1854, -1233  ,  -1854, -1230  ,  -2040, -410  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -410  ,  -1854, -1230  ,  -1854, -1227  ,  -2040, -93  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, -93  ,  -1854, -1227  ,  -1854, -1223  ,  -2040, 223  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 223  ,  -1854, -1223  ,  -1854, -1220  ,  -2040, 540  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 540  ,  -1854, -1220  ,  -1854, -1217  ,  -2040, 856  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 856  ,  -1854, -1217  ,  -1854, -1214  ,  -2040, 1172  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1172  ,  -1854, -1214  ,  -1854, -1210  ,  -2040, 1489  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1489  ,  -1854, -1210  ,  -1854, -1207  ,  -2040, 1805  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2040, 1805  ,  -1854, -1207  ,  -1854, -1204  ,  -2040, 2122  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -547  ,  -1226, -498  ,  -1226, -182  ,  -1426, -544  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -544  ,  -1226, -182  ,  -1226, 135  ,  -1426, -540  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -540  ,  -1226, 135  ,  -1226, 451  ,  -1426, -537  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -537  ,  -1226, 451  ,  -1226, 767  ,  -1426, -533  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -533  ,  -1226, 767  ,  -1226, 1084  ,  -1426, -529  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -529  ,  -1226, 1084  ,  -1226, 1400  ,  -1426, -526  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -526  ,  -1226, 1400  ,  -1226, 1716  ,  -1426, -522  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -522  ,  -1226, 1716  ,  -1226, 2033  ,  -1426, -518  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1426, -518  ,  -1226, 2033  ,  -1226, 2349  ,  -1426, -515  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, -498  ,  -1076, -462  ,  -1076, -149  ,  -1226, -182  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, -182  ,  -1076, -149  ,  -1076, 163  ,  -1226, 135  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 135  ,  -1076, 163  ,  -1076, 475  ,  -1226, 451  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 451  ,  -1076, 475  ,  -1076, 788  ,  -1226, 767  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 767  ,  -1076, 788  ,  -1076, 1100  ,  -1226, 1084  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 1084  ,  -1076, 1100  ,  -1076, 1412  ,  -1226, 1400  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 1400  ,  -1076, 1412  ,  -1076, 1724  ,  -1226, 1716  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 1716  ,  -1076, 1724  ,  -1076, 2037  ,  -1226, 2033  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1226, 2033  ,  -1076, 2037  ,  -1076, 2349  ,  -1226, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, -462  ,  -1026, -449  ,  -1026, -139  ,  -1076, -149  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, -149  ,  -1026, -139  ,  -1026, 172  ,  -1076, 163  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, 163  ,  -1026, 172  ,  -1026, 483  ,  -1076, 475  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, 475  ,  -1026, 483  ,  -1026, 794  ,  -1076, 788  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, 788  ,  -1026, 794  ,  -1026, 1105  ,  -1076, 1100  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, 1100  ,  -1026, 1105  ,  -1026, 1416  ,  -1076, 1412  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, 1412  ,  -1026, 1416  ,  -1026, 1727  ,  -1076, 1724  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, 1724  ,  -1026, 1727  ,  -1026, 2038  ,  -1076, 2037  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, 2037  ,  -1026, 2038  ,  -1026, 2349  ,  -1076, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, -449  ,  -826, -402  ,  -826, -96  ,  -1026, -139  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, -139  ,  -826, -96  ,  -826, 209  ,  -1026, 172  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 172  ,  -826, 209  ,  -826, 515  ,  -1026, 483  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 483  ,  -826, 515  ,  -826, 821  ,  -1026, 794  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 794  ,  -826, 821  ,  -826, 1126  ,  -1026, 1105  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 1105  ,  -826, 1126  ,  -826, 1432  ,  -1026, 1416  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 1416  ,  -826, 1432  ,  -826, 1738  ,  -1026, 1727  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 1727  ,  -826, 1738  ,  -826, 2043  ,  -1026, 2038  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1026, 2038  ,  -826, 2043  ,  -826, 2349  ,  -1026, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, -402  ,  -626, -355  ,  -626, -55  ,  -826, -96  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, -96  ,  -626, -55  ,  -626, 246  ,  -826, 209  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 209  ,  -626, 246  ,  -626, 546  ,  -826, 515  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 515  ,  -626, 546  ,  -626, 847  ,  -826, 821  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 821  ,  -626, 847  ,  -626, 1147  ,  -826, 1126  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 1126  ,  -626, 1147  ,  -626, 1448  ,  -826, 1432  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 1432  ,  -626, 1448  ,  -626, 1748  ,  -826, 1738  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 1738  ,  -626, 1748  ,  -626, 2049  ,  -826, 2043  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -826, 2043  ,  -626, 2049  ,  -626, 2349  ,  -826, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, -355  ,  -426, -310  ,  -426, 23  ,  -626, -17  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, -17  ,  -426, 23  ,  -426, 355  ,  -626, 321  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 321  ,  -426, 355  ,  -426, 687  ,  -626, 659  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 659  ,  -426, 687  ,  -426, 1020  ,  -626, 997  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 997  ,  -426, 1020  ,  -426, 1352  ,  -626, 1335  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 1335  ,  -426, 1352  ,  -426, 1684  ,  -626, 1673  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 1673  ,  -426, 1684  ,  -426, 2017  ,  -626, 2011  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -626, 2011  ,  -426, 2017  ,  -426, 2349  ,  -626, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, -310  ,  -226, -265  ,  -226, 62  ,  -426, 23  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 23  ,  -226, 62  ,  -226, 389  ,  -426, 355  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 355  ,  -226, 389  ,  -226, 716  ,  -426, 687  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 687  ,  -226, 716  ,  -226, 1042  ,  -426, 1020  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 1020  ,  -226, 1042  ,  -226, 1369  ,  -426, 1352  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 1352  ,  -226, 1369  ,  -226, 1696  ,  -426, 1684  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 1684  ,  -226, 1696  ,  -226, 2022  ,  -426, 2017  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -426, 2017  ,  -226, 2022  ,  -226, 2349  ,  -426, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, -265  ,  -26, -220  ,  -26, 101  ,  -226, 62  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 62  ,  -26, 101  ,  -26, 422  ,  -226, 389  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 389  ,  -26, 422  ,  -26, 743  ,  -226, 716  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 716  ,  -26, 743  ,  -26, 1065  ,  -226, 1042  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 1042  ,  -26, 1065  ,  -26, 1386  ,  -226, 1369  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 1369  ,  -26, 1386  ,  -26, 1707  ,  -226, 1696  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 1696  ,  -26, 1707  ,  -26, 2028  ,  -226, 2022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -226, 2022  ,  -26, 2028  ,  -26, 2349  ,  -226, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, -220  ,  142, -183  ,  142, 134  ,  -26, 101  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 101  ,  142, 134  ,  142, 450  ,  -26, 422  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 422  ,  142, 450  ,  142, 767  ,  -26, 743  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 743  ,  142, 767  ,  142, 1083  ,  -26, 1065  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 1065  ,  142, 1083  ,  142, 1400  ,  -26, 1386  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 1386  ,  142, 1400  ,  142, 1716  ,  -26, 1707  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 1707  ,  142, 1716  ,  142, 2033  ,  -26, 2028  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -26, 2028  ,  142, 2033  ,  142, 2349  ,  -26, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  142, -183  ,  174, -176  ,  174, 140  ,  142, 134  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  142, 134  ,  174, 140  ,  174, 455  ,  142, 450  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  142, 450  ,  174, 455  ,  174, 771  ,  142, 767  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  142, 767  ,  174, 771  ,  174, 1087  ,  142, 1083  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  142, 1083  ,  174, 1087  ,  174, 1402  ,  142, 1400  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  142, 1400  ,  174, 1402  ,  174, 1718  ,  142, 1716  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  142, 1716  ,  174, 1718  ,  174, 2033  ,  142, 2033  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  142, 2033  ,  174, 2033  ,  174, 2349  ,  142, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, -176  ,  180, -174  ,  180, 141  ,  174, 140  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 140  ,  180, 141  ,  180, 456  ,  174, 455  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 455  ,  180, 456  ,  180, 772  ,  174, 771  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 771  ,  180, 772  ,  180, 1087  ,  174, 1087  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 1087  ,  180, 1087  ,  180, 1403  ,  174, 1402  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 1402  ,  180, 1403  ,  180, 1718  ,  174, 1718  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 1718  ,  180, 1718  ,  180, 2034  ,  174, 2033  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  174, 2033  ,  180, 2034  ,  180, 2349  ,  174, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  180, -174  ,  374, -132  ,  374, 179  ,  180, 141  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  180, 141  ,  374, 179  ,  374, 489  ,  180, 456  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  180, 456  ,  374, 489  ,  374, 799  ,  180, 772  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  180, 772  ,  374, 799  ,  374, 1109  ,  180, 1087  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  180, 1087  ,  374, 1109  ,  374, 1419  ,  180, 1403  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  180, 1403  ,  374, 1419  ,  374, 1729  ,  180, 1718  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  180, 1718  ,  374, 1729  ,  374, 2039  ,  180, 2034  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  180, 2034  ,  374, 2039  ,  374, 2349  ,  180, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, -132  ,  574, -87  ,  574, 217  ,  374, 179  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 179  ,  574, 217  ,  574, 522  ,  374, 489  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 489  ,  574, 522  ,  574, 826  ,  374, 799  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 799  ,  574, 826  ,  574, 1131  ,  374, 1109  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 1109  ,  574, 1131  ,  574, 1435  ,  374, 1419  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 1419  ,  574, 1435  ,  574, 1740  ,  374, 1729  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 1729  ,  574, 1740  ,  574, 2044  ,  374, 2039  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  374, 2039  ,  574, 2044  ,  574, 2349  ,  374, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  574, -87  ,  774, -42  ,  774, 257  ,  574, 217  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  574, 217  ,  774, 257  ,  774, 556  ,  574, 522  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  574, 522  ,  774, 556  ,  774, 855  ,  574, 826  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  574, 826  ,  774, 855  ,  774, 1154  ,  574, 1131  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  574, 1131  ,  774, 1154  ,  774, 1452  ,  574, 1435  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  574, 1435  ,  774, 1452  ,  774, 1751  ,  574, 1740  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  574, 1740  ,  774, 1751  ,  774, 2050  ,  574, 2044  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  574, 2044  ,  774, 2050  ,  774, 2349  ,  574, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  774, -42  ,  974, 5  ,  974, 340  ,  774, 300  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  774, 300  ,  974, 340  ,  974, 674  ,  774, 641  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  774, 641  ,  974, 674  ,  974, 1009  ,  774, 983  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  774, 983  ,  974, 1009  ,  974, 1344  ,  774, 1324  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  774, 1324  ,  974, 1344  ,  974, 1679  ,  774, 1666  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  774, 1666  ,  974, 1679  ,  974, 2014  ,  774, 2007  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  774, 2007  ,  974, 2014  ,  974, 2349  ,  774, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  974, 5  ,  1174, 54  ,  1174, 379  ,  974, 340  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  974, 340  ,  1174, 379  ,  1174, 704  ,  974, 674  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  974, 674  ,  1174, 704  ,  1174, 1029  ,  974, 1009  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  974, 1009  ,  1174, 1029  ,  1174, 1354  ,  974, 1344  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  974, 1344  ,  1174, 1354  ,  1174, 1679  ,  974, 1679  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  974, 1679  ,  1174, 1679  ,  1174, 2004  ,  974, 2014  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  974, 2014  ,  1174, 2004  ,  1174, 2329  ,  974, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1174, 54  ,  1374, 106  ,  1374, 403  ,  1174, 379  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1174, 379  ,  1374, 403  ,  1374, 700  ,  1174, 704  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1174, 704  ,  1374, 700  ,  1374, 997  ,  1174, 1029  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1174, 1029  ,  1374, 997  ,  1374, 1294  ,  1174, 1354  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1174, 1354  ,  1374, 1294  ,  1374, 1590  ,  1174, 1679  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1174, 1679  ,  1374, 1590  ,  1374, 1887  ,  1174, 2004  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1174, 2004  ,  1374, 1887  ,  1374, 2184  ,  1174, 2329  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1374, 106  ,  1574, 164  ,  1574, 476  ,  1374, 452  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1374, 452  ,  1574, 476  ,  1574, 787  ,  1374, 799  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1374, 799  ,  1574, 787  ,  1574, 1099  ,  1374, 1145  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1374, 1145  ,  1574, 1099  ,  1574, 1411  ,  1374, 1491  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1374, 1491  ,  1574, 1411  ,  1574, 1722  ,  1374, 1838  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1374, 1838  ,  1574, 1722  ,  1574, 2034  ,  1374, 2184  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1574, 164  ,  1774, 229  ,  1774, 506  ,  1574, 476  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1574, 476  ,  1774, 506  ,  1774, 783  ,  1574, 787  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1574, 787  ,  1774, 783  ,  1774, 1060  ,  1574, 1099  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1574, 1099  ,  1774, 1060  ,  1774, 1336  ,  1574, 1411  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1574, 1411  ,  1774, 1336  ,  1774, 1613  ,  1574, 1722  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1574, 1722  ,  1774, 1613  ,  1774, 1890  ,  1574, 2034  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1774, 229  ,  1974, 305  ,  1974, 596  ,  1774, 562  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1774, 562  ,  1974, 596  ,  1974, 887  ,  1774, 894  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1774, 894  ,  1974, 887  ,  1974, 1177  ,  1774, 1226  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1774, 1226  ,  1974, 1177  ,  1974, 1468  ,  1774, 1558  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1774, 1558  ,  1974, 1468  ,  1974, 1758  ,  1774, 1890  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1974, 305  ,  2174, 394  ,  2174, 644  ,  1974, 596  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1974, 596  ,  2174, 644  ,  2174, 895  ,  1974, 887  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1974, 887  ,  2174, 895  ,  2174, 1145  ,  1974, 1177  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1974, 1177  ,  2174, 1145  ,  2174, 1396  ,  1974, 1468  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1974, 1468  ,  2174, 1396  ,  2174, 1646  ,  1974, 1758  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2174, 394  ,  2374, 497  ,  2374, 761  ,  2174, 707  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2174, 707  ,  2374, 761  ,  2374, 1026  ,  2174, 1020  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2174, 1020  ,  2374, 1026  ,  2374, 1291  ,  2174, 1333  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2174, 1333  ,  2374, 1291  ,  2374, 1555  ,  2174, 1646  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2374, 497  ,  2574, 613  ,  2574, 904  ,  2374, 849  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2374, 849  ,  2574, 904  ,  2574, 1195  ,  2374, 1202  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2374, 1202  ,  2574, 1195  ,  2574, 1487  ,  2374, 1555  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2574, 613  ,  2754, 727  ,  2754, 965  ,  2574, 904  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2574, 904  ,  2754, 965  ,  2754, 1204  ,  2574, 1195  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2574, 1195  ,  2754, 1204  ,  2754, 1442  ,  2574, 1487  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2754, 727  ,  2774, 740  ,  2774, 1089  ,  2754, 1085  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2754, 1085  ,  2774, 1089  ,  2774, 1438  ,  2754, 1442  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2774, 740  ,  2974, 877  ,  2974, 1142  ,  2774, 1089  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2774, 1089  ,  2974, 1142  ,  2974, 1407  ,  2774, 1438  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2974, 877  ,  3174, 1019  ,  3174, 1206  ,  2974, 1142  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2974, 1142  ,  3174, 1206  ,  3174, 1392  ,  2974, 1407  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3174, 1019  ,  3374, 1165  ,  3374, 1392  ,  3174, 1392  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3374, 1165  ,  3574, 1314  ,  3574, 1405  ,  3374, 1392  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3574, 1314  ,  3672, 1387  ,  3672, 1416  ,  3574, 1405  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1790, -2009  ,  -1590, -2006  ,  -1590, -1782  ,  -1790, -1980  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1590, -2006  ,  -1390, -2006  ,  -1390, -1561  ,  -1590, -1782  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1390, -2006  ,  -1190, -2007  ,  -1190, -1748  ,  -1390, -1783  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1390, -1783  ,  -1190, -1748  ,  -1190, -1489  ,  -1390, -1561  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1190, -2007  ,  -1076, -2009  ,  -1076, -1752  ,  -1190, -1748  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1190, -1748  ,  -1076, -1752  ,  -1076, -1495  ,  -1190, -1489  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, -2009  ,  -990, -2011  ,  -990, -1755  ,  -1076, -1752  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1076, -1752  ,  -990, -1755  ,  -990, -1500  ,  -1076, -1495  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -990, -2011  ,  -790, -2017  ,  -790, -1765  ,  -990, -1755  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -990, -1755  ,  -790, -1765  ,  -790, -1512  ,  -990, -1500  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -790, -2017  ,  -590, -2025  ,  -590, -1776  ,  -790, -1765  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -790, -1765  ,  -590, -1776  ,  -590, -1526  ,  -790, -1512  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -590, -2025  ,  -390, -2035  ,  -390, -1789  ,  -590, -1776  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -590, -1776  ,  -390, -1789  ,  -390, -1543  ,  -590, -1526  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -390, -2035  ,  -190, -2046  ,  -190, -1804  ,  -390, -1789  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -390, -1789  ,  -190, -1804  ,  -190, -1562  ,  -390, -1543  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -190, -2046  ,  10, -2058  ,  10, -1821  ,  -190, -1804  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -190, -1804  ,  10, -1821  ,  10, -1585  ,  -190, -1562  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  10, -2058  ,  142, -2066  ,  142, -1601  ,  10, -1585  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  142, -2066  ,  180, -2068  ,  180, -1605  ,  142, -1601  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  180, -2068  ,  210, -2070  ,  210, -1609  ,  180, -1605  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  210, -2070  ,  410, -2082  ,  410, -1635  ,  210, -1609  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  410, -2082  ,  610, -2094  ,  610, -1662  ,  410, -1635  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  610, -2094  ,  810, -2104  ,  810, -1688  ,  610, -1662  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  810, -2104  ,  1010, -2113  ,  1010, -1713  ,  810, -1688  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1010, -2113  ,  1210, -2121  ,  1210, -1735  ,  1010, -1713  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1210, -2121  ,  1410, -2126  ,  1410, -1755  ,  1210, -1735  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1410, -2126  ,  1610, -2129  ,  1610, -1771  ,  1410, -1755  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1610, -2129  ,  1810, -2130  ,  1810, -1787  ,  1610, -1771  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1810, -2130  ,  2010, -2130  ,  2010, -1825  ,  1810, -1787  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2010, -2130  ,  2210, -2128  ,  2210, -1886  ,  2010, -1825  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2210, -2128  ,  2410, -2125  ,  2410, -1955  ,  2210, -1886  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2410, -2125  ,  2610, -2123  ,  2610, -2022  ,  2410, -1955  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2610, -2123  ,  2754, -2122  ,  2754, -2064  ,  2610, -2022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2754, -2122  ,  2810, -2122  ,  2810, -2078  ,  2754, -2064  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2810, -2122  ,  2882, -2122  ,  2882, -2093  ,  2810, -2078  }
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
