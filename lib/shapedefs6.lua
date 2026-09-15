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
                    shape = {  -3840, -1874  ,  -3700, -1887  ,  -3700, 1653  ,  -3840, 1717  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3700, -1887  ,  -3560, -1910  ,  -3560, 1575  ,  -3700, 1653  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3560, -1910  ,  -3420, -1936  ,  -3420, 1486  ,  -3560, 1575  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3420, -1936  ,  -3280, -1961  ,  -3280, 1392  ,  -3420, 1486  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3280, -1961  ,  -3140, -1979  ,  -3140, 1301  ,  -3280, 1392  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3140, -1979  ,  -3000, -1984  ,  -3000, 1215  ,  -3140, 1301  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3000, -1984  ,  -2860, -1976  ,  -2860, 1136  ,  -3000, 1215  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2860, -1976  ,  -2720, -1953  ,  -2720, 1059  ,  -2860, 1136  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2720, -1953  ,  -2580, -1916  ,  -2580, 982  ,  -2720, 1059  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2580, -1916  ,  -2440, -1867  ,  -2440, 907  ,  -2580, 982  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1867  ,  -2300, -1809  ,  -2300, 840  ,  -2440, 907  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2300, -1809  ,  -2160, -1747  ,  -2160, 794  ,  -2300, 840  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2160, -1747  ,  -2020, -1686  ,  -2020, 777  ,  -2160, 794  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2020, -1686  ,  -1880, -1630  ,  -1880, 786  ,  -2020, 777  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1880, -1630  ,  -1740, -1582  ,  -1740, 811  ,  -1880, 786  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1740, -1582  ,  -1600, -1541  ,  -1600, 844  ,  -1740, 811  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1100, -511  ,  -960, -480  ,  -960, 1776  ,  -1100, 1773  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -960, -480  ,  -820, -496  ,  -820, 1742  ,  -960, 1776  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -820, -496  ,  -680, -567  ,  -680, 1671  ,  -820, 1742  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -680, -567  ,  -540, -664  ,  -540, 1595  ,  -680, 1671  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -540, -664  ,  -400, -740  ,  -400, 1562  ,  -540, 1595  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -400, -740  ,  -260, -757  ,  -260, 1606  ,  -400, 1562  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -260, -757  ,  -120, -706  ,  -120, 1721  ,  -260, 1606  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -120, -706  ,  20, -613  ,  20, 1865  ,  -120, 1721  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  20, -613  ,  160, -520  ,  160, 1979  ,  20, 1865  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  160, -520  ,  300, -463  ,  300, 2025  ,  160, 1979  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  300, -463  ,  440, -443  ,  440, 2011  ,  300, 2025  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  440, -443  ,  580, -437  ,  580, 1980  ,  440, 2011  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  580, -437  ,  720, -422  ,  720, 1976  ,  580, 1980  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1300, 349  ,  1440, 377  ,  1440, 2349  ,  1300, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1440, 377  ,  1580, 395  ,  1580, 2349  ,  1440, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1580, 395  ,  1720, 404  ,  1720, 2349  ,  1580, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1720, 404  ,  1860, 409  ,  1860, 2349  ,  1720, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1860, 409  ,  2000, 413  ,  2000, 2349  ,  1860, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2000, 413  ,  2140, 419  ,  2140, 2309  ,  2000, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2140, 419  ,  2280, 428  ,  2280, 2234  ,  2140, 2309  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2280, 428  ,  2420, 440  ,  2420, 2154  ,  2280, 2234  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2420, 440  ,  2560, 455  ,  2560, 2068  ,  2420, 2154  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2560, 455  ,  2700, 472  ,  2700, 1977  ,  2560, 2068  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2700, 472  ,  2840, 493  ,  2840, 1883  ,  2700, 1977  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2840, 493  ,  2980, 515  ,  2980, 1784  ,  2840, 1883  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2980, 515  ,  3120, 539  ,  3120, 1680  ,  2980, 1784  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3120, 539  ,  3260, 563  ,  3260, 1571  ,  3120, 1680  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3260, 563  ,  3400, 586  ,  3400, 1457  ,  3260, 1571  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3400, 586  ,  3540, 608  ,  3540, 1340  ,  3400, 1457  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3540, 608  ,  3680, 630  ,  3680, 1223  ,  3540, 1340  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3680, 630  ,  3820, 652  ,  3820, 1052  ,  3680, 1223  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3820, 652  ,  3838, 655  ,  3838, 1029  ,  3820, 1052  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -200, -2034  ,  -60, -1990  ,  -60, -1843  ,  -200, -1990  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -60, -1990  ,  80, -1939  ,  80, -1667  ,  -60, -1843  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  80, -1939  ,  220, -1884  ,  220, -1507  ,  80, -1667  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  220, -1884  ,  360, -1829  ,  360, -1401  ,  220, -1507  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  360, -1829  ,  500, -1778  ,  500, -1360  ,  360, -1401  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  500, -1778  ,  640, -1735  ,  640, -1333  ,  500, -1360  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  640, -1735  ,  780, -1702  ,  780, -1318  ,  640, -1333  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  780, -1702  ,  920, -1682  ,  920, -1313  ,  780, -1318  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  920, -1682  ,  1060, -1672  ,  1060, -1318  ,  920, -1313  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1060, -1672  ,  1200, -1669  ,  1200, -1330  ,  1060, -1318  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1200, -1669  ,  1340, -1669  ,  1340, -1344  ,  1200, -1330  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1340, -1669  ,  1480, -1669  ,  1480, -1357  ,  1340, -1344  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1480, -1669  ,  1620, -1665  ,  1620, -1367  ,  1480, -1357  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1620, -1665  ,  1760, -1658  ,  1760, -1371  ,  1620, -1367  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1760, -1658  ,  1900, -1649  ,  1900, -1372  ,  1760, -1371  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1900, -1649  ,  2040, -1639  ,  2040, -1378  ,  1900, -1372  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2040, -1639  ,  2180, -1630  ,  2180, -1417  ,  2040, -1378  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2180, -1630  ,  2320, -1620  ,  2320, -1473  ,  2180, -1417  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2320, -1620  ,  2460, -1608  ,  2460, -1528  ,  2320, -1473  }
                    }
                    }
		,
		["2"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1575  ,  -3700, -1610  ,  -3700, 1891  ,  -3840, 1977  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3700, -1610  ,  -3560, -1600  ,  -3560, 1847  ,  -3700, 1891  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3560, -1600  ,  -3420, -1553  ,  -3420, 1841  ,  -3560, 1847  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3420, -1553  ,  -3280, -1494  ,  -3280, 1850  ,  -3420, 1841  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3280, -1494  ,  -3140, -1448  ,  -3140, 1849  ,  -3280, 1850  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3140, -1448  ,  -3000, -1434  ,  -3000, 1815  ,  -3140, 1849  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3000, -1434  ,  -2860, -1455  ,  -2860, 1740  ,  -3000, 1815  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2860, -1455  ,  -2720, -1502  ,  -2720, 1633  ,  -2860, 1740  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2720, -1502  ,  -2580, -1560  ,  -2580, 1509  ,  -2720, 1633  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2580, -1560  ,  -2440, -1621  ,  -2440, 1379  ,  -2580, 1509  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -1621  ,  -2300, -1678  ,  -2300, 1255  ,  -2440, 1379  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2300, -1678  ,  -2160, -1728  ,  -2160, 1147  ,  -2300, 1255  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2160, -1728  ,  -2020, -1766  ,  -2020, 1067  ,  -2160, 1147  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2020, -1766  ,  -1880, -1781  ,  -1880, 1029  ,  -2020, 1067  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1380, -882  ,  -1240, -840  ,  -1240, 1879  ,  -1380, 1860  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1240, -840  ,  -1100, -808  ,  -1100, 1899  ,  -1240, 1879  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1100, -808  ,  -960, -789  ,  -960, 1919  ,  -1100, 1899  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -960, -789  ,  -820, -781  ,  -820, 1937  ,  -960, 1919  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -820, -781  ,  -680, -779  ,  -680, 1956  ,  -820, 1937  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -680, -779  ,  -540, -776  ,  -540, 1978  ,  -680, 1956  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -540, -776  ,  -400, -767  ,  -400, 2008  ,  -540, 1978  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -400, -767  ,  -260, -747  ,  -260, 2042  ,  -400, 2008  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -260, -747  ,  -120, -719  ,  -120, 2076  ,  -260, 2042  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -120, -719  ,  20, -687  ,  20, 2106  ,  -120, 2076  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  20, -687  ,  160, -655  ,  160, 2130  ,  20, 2106  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  160, -655  ,  300, -626  ,  300, 2153  ,  160, 2130  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  300, -626  ,  440, -599  ,  440, 2177  ,  300, 2153  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  440, -599  ,  580, -571  ,  580, 2204  ,  440, 2177  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  580, -571  ,  720, -537  ,  720, 2229  ,  580, 2204  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  720, -537  ,  860, -498  ,  860, 1809  ,  720, 2229  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  860, -498  ,  1000, -456  ,  1000, 493  ,  860, 1809  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1620, -259  ,  1760, -126  ,  1760, 1621  ,  1620, 1529  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1760, -126  ,  1900, 22  ,  1900, 1737  ,  1760, 1621  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1900, 22  ,  2040, 172  ,  2040, 1863  ,  1900, 1737  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2040, 172  ,  2180, 315  ,  2180, 1987  ,  2040, 1863  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2180, 315  ,  2320, 448  ,  2320, 2105  ,  2180, 1987  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2320, 448  ,  2460, 572  ,  2460, 2216  ,  2320, 2105  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2460, 572  ,  2600, 684  ,  2600, 2317  ,  2460, 2216  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2600, 684  ,  2740, 779  ,  2740, 2349  ,  2600, 2317  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2740, 779  ,  2880, 854  ,  2880, 2349  ,  2740, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2880, 854  ,  3020, 908  ,  3020, 2349  ,  2880, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3020, 908  ,  3160, 945  ,  3160, 2349  ,  3020, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3160, 945  ,  3300, 973  ,  3300, 2349  ,  3160, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3300, 973  ,  3440, 1000  ,  3440, 2349  ,  3300, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3440, 1000  ,  3580, 1029  ,  3580, 2349  ,  3440, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3580, 1029  ,  3720, 1063  ,  3720, 2349  ,  3580, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3720, 1063  ,  3838, 1095  ,  3838, 2349  ,  3720, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1700, -1339  ,  1840, -1300  ,  1840, -1139  ,  1700, -1290  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1840, -1300  ,  1980, -1256  ,  1980, -970  ,  1840, -1139  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1980, -1256  ,  2120, -1209  ,  2120, -829  ,  1980, -970  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2120, -1209  ,  2260, -1163  ,  2260, -751  ,  2120, -829  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2260, -1163  ,  2400, -1117  ,  2400, -719  ,  2260, -751  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2400, -1117  ,  2540, -1074  ,  2540, -685  ,  2400, -719  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2540, -1074  ,  2680, -1036  ,  2680, -655  ,  2540, -685  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2680, -1036  ,  2820, -1007  ,  2820, -634  ,  2680, -655  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2820, -1007  ,  2960, -984  ,  2960, -622  ,  2820, -634  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2960, -984  ,  3100, -964  ,  3100, -617  ,  2960, -622  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3100, -964  ,  3240, -943  ,  3240, -616  ,  3100, -617  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3240, -943  ,  3380, -917  ,  3380, -613  ,  3240, -616  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3380, -917  ,  3520, -885  ,  3520, -610  ,  3380, -613  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3520, -885  ,  3660, -846  ,  3660, -629  ,  3520, -610  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3660, -846  ,  3800, -798  ,  3800, -654  ,  3660, -629  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3800, -798  ,  3838, -784  ,  3838, -659  ,  3800, -654  }
                    }
                    }
		,
		["3"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1288  ,  -3700, -1251  ,  -3700, 2156  ,  -3840, 2166  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3700, -1251  ,  -3560, -1217  ,  -3560, 2140  ,  -3700, 2156  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3560, -1217  ,  -3420, -1183  ,  -3420, 2119  ,  -3560, 2140  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3420, -1183  ,  -3280, -1150  ,  -3280, 2095  ,  -3420, 2119  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3280, -1150  ,  -3140, -1116  ,  -3140, 2068  ,  -3280, 2095  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3140, -1116  ,  -3000, -1080  ,  -3000, 2040  ,  -3140, 2068  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3000, -1080  ,  -2860, -1044  ,  -2860, 2010  ,  -3000, 2040  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2860, -1044  ,  -2720, -1007  ,  -2720, 1979  ,  -2860, 2010  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2720, -1007  ,  -2580, -970  ,  -2580, 1945  ,  -2720, 1979  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2580, -970  ,  -2440, -936  ,  -2440, 1907  ,  -2580, 1945  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -936  ,  -2300, -903  ,  -2300, 1866  ,  -2440, 1907  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2300, -903  ,  -2160, -873  ,  -2160, 1820  ,  -2300, 1866  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2160, -873  ,  -2020, -847  ,  -2020, 1769  ,  -2160, 1820  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2020, -847  ,  -1880, -822  ,  -1880, 1715  ,  -2020, 1769  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1880, -822  ,  -1740, -799  ,  -1740, 1658  ,  -1880, 1715  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1740, -799  ,  -1600, -777  ,  -1600, 1601  ,  -1740, 1658  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1600, -777  ,  -1460, -755  ,  -1460, 1544  ,  -1600, 1601  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1460, -755  ,  -1320, -731  ,  -1320, 1490  ,  -1460, 1544  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1320, -731  ,  -1180, -706  ,  -1180, 1441  ,  -1320, 1490  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1180, -706  ,  -1040, -678  ,  -1040, 1396  ,  -1180, 1441  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, -678  ,  -900, -649  ,  -900, 1357  ,  -1040, 1396  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -900, -649  ,  -760, -618  ,  -760, 1325  ,  -900, 1357  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -760, -618  ,  -620, -584  ,  -620, 1241  ,  -760, 1325  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -620, -584  ,  -480, -548  ,  -480, 837  ,  -620, 1241  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -480, -548  ,  -340, -507  ,  -340, 283  ,  -480, 837  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -340, -507  ,  -200, -462  ,  -200, -197  ,  -340, 283  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  460, -178  ,  600, -118  ,  600, 2349  ,  460, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  600, -118  ,  740, -49  ,  740, 2349  ,  600, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  740, -49  ,  880, 29  ,  880, 2349  ,  740, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  880, 29  ,  1020, 110  ,  1020, 2326  ,  880, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1020, 110  ,  1160, 191  ,  1160, 2259  ,  1020, 2326  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1160, 191  ,  1300, 269  ,  1300, 2194  ,  1160, 2259  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1300, 269  ,  1440, 343  ,  1440, 2138  ,  1300, 2194  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1440, 343  ,  1580, 411  ,  1580, 2098  ,  1440, 2138  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1580, 411  ,  1720, 474  ,  1720, 2079  ,  1580, 2098  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1720, 474  ,  1860, 533  ,  1860, 2082  ,  1720, 2079  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1860, 533  ,  2000, 590  ,  2000, 2107  ,  1860, 2082  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2000, 590  ,  2140, 645  ,  2140, 2150  ,  2000, 2107  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2140, 645  ,  2280, 697  ,  2280, 2205  ,  2140, 2150  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2280, 697  ,  2420, 747  ,  2420, 2264  ,  2280, 2205  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2420, 747  ,  2560, 793  ,  2560, 2321  ,  2420, 2264  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2560, 793  ,  2700, 837  ,  2700, 2349  ,  2560, 2321  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2700, 837  ,  2840, 880  ,  2840, 2349  ,  2700, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2840, 880  ,  2980, 923  ,  2980, 2349  ,  2840, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2980, 923  ,  3120, 969  ,  3120, 2349  ,  2980, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3120, 969  ,  3260, 1018  ,  3260, 2349  ,  3120, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3260, 1018  ,  3400, 1070  ,  3400, 2349  ,  3260, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3400, 1070  ,  3540, 1123  ,  3540, 2349  ,  3400, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3540, 1123  ,  3680, 1175  ,  3680, 2312  ,  3540, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3680, 1175  ,  3820, 1223  ,  3820, 2261  ,  3680, 2312  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3820, 1223  ,  3838, 1229  ,  3838, 2254  ,  3820, 2261  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1240, -1492  ,  1380, -1450  ,  1380, -1290  ,  1240, -1409  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1380, -1450  ,  1520, -1399  ,  1520, -1163  ,  1380, -1290  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1520, -1399  ,  1660, -1341  ,  1660, -1052  ,  1520, -1163  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1660, -1341  ,  1800, -1281  ,  1800, -973  ,  1660, -1052  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1800, -1281  ,  1940, -1224  ,  1940, -899  ,  1800, -973  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1940, -1224  ,  2080, -1175  ,  2080, -830  ,  1940, -899  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2080, -1175  ,  2220, -1138  ,  2220, -774  ,  2080, -830  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2220, -1138  ,  2360, -1114  ,  2360, -733  ,  2220, -774  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2360, -1114  ,  2500, -1100  ,  2500, -707  ,  2360, -733  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2500, -1100  ,  2640, -1091  ,  2640, -692  ,  2500, -707  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2640, -1091  ,  2780, -1082  ,  2780, -682  ,  2640, -692  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2780, -1082  ,  2920, -1069  ,  2920, -672  ,  2780, -682  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2920, -1069  ,  3060, -1048  ,  3060, -662  ,  2920, -672  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3060, -1048  ,  3200, -1017  ,  3200, -685  ,  3060, -662  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3200, -1017  ,  3340, -977  ,  3340, -730  ,  3200, -685  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3340, -977  ,  3480, -932  ,  3480, -777  ,  3340, -730  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3480, -932  ,  3620, -887  ,  3620, -813  ,  3480, -777  }
                    }
                    }
		,
		["4"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3840, -1752  ,  -3700, -1669  ,  -3700, 1102  ,  -3840, 1000  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3700, -1669  ,  -3560, -1584  ,  -3560, 1217  ,  -3700, 1102  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3560, -1584  ,  -3420, -1496  ,  -3420, 1340  ,  -3560, 1217  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3420, -1496  ,  -3280, -1407  ,  -3280, 1468  ,  -3420, 1340  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3280, -1407  ,  -3140, -1316  ,  -3140, 1598  ,  -3280, 1468  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3140, -1316  ,  -3000, -1225  ,  -3000, 1726  ,  -3140, 1598  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -3000, -1225  ,  -2860, -1133  ,  -2860, 1848  ,  -3000, 1726  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2860, -1133  ,  -2720, -1041  ,  -2720, 1962  ,  -2860, 1848  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2720, -1041  ,  -2580, -949  ,  -2580, 2066  ,  -2720, 1962  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2580, -949  ,  -2440, -857  ,  -2440, 2159  ,  -2580, 2066  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2440, -857  ,  -2300, -765  ,  -2300, 2241  ,  -2440, 2159  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2300, -765  ,  -2160, -675  ,  -2160, 2312  ,  -2300, 2241  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2160, -675  ,  -2020, -588  ,  -2020, 2349  ,  -2160, 2312  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -2020, -588  ,  -1880, -508  ,  -1880, 2349  ,  -2020, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1880, -508  ,  -1740, -437  ,  -1740, 2349  ,  -1880, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1740, -437  ,  -1600, -376  ,  -1600, 2349  ,  -1740, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1600, -376  ,  -1460, -324  ,  -1460, 2349  ,  -1600, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1460, -324  ,  -1320, -280  ,  -1320, 2349  ,  -1460, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1320, -280  ,  -1180, -241  ,  -1180, 2349  ,  -1320, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1180, -241  ,  -1040, -206  ,  -1040, 2349  ,  -1180, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -1040, -206  ,  -900, -171  ,  -900, 2349  ,  -1040, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -900, -171  ,  -760, -133  ,  -760, 1834  ,  -900, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -760, -133  ,  -620, -92  ,  -620, 744  ,  -760, 1834  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -620, -92  ,  -480, -45  ,  -480, 7  ,  -620, 744  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  100, 537  ,  240, 549  ,  240, 2335  ,  100, 2327  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  240, 549  ,  380, 562  ,  380, 2347  ,  240, 2335  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  380, 562  ,  520, 574  ,  520, 2349  ,  380, 2347  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  520, 574  ,  660, 585  ,  660, 2349  ,  520, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  660, 585  ,  800, 594  ,  800, 2349  ,  660, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  800, 594  ,  940, 603  ,  940, 2349  ,  800, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  940, 603  ,  1080, 612  ,  1080, 2349  ,  940, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1080, 612  ,  1220, 622  ,  1220, 2349  ,  1080, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1220, 622  ,  1360, 632  ,  1360, 2349  ,  1220, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1360, 632  ,  1500, 643  ,  1500, 2349  ,  1360, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1500, 643  ,  1640, 654  ,  1640, 2349  ,  1500, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1640, 654  ,  1780, 664  ,  1780, 2349  ,  1640, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1780, 664  ,  1920, 672  ,  1920, 2349  ,  1780, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1920, 672  ,  2060, 676  ,  2060, 2349  ,  1920, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2060, 676  ,  2200, 676  ,  2200, 2349  ,  2060, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2200, 676  ,  2340, 673  ,  2340, 2327  ,  2200, 2349  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2340, 673  ,  2480, 670  ,  2480, 2270  ,  2340, 2327  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2480, 670  ,  2620, 669  ,  2620, 2210  ,  2480, 2270  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2620, 669  ,  2760, 677  ,  2760, 2152  ,  2620, 2210  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2760, 677  ,  2900, 698  ,  2900, 2102  ,  2760, 2152  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2900, 698  ,  3040, 738  ,  3040, 2067  ,  2900, 2102  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3040, 738  ,  3180, 799  ,  3180, 2052  ,  3040, 2067  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3180, 799  ,  3320, 880  ,  3320, 2057  ,  3180, 2052  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3320, 880  ,  3460, 978  ,  3460, 2081  ,  3320, 2057  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3460, 978  ,  3600, 1088  ,  3600, 2121  ,  3460, 2081  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3600, 1088  ,  3740, 1200  ,  3740, 2169  ,  3600, 2121  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3740, 1200  ,  3838, 1275  ,  3838, 2204  ,  3740, 2169  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -600, -1061  ,  -460, -1078  ,  -460, -883  ,  -600, -1002  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -460, -1078  ,  -320, -1096  ,  -320, -738  ,  -460, -883  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -320, -1096  ,  -180, -1113  ,  -180, -616  ,  -320, -738  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -180, -1113  ,  -40, -1130  ,  -40, -560  ,  -180, -616  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  -40, -1130  ,  100, -1145  ,  100, -580  ,  -40, -560  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  100, -1145  ,  240, -1160  ,  240, -604  ,  100, -580  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  240, -1160  ,  380, -1175  ,  380, -627  ,  240, -604  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  380, -1175  ,  520, -1191  ,  520, -651  ,  380, -627  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  520, -1191  ,  660, -1207  ,  660, -676  ,  520, -651  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  660, -1207  ,  800, -1224  ,  800, -702  ,  660, -676  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  800, -1224  ,  940, -1242  ,  940, -730  ,  800, -702  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  940, -1242  ,  1080, -1262  ,  1080, -760  ,  940, -730  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1080, -1262  ,  1220, -1282  ,  1220, -791  ,  1080, -760  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1220, -1282  ,  1360, -1303  ,  1360, -824  ,  1220, -791  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1360, -1303  ,  1500, -1324  ,  1500, -858  ,  1360, -824  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1500, -1324  ,  1640, -1344  ,  1640, -893  ,  1500, -858  }
                    }
                     ,
                    {
                    pe_fixture_id = "is", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1640, -1344  ,  1780, -1364  ,  1780, -927  ,  1640, -893  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1780, -1364  ,  1920, -1382  ,  1920, -961  ,  1780, -927  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  1920, -1382  ,  2060, -1400  ,  2060, -994  ,  1920, -961  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2060, -1400  ,  2200, -1417  ,  2200, -1025  ,  2060, -994  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2200, -1417  ,  2340, -1433  ,  2340, -1057  ,  2200, -1025  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2340, -1433  ,  2480, -1449  ,  2480, -1087  ,  2340, -1057  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2480, -1449  ,  2620, -1466  ,  2620, -1118  ,  2480, -1087  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2620, -1466  ,  2760, -1484  ,  2760, -1149  ,  2620, -1118  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2760, -1484  ,  2900, -1502  ,  2900, -1184  ,  2760, -1149  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  2900, -1502  ,  3040, -1522  ,  3040, -1235  ,  2900, -1184  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3040, -1522  ,  3180, -1542  ,  3180, -1296  ,  3040, -1235  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3180, -1542  ,  3320, -1562  ,  3320, -1364  ,  3180, -1296  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3320, -1562  ,  3460, -1581  ,  3460, -1432  ,  3320, -1364  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3460, -1581  ,  3600, -1600  ,  3600, -1497  ,  3460, -1432  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3600, -1600  ,  3740, -1617  ,  3740, -1554  ,  3600, -1497  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {  3740, -1617  ,  3838, -1628  ,  3838, -1589  ,  3740, -1554  }
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
