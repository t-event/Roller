-- This file is for use with Corona(R) SDK
--
-- Ground shapes ("1"-"4") for bane 6, 2026-09-15.
--
-- Hver form her er KOPIERT rett fra den banen flisa si grafikk kommer
-- fra, ikke generert eller sporet på nytt:
--   flis 1: level4/1.png + lib/shapedefs4.lua sin ["1"]
--   flis 2: level3/2.png + lib/shapedefs3.lua sin ["2"]
--   flis 3: level2/3.png + lib/shapedefs2.lua sin ["3"]
--   flis 4: level4/4.png + lib/shapedefs4.lua sin ["4"]
-- Det betyr at formen er den samme håndsporede formen som allerede
-- brukes for nøyaktig det bildet i sin opprinnelige bane, og at bilde og
-- kollisjon dermed hører sammen per konstruksjon.
--
-- Erstattet den prosedyregenererte grafikken og formene bane 6 hadde
-- før (Mathias: bane 5 og 6 så ikke like bra ut som bane 1-4, han ville
-- ha identisk bakke- og tak-utseende som de første banene).
-- "del1" (markens egen form) er uendret, kopiert fra lib/shapedefs4.lua.
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
                    shape = {   -1692, -743  ,  -1725, -813  ,  -1683, -791  ,  -1677, -772  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1704, -697  ,  -1909, -880  ,  -1725, -813  ,  -1692, -743  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1713, -601  ,  -1730, -511  ,  -2050, -947  ,  -2002, -927  ,  -1909, -880  ,  -1704, -697  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3620, -1928  ,  -3602, -1923  ,  -3581, -1911  ,  -3697, -1834  ,  -3705, -1877  ,  -3701, -1896  ,  -3692, -1915  ,  -3680, -1928  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3552, -1885  ,  -3697, -1834  ,  -3581, -1911  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3485, -1840  ,  -3461, -1818  ,  -3726, -1800  ,  -3697, -1834  ,  -3552, -1885  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1820, 126  ,  -1750, -99  ,  -1747, -65  ,  -1768, 51  ,  -1779, 82  ,  -1790, 100  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3407, -1784  ,  -3767, -1702  ,  -3756, -1742  ,  -3740, -1777  ,  -3726, -1800  ,  -3461, -1818  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1839, 1484  ,  -1854, 2033  ,  -3490, 1897  ,  -1868, 1404  ,  -1848, 1446  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3108, -1654  ,  -3724, -638  ,  -3724, -1337  ,  -3198, -1719  ,  -3178, -1710  ,  -3132, -1679  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3541, 1510  ,  -3549, 1486  ,  -2176, -1012  ,  -2087, -969  ,  -1832, 369  ,  -1840, 406  ,  -3507, 1574  ,  -3529, 1539  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3334, -1758  ,  -3767, -1702  ,  -3407, -1784  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3198, -1719  ,  -3738, -1496  ,  -3769, -1625  ,  -3771, -1672  ,  -3767, -1702  ,  -3334, -1758  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3198, -1719  ,  -3724, -1337  ,  -3736, -1409  ,  -3738, -1496  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1786, 1612  ,  -1774, 1703  ,  -1774, 1816  ,  -1785, 1899  ,  -1814, 1975  ,  -1854, 2033  ,  -1839, 1484  ,  -1797, 1569  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1814, 1975  ,  -1785, 1899  ,  -1797, 1938  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3561, 1320  ,  -3547, 1145  ,  -2474, -1176  ,  -2176, -1012  ,  -3549, 1486  ,  -3560, 1425  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1721, -203  ,  -1820, 126  ,  -2050, -947  ,  -1732, -417  ,  -1720, -365  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1750, -99  ,  -1721, -203  ,  -1733, -148  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3490, 1897  ,  -1867, 1039  ,  -1868, 1404  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3490, 1897  ,  -3504, 1838  ,  -3507, 1574  ,  -1840, 406  ,  -1842, 882  ,  -1867, 1039  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3025, -1582  ,  -2892, -1441  ,  -3724, -638  ,  -3108, -1654  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2760, -1326  ,  -3710, -532  ,  -3724, -638  ,  -2892, -1441  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2760, -1326  ,  -2693, -1279  ,  -3666, -181  ,  -3699, -408  ,  -3710, -532  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2589, -1228  ,  -3609, 115  ,  -3655, -78  ,  -3666, -181  ,  -2693, -1279  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2589, -1228  ,  -3551, 480  ,  -3609, 115  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2589, -1228  ,  -3547, 678  ,  -3551, 480  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2589, -1228  ,  -2541, -1210  ,  -2474, -1176  ,  -3547, 1145  ,  -3547, 678  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2176, -1012  ,  -2474, -1176  ,  -2372, -1132  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1734, -472  ,  -2050, -947  ,  -1730, -511  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1732, -417  ,  -2050, -947  ,  -1734, -472  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1832, 369  ,  -2087, -969  ,  -2050, -947  ,  -1820, 126  ,  -1822, 283  }
                    }
                    
                    
                    
                     ,
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -629, -253  ,  -683, 65  ,  -683, -233  ,  -667, -261  ,  -636, -280  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -505, -297  ,  -447, -262  ,  -602, -251  ,  -559, -295  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -724, 301  ,  -768, 460  ,  -765, 357  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -19, -26  ,  -120, -113  ,  -79, -101  ,  -54, -85  ,  -28, -62  ,  -20, -48  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -683, -127  ,  -683, -63  ,  -687, -99  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -385, -228  ,  -602, -251  ,  -447, -262  ,  -430, -259  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -900, 1594  ,  2465, 997  ,  -904, 1663  ,  -907, 1639  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3397, 2028  ,  -915, 1704  ,  2465, 997  ,  2970, 1150  ,  3521, 1822  ,  3509, 1861  ,  3487, 1912  ,  3446, 1976  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -915, 1704  ,  3397, 2028  ,  -845, 2022  ,  -887, 1951  ,  -914, 1866  ,  -923, 1772  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3332, 1302  ,  3367, 1337  ,  3460, 1461  ,  3521, 1822  ,  3085, 1200  ,  3151, 1212  ,  3207, 1228  ,  3279, 1263  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3532, 1753  ,  3521, 1822  ,  3460, 1461  ,  3495, 1522  ,  3515, 1573  ,  3531, 1663  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2970, 1150  ,  2465, 997  ,  2937, 1134  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -190, -146  ,  -356, -222  ,  -261, -190  ,  -217, -167  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -777, 509  ,  -788, 547  ,  -791, 547  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -874, 1259  ,  2465, 997  ,  -900, 1594  ,  -898, 1368  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -914, 1866  ,  -887, 1951  ,  -905, 1905  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1133, 403  ,  -19, -26  ,  569, 133  ,  850, 233  ,  943, 278  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3085, 1200  ,  3521, 1822  ,  2970, 1150  ,  3028, 1171  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -120, -113  ,  -19, -26  ,  -190, -146  ,  -135, -124  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -19, -26  ,  -701, 234  ,  -624, -250  ,  -602, -251  ,  -385, -228  ,  -356, -222  ,  -190, -146  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2159, 927  ,  -712, 275  ,  -701, 234  ,  1583, 637  ,  2059, 854  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1819, 721  ,  2011, 832  ,  1583, 637  ,  1696, 669  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2897, 1122  ,  2465, 997  ,  2837, 1097  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1583, 637  ,  -701, 234  ,  -19, -26  ,  1501, 589  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2604, 1019  ,  2713, 1054  ,  2780, 1081  ,  2465, 997  ,  2546, 1006  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1133, 403  ,  1032, 336  ,  1064, 353  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1259, 474  ,  -19, -26  ,  1133, 403  ,  1215, 445  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -813, 603  ,  -866, 1163  ,  -866, 686  ,  -858, 668  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2381, 979  ,  -777, 509  ,  2207, 934  ,  2316, 958  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -788, 547  ,  2465, 997  ,  -874, 1259  ,  -813, 603  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -712, 275  ,  2159, 927  ,  -777, 509  ,  -768, 460  ,  -724, 301  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -629, -253  ,  -624, -250  ,  -701, 234  ,  -683, 65  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1452, 569  ,  -19, -26  ,  1259, 474  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -904, 1663  ,  2465, 997  ,  -915, 1704  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -777, 509  ,  2381, 979  ,  2465, 997  ,  -788, 547  }
                    }
                    
                    
                    
		}
		,
		["2"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -853, -1268  ,  -937, -1346  ,  -861, -1327  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -788, -369  ,  -801, -396  ,  -807, -420  ,  -765, -437  ,  -766, -404  ,  -775, -373  ,  -779, -369  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -821, -442  ,  -829, -539  ,  -753, -637  ,  -749, -547  ,  -754, -481  ,  -765, -437  ,  -807, -420  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -864, -602  ,  -879, -634  ,  -759, -660  ,  -753, -637  ,  -829, -539  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -879, -634  ,  -864, -602  ,  -872, -610  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -936, -692  ,  -976, -748  ,  -759, -660  ,  -879, -634  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2772, -2142  ,  -2738, -2165  ,  -2725, -1759  ,  -2760, -1800  ,  -2812, -1895  ,  -2830, -1964  ,  -2828, -2055  ,  -2806, -2103  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -835, -1220  ,  -798, -1093  ,  -971, -1351  ,  -937, -1346  ,  -853, -1268  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2552, -2153  ,  -2717, -2174  ,  -2682, -2182  ,  -2647, -2185  ,  -2591, -2174  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2828, -2055  ,  -2830, -1964  ,  -2835, -2014  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1977, -1844  ,  -2047, -1880  ,  -2010, -1866  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -798, -1093  ,  -835, -1220  ,  -814, -1185  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -971, -1351  ,  -798, -1093  ,  -1050, -1371  ,  -1008, -1365  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -798, -1093  ,  -783, -1031  ,  -787, -950  ,  -1146, -1395  ,  -1050, -1371  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1188, -1416  ,  -779, -717  ,  -1262, -1454  ,  -1221, -1438  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2209, -1955  ,  -765, -666  ,  -2280, -1995  ,  -2243, -1979  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2137, -1393  ,  -2316, -1524  ,  -2738, -2165  ,  -2367, -2056  ,  -1851, -1278  ,  -1930, -1304  ,  -2106, -1372  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1690, -1673  ,  -1755, -1713  ,  -1718, -1695  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1851, -1278  ,  -2367, -2056  ,  -1725, -1177  ,  -1771, -1200  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1647, -1126  ,  -2367, -2056  ,  -2347, -2038  ,  -1324, -949  ,  -1592, -1086  ,  -1624, -1105  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -783, -1031  ,  -798, -1093  ,  -785, -1055  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2738, -2165  ,  -2583, -1670  ,  -2642, -1694  ,  -2679, -1719  ,  -2725, -1759  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2197, -1423  ,  -2316, -1524  ,  -2137, -1393  ,  -2178, -1409  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1893, -1789  ,  -1977, -1844  ,  -1941, -1827  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2281, -1477  ,  -2316, -1524  ,  -2197, -1423  ,  -2230, -1437  ,  -2254, -1452  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1081, -798  ,  -976, -748  ,  -1027, -764  ,  -1053, -777  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2563, -1649  ,  -2583, -1670  ,  -2738, -2165  ,  -2433, -1586  ,  -2520, -1620  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2431, -2098  ,  -2367, -2056  ,  -2738, -2165  ,  -2717, -2174  ,  -2552, -2153  ,  -2486, -2129  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1467, -1005  ,  -1563, -1060  ,  -1592, -1086  ,  -1360, -967  ,  -1406, -978  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1755, -1713  ,  -1844, -1758  ,  -1806, -1746  ,  -1784, -1735  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1350, -1499  ,  -779, -717  ,  -1690, -1673  ,  -1650, -1660  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2433, -1586  ,  -2738, -2165  ,  -2316, -1524  ,  -2374, -1549  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -779, -868  ,  -779, -717  ,  -1188, -1416  ,  -1146, -1395  ,  -787, -950  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1547, -1616  ,  -1456, -1567  ,  -1350, -1499  ,  -1614, -1642  ,  -1581, -1632  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2072, -1358  ,  -1930, -1304  ,  -1981, -1314  ,  -2012, -1324  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -765, -666  ,  -2209, -1955  ,  -1690, -1673  ,  -779, -717  ,  -774, -709  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2280, -1995  ,  -765, -666  ,  -759, -660  ,  -1324, -949  ,  -2347, -2038  ,  -2327, -2029  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1930, -1304  ,  -1851, -1278  ,  -1895, -1290  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2047, -1880  ,  -2209, -1955  ,  -2097, -1910  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1893, -1789  ,  -2209, -1955  ,  -2047, -1880  ,  -1977, -1844  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1690, -1673  ,  -1844, -1758  ,  -1755, -1713  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -779, -717  ,  -1350, -1499  ,  -1262, -1454  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1324, -949  ,  -759, -660  ,  -976, -748  ,  -1149, -833  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2367, -2056  ,  -1647, -1126  ,  -1725, -1177  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1844, -1758  ,  -2209, -1955  ,  -1893, -1789  }
                    }
                    
                    
                    
                     ,
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3634, -964  ,  -3551, -729  ,  -3632, -836  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3536, -1729  ,  -3413, -1614  ,  -3590, -1688  ,  -3568, -1739  ,  -3555, -1741  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1141, 1950  ,  -1332, 1952  ,  -3493, -620  ,  -3634, -964  ,  -2761, -1205  ,  -807, 1669  ,  -945, 1869  ,  -1055, 1945  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3413, -1614  ,  -3286, -1529  ,  -3622, -1629  ,  -3617, -1652  ,  -3590, -1688  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3657, -1514  ,  -3286, -1529  ,  -3670, -1273  ,  -3686, -1342  ,  -3693, -1399  ,  -3694, -1443  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2314, -915  ,  -2370, -954  ,  -2326, -933  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -890, 1843  ,  -945, 1869  ,  -807, 1669  ,  -827, 1750  ,  -845, 1800  ,  -861, 1821  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -483, 545  ,  -494, 570  ,  -513, 600  ,  -677, 290  ,  -494, 387  ,  -482, 413  ,  -472, 469  ,  -473, 507  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -534, 338  ,  -514, 358  ,  -494, 387  ,  -677, 290  ,  -618, 298  ,  -581, 309  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -807, 1669  ,  -2761, -1205  ,  -2080, -609  ,  -2054, -582  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2120, -667  ,  -2466, -1011  ,  -2418, -986  ,  -2314, -915  ,  -2236, -844  ,  -2180, -775  ,  -2139, -716  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -590, 722  ,  -778, 264  ,  -703, 280  ,  -677, 290  ,  -561, 650  ,  -573, 691  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3654, -1123  ,  -3286, -1529  ,  -3252, -1495  ,  -3639, -996  ,  -3652, -1037  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2080, -609  ,  -2623, -1111  ,  -2574, -1084  ,  -2546, -1060  ,  -2120, -667  ,  -2103, -650  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2998, -1336  ,  -3639, -996  ,  -3088, -1387  ,  -3037, -1364  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2466, -1011  ,  -2120, -667  ,  -2546, -1060  ,  -2498, -1036  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -650, 874  ,  -671, 911  ,  -706, 961  ,  -1431, 29  ,  -601, 735  ,  -614, 793  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1253, 92  ,  -590, 722  ,  -1347, 60  ,  -1302, 71  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1121, 135  ,  -590, 722  ,  -1253, 92  ,  -1180, 110  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -801, 1617  ,  -1703, -197  ,  -782, 1352  ,  -782, 1539  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -561, 650  ,  -677, 290  ,  -513, 600  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1871, -387  ,  -2008, -526  ,  -1946, -477  ,  -1913, -445  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3286, -1529  ,  -3657, -1514  ,  -3637, -1598  ,  -3622, -1629  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3286, -1529  ,  -3661, -1203  ,  -3670, -1273  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3286, -1529  ,  -3654, -1123  ,  -3661, -1203  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1766, -268  ,  -1871, -387  ,  -1805, -321  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1617, -130  ,  -1561, -63  ,  -779, 1301  ,  -782, 1352  ,  -1703, -197  ,  -1659, -167  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3191, -1451  ,  -3639, -996  ,  -3252, -1495  ,  -3223, -1477  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3131, -1418  ,  -3088, -1387  ,  -3639, -996  ,  -3191, -1451  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2868, -1270  ,  -2804, -1234  ,  -2761, -1205  ,  -3634, -964  ,  -3639, -996  ,  -2998, -1336  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -771, 1237  ,  -1431, 29  ,  -752, 1121  ,  -760, 1195  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -590, 722  ,  -834, 247  ,  -778, 264  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -590, 722  ,  -1121, 135  ,  -997, 174  ,  -834, 247  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3634, -964  ,  -3493, -620  ,  -3551, -729  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1703, -197  ,  -801, 1617  ,  -807, 1669  ,  -1766, -268  ,  -1716, -216  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2648, -1133  ,  -2080, -609  ,  -2761, -1205  ,  -2742, -1197  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -590, 722  ,  -601, 735  ,  -1431, 29  ,  -1347, 60  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1766, -268  ,  -807, 1669  ,  -2040, -558  ,  -1871, -387  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -738, 1057  ,  -1431, 29  ,  -706, 961  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -752, 1121  ,  -1431, 29  ,  -738, 1057  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -779, 1301  ,  -1493, -9  ,  -1431, 29  ,  -771, 1237  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -779, 1301  ,  -1561, -63  ,  -1493, -9  }
                    }
                    
                    
                    
                     ,
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1102, 667  ,  1100, 648  ,  1165, 604  ,  1130, 670  ,  1121, 678  ,  1109, 680  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   566, 183  ,  345, 66  ,  586, 176  ,  579, 185  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   138, 185  ,  137, 157  ,  162, 149  ,  152, 185  ,  141, 190  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   130, 148  ,  123, 115  ,  165, 28  ,  162, 149  ,  137, 157  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   106, 68  ,  103, 25  ,  179, -7  ,  165, 28  ,  123, 115  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1062, 597  ,  1051, 572  ,  1165, 604  ,  1100, 648  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   428, 348  ,  421, 309  ,  468, 319  ,  455, 373  ,  445, 378  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   421, 309  ,  412, 285  ,  407, 237  ,  484, 291  ,  468, 319  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   407, 237  ,  389, 164  ,  516, 242  ,  484, 291  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   389, 164  ,  380, 152  ,  368, 112  ,  559, 187  ,  516, 242  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1616, 942  ,  1615, 863  ,  1731, 900  ,  1685, 955  ,  1679, 958  ,  1631, 959  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -249, -969  ,  -265, -889  ,  -267, -983  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -212, -950  ,  -182, -923  ,  -240, -832  ,  -265, -889  ,  -249, -969  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -182, -923  ,  -156, -906  ,  -129, -880  ,  -185, -693  ,  -217, -757  ,  -240, -832  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   990, 483  ,  1226, 561  ,  1209, 580  ,  1165, 604  ,  1051, 572  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -164, -565  ,  246, -702  ,  378, -629  ,  -132, -395  ,  -164, -459  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   756, 491  ,  753, 407  ,  832, 509  ,  789, 510  ,  761, 500  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   735, 317  ,  888, 354  ,  878, 411  ,  865, 443  ,  832, 509  ,  753, 407  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   832, 509  ,  865, 443  ,  858, 492  ,  848, 502  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1226, 561  ,  990, 483  ,  982, 465  ,  1253, 535  ,  1242, 550  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   304, -670  ,  246, -702  ,  274, -693  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   992, -376  ,  248, 12  ,  189, -17  ,  -39, -208  ,  -51, -238  ,  859, -438  ,  965, -406  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   724, 264  ,  888, 354  ,  735, 317  ,  726, 295  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   345, 66  ,  566, 183  ,  559, 187  ,  368, 112  ,  354, 92  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3511, 693  ,  3578, 799  ,  3594, 882  ,  3584, 989  ,  3286, 1341  ,  3304, 627  ,  3345, 630  ,  3440, 653  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   246, -702  ,  -173, -650  ,  -185, -693  ,  153, -745  ,  203, -729  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -93, -859  ,  -185, -693  ,  -129, -880  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   7, -809  ,  -185, -693  ,  -93, -859  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   69, -787  ,  153, -745  ,  -185, -693  ,  7, -809  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   60, -20  ,  44, -106  ,  189, -17  ,  179, -7  ,  103, 25  ,  93, 21  ,  77, 7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1540, 778  ,  1499, 733  ,  1478, 629  ,  2747, 565  ,  1817, 838  ,  1801, 839  ,  1574, 805  ,  1558, 796  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3578, 799  ,  3511, 693  ,  3548, 730  ,  3567, 763  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3584, 989  ,  3594, 882  ,  3595, 940  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2749, 1410  ,  2714, 1394  ,  2599, 1323  ,  2555, 1286  ,  3258, 1361  ,  2826, 1420  ,  2784, 1419  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1478, 629  ,  1499, 733  ,  1489, 717  ,  1479, 680  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   246, -702  ,  -164, -565  ,  -173, -650  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   530, -567  ,  -132, -395  ,  378, -629  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   692, -517  ,  773, -475  ,  -51, -238  ,  -96, -320  ,  -132, -395  ,  530, -567  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1885, 51  ,  1914, 71  ,  1809, 22  ,  1850, 33  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3286, 1341  ,  3584, 989  ,  3586, 1064  ,  3573, 1106  ,  3408, 1286  ,  3372, 1312  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   248, 12  ,  992, -376  ,  1004, -370  ,  341, 62  ,  321, 61  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -132, -395  ,  -96, -320  ,  -119, -358  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2720, 560  ,  2569, 514  ,  2635, 525  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2569, 514  ,  615, 184  ,  2534, 500  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3101, 632  ,  3286, 1341  ,  2933, 608  ,  2981, 609  ,  3046, 616  ,  3076, 622  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1185, -281  ,  341, 62  ,  1004, -370  ,  1099, -333  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1976, 100  ,  2011, 132  ,  1914, 71  ,  1952, 85  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3507, 1215  ,  3466, 1254  ,  3431, 1277  ,  3408, 1286  ,  3573, 1106  ,  3536, 1180  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -39, -208  ,  189, -17  ,  44, -106  ,  14, -131  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2410, 1154  ,  2747, 565  ,  3258, 1361  ,  2452, 1190  ,  2434, 1178  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3113, 1422  ,  3069, 1427  ,  2937, 1427  ,  2865, 1415  ,  3258, 1361  ,  3166, 1408  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3586, 1064  ,  3584, 989  ,  3589, 1039  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2473, 1218  ,  2452, 1190  ,  3258, 1361  ,  2555, 1286  ,  2523, 1266  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1574, 805  ,  1801, 839  ,  1731, 900  ,  1615, 863  ,  1588, 830  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1278, -237  ,  2249, 372  ,  2303, 413  ,  341, 62  ,  1185, -281  ,  1221, -269  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1731, 900  ,  1801, 839  ,  1762, 878  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2127, 214  ,  2249, 372  ,  1447, -160  ,  2011, 132  ,  2069, 167  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -96, -320  ,  -51, -238  ,  -84, -290  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   859, -438  ,  -51, -238  ,  773, -475  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2011, 132  ,  1809, 22  ,  1914, 71  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2249, 372  ,  2127, 214  ,  2175, 263  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2068, 975  ,  2747, 565  ,  2209, 1038  ,  2163, 1023  ,  2112, 1001  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3286, 1341  ,  3142, 633  ,  3177, 628  ,  3304, 627  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   943, 404  ,  1253, 535  ,  982, 465  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1286, 545  ,  2747, 565  ,  1410, 598  ,  1344, 574  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2827, 596  ,  3286, 1341  ,  3258, 1361  ,  2747, 565  ,  2799, 582  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2460, 472  ,  2493, 492  ,  615, 184  ,  345, 66  ,  341, 62  ,  2303, 413  ,  2371, 433  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1817, 838  ,  2747, 565  ,  1973, 927  ,  1907, 897  ,  1859, 869  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2317, 1087  ,  2747, 565  ,  2410, 1154  ,  2351, 1116  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   917, 372  ,  2747, 565  ,  1286, 545  ,  1253, 535  ,  943, 404  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1973, 927  ,  2747, 565  ,  2068, 975  ,  2036, 963  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1554, -107  ,  1447, -160  ,  1523, -127  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   719, 250  ,  888, 354  ,  724, 264  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3286, 1341  ,  3101, 632  ,  3142, 633  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3286, 1341  ,  2827, 596  ,  2933, 608  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   685, 215  ,  2747, 565  ,  888, 354  ,  719, 250  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1809, 22  ,  1735, -17  ,  1782, 5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1735, -17  ,  1554, -107  ,  1692, -46  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1447, -160  ,  2249, 372  ,  1278, -237  ,  1304, -229  ,  1384, -194  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2209, 1038  ,  2747, 565  ,  2317, 1087  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1410, 598  ,  2747, 565  ,  1478, 629  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   345, 66  ,  615, 184  ,  586, 176  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   888, 354  ,  2747, 565  ,  917, 372  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   615, 184  ,  2747, 565  ,  685, 215  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2720, 560  ,  615, 184  ,  2569, 514  }
                    }
                    
                    
                    
                     ,
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3568, 2121  ,  3519, 2182  ,  3445, 2200  ,  3471, 1924  ,  3520, 1947  ,  3559, 1980  ,  3586, 2019  ,  3601, 2062  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   93, 619  ,  210, 656  ,  -90, 676  ,  -30, 622  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3519, 2182  ,  3568, 2121  ,  3556, 2155  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3445, 2200  ,  3519, 2182  ,  3491, 2197  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -218, 1605  ,  8, 1950  ,  -158, 1818  ,  -217, 1736  ,  -229, 1686  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3403, 2211  ,  3349, 1915  ,  3435, 1917  ,  3471, 1924  ,  3445, 2200  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   457, 726  ,  -182, 1297  ,  -180, 1132  ,  -165, 980  ,  -119, 722  ,  -90, 676  ,  210, 656  ,  357, 677  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3403, 2211  ,  60, 1981  ,  3277, 1903  ,  3349, 1915  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1801, 1370  ,  1724, 1329  ,  1764, 1345  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1434, 1182  ,  60, 1981  ,  1285, 1114  ,  1359, 1139  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -119, 722  ,  -165, 980  ,  -163, 862  ,  -153, 805  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   537, 758  ,  60, 1981  ,  8, 1950  ,  -197, 1413  ,  -182, 1297  ,  457, 726  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -120, 1876  ,  -138, 1854  ,  -158, 1818  ,  8, 1950  ,  -90, 1903  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2957, 1875  ,  60, 1981  ,  2857, 1845  ,  2921, 1859  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -218, 1536  ,  -197, 1413  ,  8, 1950  ,  -218, 1605  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2690, 1792  ,  60, 1981  ,  2580, 1753  ,  2649, 1772  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2371, 1683  ,  60, 1981  ,  2245, 1637  ,  2295, 1649  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1625, 1279  ,  60, 1981  ,  1434, 1182  ,  1489, 1201  ,  1567, 1239  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3054, 1902  ,  60, 1981  ,  2957, 1875  ,  3002, 1884  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1880, 1418  ,  1801, 1370  ,  1856, 1399  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   685, 816  ,  60, 1981  ,  537, 758  ,  578, 769  ,  634, 790  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2580, 1753  ,  60, 1981  ,  2371, 1683  ,  2422, 1692  ,  2514, 1722  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   874, 898  ,  60, 1981  ,  685, 816  ,  712, 823  ,  842, 877  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2118, 1568  ,  60, 1981  ,  1880, 1418  ,  1913, 1432  ,  2013, 1490  ,  2052, 1515  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1001, 964  ,  60, 1981  ,  874, 898  ,  969, 943  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1880, 1418  ,  60, 1981  ,  1625, 1279  ,  1649, 1288  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1880, 1418  ,  1724, 1329  ,  1801, 1370  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1045, 986  ,  1179, 1068  ,  60, 1981  ,  1001, 964  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1285, 1114  ,  60, 1981  ,  1179, 1068  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2156, 1592  ,  60, 1981  ,  2118, 1568  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2245, 1637  ,  60, 1981  ,  2156, 1592  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2857, 1845  ,  60, 1981  ,  2690, 1792  }
                    }
                    
                    
                    
		}
		,
		["3"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1269, -603  ,  -1308, -607  ,  -1287, -636  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1627, -590  ,  -1630, -574  ,  -1668, -578  ,  -1653, -599  ,  -1629, -623  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   37, 243  ,  24, 255  ,  -16, 276  ,  21, 228  ,  42, 229  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   193, 91  ,  205, 58  ,  225, 68  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1350, -689  ,  -1546, -684  ,  -1510, -744  ,  -1439, -813  ,  -1353, -782  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3089, 1789  ,  3081, 1814  ,  3071, 1764  ,  3087, 1747  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3731, -1338  ,  -3683, -1322  ,  -3731, -1310  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2124, -1113  ,  -2617, -1044  ,  -2263, -1208  ,  -2180, -1184  ,  -2124, -1162  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -812, -479  ,  -857, -527  ,  -818, -515  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   21, 228  ,  31, 191  ,  86, 187  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2640, -1228  ,  -2632, -1111  ,  -2746, -1366  ,  -2658, -1328  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3739, -1405  ,  -3732, -1453  ,  -3705, -1514  ,  -3661, -1564  ,  -3623, -1589  ,  -3586, -1605  ,  -3683, -1322  ,  -3731, -1338  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -723, -426  ,  -777, -459  ,  -725, -453  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1439, -813  ,  -1510, -744  ,  -1479, -821  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3102, 1510  ,  2963, 1399  ,  3112, 1440  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1308, -607  ,  -1630, -574  ,  -1618, -582  ,  -1331, -629  ,  -1316, -625  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   193, 91  ,  112, 128  ,  144, 16  ,  205, 58  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1727, -875  ,  -1879, -1028  ,  -1778, -970  ,  -1731, -928  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2495, -1274  ,  -2565, -1213  ,  -2560, -1243  ,  -2548, -1271  ,  -2535, -1286  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -543, -384  ,  -493, -344  ,  -677, -389  ,  -648, -405  ,  -593, -411  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   376, 133  ,  257, 185  ,  336, 127  ,  353, 122  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3098, 1595  ,  2826, 1378  ,  2963, 1399  ,  3102, 1510  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2388, -1253  ,  -2339, -1233  ,  -2566, -1175  ,  -2565, -1213  ,  -2495, -1274  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   31, 191  ,  76, 151  ,  110, 152  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   112, 128  ,  76, 151  ,  114, -10  ,  144, 16  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1703, -738  ,  -1701, -663  ,  -2045, -1094  ,  -1905, -1049  ,  -1879, -1028  ,  -1727, -875  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1344, -641  ,  -1588, -618  ,  -1570, -653  ,  -1546, -684  ,  -1350, -689  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2090, -1148  ,  -2088, -1127  ,  -2108, -1129  ,  -2095, -1151  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2088, -1127  ,  -2055, -1091  ,  -2124, -1113  ,  -2108, -1129  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1195, -692  ,  -1245, -656  ,  -1238, -715  ,  -1233, -725  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1161, -672  ,  -1132, -649  ,  -1269, -603  ,  -1245, -656  ,  -1195, -692  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1064, -615  ,  -1269, -603  ,  -1132, -649  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1993, -1104  ,  -1905, -1049  ,  -2045, -1094  ,  -2031, -1113  ,  -2023, -1118  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -714, -393  ,  -799, -467  ,  -777, -459  ,  -723, -426  ,  -716, -417  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2057, -1130  ,  -2055, -1091  ,  -2088, -1127  ,  -2060, -1135  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1676, -576  ,  -1694, -647  ,  -1680, -629  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -812, -479  ,  -1630, -574  ,  -1308, -607  ,  -955, -567  ,  -910, -554  ,  -857, -527  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   31, 191  ,  89, -26  ,  114, -10  ,  76, 151  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -16, 276  ,  -96, 333  ,  -162, -178  ,  -87, -152  ,  -43, -129  ,  -7, -100  ,  31, 191  ,  21, 228  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   31, 191  ,  -7, -100  ,  39, -72  ,  89, -26  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3219, 1487  ,  3170, 1777  ,  3165, 1648  ,  3167, 1620  ,  3180, 1558  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   417, 138  ,  452, 147  ,  543, 181  ,  600, 219  ,  213, 222  ,  257, 185  ,  376, 133  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1344, -641  ,  -1331, -629  ,  -1618, -582  ,  -1588, -618  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3525, 2090  ,  3423, 2131  ,  3647, 1770  ,  3650, 1867  ,  3646, 1917  ,  3632, 1968  ,  3602, 2022  ,  3565, 2063  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -994, -589  ,  -955, -567  ,  -1269, -603  ,  -1064, -615  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3586, -1605  ,  -3659, -1014  ,  -3677, -1074  ,  -3682, -1113  ,  -3683, -1322  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2339, -1233  ,  -2303, -1225  ,  -2263, -1208  ,  -2617, -1044  ,  -2585, -1141  ,  -2566, -1175  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3390, -1590  ,  -3316, -1563  ,  -3638, -912  ,  -3659, -1014  ,  -3586, -1605  ,  -3556, -1611  ,  -3494, -1614  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3621, 1691  ,  3634, 1719  ,  3647, 1770  ,  3423, 2131  ,  3485, 1586  ,  3519, 1598  ,  3551, 1616  ,  3586, 1645  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3066, 1940  ,  2469, 1268  ,  3071, 1764  ,  3081, 1814  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3169, -1563  ,  -3078, -1529  ,  -3001, -1493  ,  -3215, -1541  ,  -3181, -1561  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3641, 1347  ,  -3625, 1240  ,  2197, 2127  ,  718, 2127  ,  -3640, 1726  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3068, 2130  ,  3061, 2056  ,  3067, 2046  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2469, 1268  ,  3066, 1940  ,  3061, 2056  ,  2395, 1241  ,  2435, 1252  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -54, 310  ,  -96, 333  ,  -16, 276  ,  -36, 297  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2632, -1111  ,  -2617, -1044  ,  -2825, -1408  ,  -2782, -1388  ,  -2746, -1366  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   732, 275  ,  106, 297  ,  172, 247  ,  213, 222  ,  600, 219  ,  679, 246  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3082, 1670  ,  2469, 1268  ,  3094, 1605  ,  3089, 1650  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3423, 2131  ,  3379, 2141  ,  3290, 2144  ,  3317, 1518  ,  3390, 1539  ,  3437, 1558  ,  3485, 1586  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3216, 2153  ,  3168, 1908  ,  3219, 1487  ,  3223, 1485  ,  3275, 1500  ,  3317, 1518  ,  3290, 2144  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   957, 384  ,  44, 335  ,  106, 297  ,  814, 315  ,  882, 341  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1917, 1026  ,  3068, 2130  ,  2693, 2145  ,  2447, 2137  ,  -3600, 249  ,  -129, 430  ,  1850, 982  ,  1889, 1004  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2669, 1323  ,  3098, 1595  ,  3094, 1605  ,  2469, 1268  ,  2618, 1299  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1706, 829  ,  1758, 899  ,  -129, 430  ,  -74, 408  ,  1340, 586  ,  1380, 600  ,  1433, 628  ,  1621, 749  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -799, -467  ,  -96, 333  ,  -1676, -576  ,  -1668, -578  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2617, -1044  ,  -2632, -1111  ,  -2626, -1099  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2001, 1074  ,  3068, 2130  ,  1917, 1026  ,  1958, 1046  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -162, -178  ,  -96, 333  ,  -225, -209  ,  -180, -190  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -96, 333  ,  -387, -287  ,  -320, -260  ,  -225, -209  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -96, 333  ,  -714, -393  ,  -677, -389  ,  -458, -322  ,  -387, -287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -458, -322  ,  -677, -389  ,  -493, -344  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3617, 1131  ,  2197, 2127  ,  -3625, 1240  ,  -3624, 1179  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1758, 899  ,  1706, 829  ,  1731, 858  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   814, 315  ,  106, 297  ,  732, 275  ,  782, 296  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2240, 1178  ,  3061, 2056  ,  3068, 2130  ,  2096, 1116  ,  2189, 1150  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3659, -1014  ,  -3638, -912  ,  -3651, -960  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2055, -1091  ,  -1676, -576  ,  -2617, -1044  ,  -2124, -1113  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3221, -1541  ,  -3624, -832  ,  -3638, -912  ,  -3316, -1563  ,  -3253, -1552  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2096, 1116  ,  3068, 2130  ,  2001, 1074  ,  2041, 1088  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2826, 1378  ,  3098, 1595  ,  2669, 1323  ,  2765, 1351  ,  2807, 1367  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2395, 1241  ,  3061, 2056  ,  2240, 1178  ,  2316, 1204  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2862, -1433  ,  -2825, -1408  ,  -2617, -1044  ,  -3600, 249  ,  -3221, -1541  ,  -3215, -1541  ,  -3001, -1493  ,  -2945, -1474  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3600, 249  ,  2447, 2137  ,  2293, 2136  ,  2197, 2127  ,  -3617, 1131  ,  -3616, 337  ,  -3610, 291  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3219, 1487  ,  3168, 1908  ,  3170, 1777  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3624, -832  ,  -3221, -1541  ,  -3600, -602  ,  -3621, -742  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3583, -378  ,  -3221, -1541  ,  -3574, -257  ,  -3581, -313  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1270, 538  ,  1340, 586  ,  -74, 408  ,  6, 355  ,  44, 335  ,  1068, 431  ,  1111, 445  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3221, -1541  ,  -3583, -378  ,  -3596, -489  ,  -3600, -602  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1068, 431  ,  44, 335  ,  957, 384  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3575, -29  ,  -3221, -1541  ,  -3600, 249  ,  -3589, 51  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3221, -1541  ,  -3575, -29  ,  -3574, -257  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1676, -576  ,  -2055, -1091  ,  -2045, -1094  ,  -1701, -663  ,  -1694, -647  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2447, 2137  ,  2693, 2145  ,  2503, 2144  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3168, 1908  ,  3216, 2153  ,  3080, 2118  ,  3134, 1979  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -96, 333  ,  -799, -467  ,  -714, -393  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2693, 2145  ,  3068, 2130  ,  3216, 2153  ,  2759, 2153  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3071, 1764  ,  2469, 1268  ,  3082, 1670  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1798, 939  ,  -129, 430  ,  1758, 899  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1850, 982  ,  -129, 430  ,  1798, 939  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -799, -467  ,  -1630, -574  ,  -812, -479  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -96, 333  ,  -103, 345  ,  -3600, 249  ,  -2617, -1044  ,  -1676, -576  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3216, 2153  ,  3068, 2130  ,  3080, 2118  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3600, 249  ,  -129, 403  ,  -129, 430  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3600, 249  ,  -103, 345  ,  -129, 403  }
                    }
                    
                    
                    
		}
		,
		["4"] = {
                    
                    
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -872, -542  ,  -773, -544  ,  -723, -535  ,  -1115, -400  ,  -1064, -458  ,  -1031, -485  ,  -997, -506  ,  -934, -532  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -546, -508  ,  -1158, -320  ,  -1133, -372  ,  -1115, -400  ,  -723, -535  ,  -637, -530  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3167, -1651  ,  -3128, -1587  ,  -3073, -1464  ,  -3183, -1329  ,  -3190, -1675  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3036, -1382  ,  -3183, -1329  ,  -3073, -1464  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2987, -1301  ,  -3183, -1329  ,  -3036, -1382  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2952, -1251  ,  -3183, -1329  ,  -2987, -1301  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2861, -1127  ,  -3183, -1329  ,  -2952, -1251  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1683, 420  ,  -3183, -1329  ,  -2861, -1127  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -546, -508  ,  -502, -493  ,  -1190, -269  ,  -1158, -320  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1683, 420  ,  -1190, -269  ,  -502, -493  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2643, -883  ,  -1683, 420  ,  -2772, -1015  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2021, -384  ,  -1683, 420  ,  -2643, -883  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1916, -316  ,  -1683, 420  ,  -2021, -384  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1776, -230  ,  -1683, 420  ,  -1916, -316  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1632, -162  ,  -1683, 420  ,  -1776, -230  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1583, -145  ,  -1683, 420  ,  -1632, -162  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1508, -127  ,  -1683, 420  ,  -1583, -145  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1438, -124  ,  -1683, 420  ,  -1508, -127  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1391, -127  ,  -1683, 420  ,  -1438, -124  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1354, -135  ,  -1683, 420  ,  -1391, -127  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1315, -155  ,  -1683, 420  ,  -1354, -135  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1281, -175  ,  -1683, 420  ,  -1315, -155  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1251, -196  ,  -1683, 420  ,  -1281, -175  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1228, -219  ,  -1683, 420  ,  -1251, -196  }
                    }
                    
                    
                    
                     ,
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -382, -436  ,  -311, -380  ,  -491, -372  ,  -470, -426  ,  -426, -461  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3508, -1764  ,  -3335, -1744  ,  -3249, -1718  ,  -3310, -1289  ,  -3625, -1550  ,  -3668, -1635  ,  -3648, -1717  ,  -3588, -1766  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -311, -380  ,  -248, -342  ,  -189, -293  ,  -124, -225  ,  -66, -143  ,  -518, -326  ,  -491, -372  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -719, 273  ,  -688, 176  ,  -685, 231  ,  -699, 258  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -538, -280  ,  -584, -102  ,  -563, -241  ,  -554, -264  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -715, 371  ,  -730, 387  ,  -1740, 591  ,  -721, 298  ,  -712, 314  ,  -707, 353  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3612, -1426  ,  -3310, -1289  ,  -3611, -1303  ,  -3622, -1364  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2656, 1061  ,  3226, 2192  ,  2596, 1044  ,  2636, 1049  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -584, -102  ,  55, -2  ,  -601, -42  ,  -596, -79  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3310, -1289  ,  -3249, -1718  ,  -3197, -1681  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3536, 482  ,  -1740, 591  ,  -3521, 627  ,  -3539, 554  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3589, -122  ,  -3577, -203  ,  -3575, -46  ,  -3589, -89  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   55, -2  ,  -584, -102  ,  -518, -326  ,  -66, -143  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -660, 11  ,  -606, -221  ,  -643, -33  ,  -650, -5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -719, 273  ,  -1740, 591  ,  -683, 83  ,  -688, 176  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3648, -1717  ,  -3668, -1635  ,  -3662, -1679  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3535, 1434  ,  -3517, 1600  ,  -3553, 1522  ,  -3556, 1501  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3385, 2107  ,  3336, 2149  ,  3288, 2175  ,  3226, 2192  ,  3461, 1917  ,  3458, 1952  ,  3446, 2003  ,  3419, 2062  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -657, 300  ,  602, 336  ,  -676, 357  ,  -669, 326  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3612, -1088  ,  -3611, -1303  ,  -3310, -1289  ,  -1740, 591  ,  -3576, -931  ,  -3610, -1032  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -621, -99  ,  -606, -221  ,  -609, -115  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3413, 1676  ,  3226, 2192  ,  2933, 1199  ,  2992, 1226  ,  3286, 1433  ,  3352, 1521  ,  3388, 1591  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2758, 1096  ,  2933, 1199  ,  3226, 2192  ,  2656, 1061  ,  2708, 1074  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3456, 1793  ,  3460, 1829  ,  3461, 1917  ,  3226, 2192  ,  3413, 1676  ,  3445, 1745  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2933, 1199  ,  2854, 1152  ,  2889, 1168  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2596, 1044  ,  3226, 2192  ,  2209, 982  ,  2395, 996  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1228, 659  ,  -702, 448  ,  1115, 599  ,  1185, 630  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3226, 2192  ,  3288, 2175  ,  3261, 2185  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -676, 357  ,  602, 336  ,  649, 352  ,  950, 506  ,  1115, 599  ,  -702, 448  ,  -691, 396  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -683, 83  ,  -1740, 591  ,  -606, -221  ,  -673, 64  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -643, -33  ,  -606, -221  ,  -621, -99  ,  -635, -45  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3187, 1338  ,  3249, 1391  ,  3286, 1433  ,  3037, 1256  ,  3119, 1294  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -606, -221  ,  -1740, 591  ,  -563, -351  ,  -572, -305  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3527, 1369  ,  -3492, 1681  ,  -3506, 1645  ,  -3517, 1600  ,  -3535, 1434  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   447, 249  ,  -653, 268  ,  214, 119  ,  253, 130  ,  346, 171  ,  390, 199  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3612, -1212  ,  -3612, -1088  ,  -3619, -1139  ,  -3620, -1160  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3668, -1635  ,  -3625, -1550  ,  -3665, -1619  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3310, -1289  ,  -3613, -1506  ,  -3625, -1550  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3310, -1289  ,  -3612, -1426  ,  -3613, -1506  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -622, 25  ,  -633, 181  ,  -631, 38  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3576, -335  ,  -3571, -383  ,  -1740, 591  ,  -3559, 68  ,  -3575, -46  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1575, 812  ,  1647, 848  ,  3226, 2192  ,  3201, 2195  ,  -717, 472  ,  -702, 448  ,  1501, 785  ,  1527, 792  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3532, 995  ,  -1740, 591  ,  -732, 471  ,  -717, 472  ,  3201, 2195  ,  -3467, 1783  ,  -3492, 1681  ,  -3527, 1369  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -543, -404  ,  -1740, 591  ,  -502, -493  ,  -504, -480  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -601, -42  ,  55, -2  ,  -633, 181  ,  -621, 14  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   950, 506  ,  649, 352  ,  821, 432  ,  897, 472  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1845, 913  ,  3226, 2192  ,  1647, 848  ,  1704, 861  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3226, 2192  ,  2112, 967  ,  2209, 982  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3226, 2192  ,  1845, 913  ,  2112, 967  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -524, -306  ,  -584, -102  ,  -538, -280  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3559, 68  ,  -1740, 591  ,  -3547, 399  ,  -3558, 372  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   55, -2  ,  79, 23  ,  -653, 268  ,  -633, 181  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   162, 88  ,  -653, 268  ,  79, 23  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   214, 119  ,  -653, 268  ,  162, 88  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   540, 298  ,  602, 336  ,  -657, 300  ,  -653, 268  ,  447, 249  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1501, 785  ,  -702, 448  ,  1351, 717  ,  1394, 733  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3564, -665  ,  -1740, 591  ,  -3571, -383  ,  -3571, -624  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1740, 591  ,  -3563, -853  ,  -3576, -931  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1740, 591  ,  -3564, -665  ,  -3563, -853  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1740, 591  ,  -3539, 435  ,  -3547, 399  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1740, 591  ,  -3536, 482  ,  -3539, 435  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1740, 591  ,  -3517, 667  ,  -3521, 627  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1740, 591  ,  -3517, 899  ,  -3517, 667  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1740, 591  ,  -3522, 953  ,  -3517, 899  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1740, 591  ,  -3532, 995  ,  -3522, 953  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -563, -351  ,  -1740, 591  ,  -543, -404  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -721, 298  ,  -1740, 591  ,  -719, 273  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -732, 471  ,  -1740, 591  ,  -730, 387  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1351, 717  ,  -702, 448  ,  1228, 659  }
                    }
                    
                    
                    
                     ,
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -624, -1143  ,  -651, -1137  ,  -954, -1198  ,  -613, -1187  ,  -612, -1156  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -761, -1084  ,  -841, -1061  ,  -954, -1198  ,  -651, -1137  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -896, -1019  ,  -954, -1198  ,  -841, -1061  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -936, -955  ,  -1455, -289  ,  -954, -1198  ,  -896, -1019  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2552, -1735  ,  -2526, -1630  ,  -2543, -1669  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1410, -150  ,  -1464, -147  ,  -1541, -164  ,  -1580, -182  ,  -1159, -368  ,  -1273, -208  ,  -1307, -185  ,  -1354, -163  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2540, -2142  ,  -2002, -680  ,  -2377, -1178  ,  -2552, -1735  ,  -2596, -1909  ,  -2597, -2027  ,  -2589, -2062  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2275, -955  ,  -2002, -680  ,  -1606, -200  ,  -2222, -825  ,  -2254, -878  ,  -2268, -916  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2077, -562  ,  -2100, -607  ,  -1606, -200  ,  -1843, -331  ,  -1915, -377  ,  -1973, -426  ,  -2028, -485  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1273, -208  ,  -1159, -368  ,  -1217, -266  ,  -1243, -234  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2588, -1841  ,  -2596, -1909  ,  -2552, -1735  ,  -2571, -1773  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1022, -673  ,  -961, -875  ,  -983, -766  ,  -999, -717  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1541, -164  ,  -1464, -147  ,  -1501, -152  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2526, -1630  ,  -2473, -1477  ,  -2486, -1500  ,  -2517, -1581  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1109, -479  ,  -1022, -673  ,  -1032, -636  ,  -1059, -567  ,  -1083, -518  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1606, -200  ,  -1146, -403  ,  -1159, -368  ,  -1580, -182  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1606, -200  ,  -1109, -479  ,  -1146, -403  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2473, -1477  ,  -2377, -1178  ,  -2448, -1369  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2210, -795  ,  -2222, -825  ,  -1606, -200  ,  -2100, -607  ,  -2147, -676  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1751, -278  ,  -1606, -200  ,  -1680, -236  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2552, -1735  ,  -2473, -1477  ,  -2526, -1630  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1109, -479  ,  -1455, -289  ,  -958, -907  ,  -961, -875  ,  -1022, -673  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2358, -1141  ,  -2002, -680  ,  -2275, -955  ,  -2310, -1024  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -958, -907  ,  -1455, -289  ,  -936, -955  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2002, -680  ,  -2358, -1141  ,  -2377, -1178  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 0.05, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1455, -289  ,  -1606, -200  ,  -2002, -680  }
                    }
                    
                    
                    
                     ,
                    
                    
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2555, 270  ,  2875, 399  ,  2647, 400  ,  2605, 394  ,  2578, 386  ,  2514, 325  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -548, -1314  ,  -488, -1207  ,  -528, -1197  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -548, -1314  ,  -392, -1223  ,  -425, -1214  ,  -488, -1207  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2324, 83  ,  2384, 113  ,  2369, 124  ,  2350, 130  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2324, 83  ,  2275, -72  ,  2439, 82  ,  2423, 96  ,  2384, 113  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2688, -47  ,  2560, -2  ,  2275, -72  ,  2256, -112  ,  2741, -90  ,  2716, -62  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2575, 218  ,  2936, -198  ,  3181, 4  ,  3178, 101  ,  3169, 143  ,  2915, 394  ,  2875, 399  ,  2555, 270  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -548, -1314  ,  -560, -1357  ,  -306, -1235  ,  -392, -1223  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2371, -1209  ,  2125, -1376  ,  2184, -1354  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2882, -204  ,  2256, -112  ,  2241, -136  ,  2954, -246  ,  2912, -213  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -560, -1357  ,  -580, -1402  ,  -584, -1566  ,  111, -1235  ,  -306, -1235  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   963, -1866  ,  842, -1904  ,  901, -1894  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1714, -324  ,  1629, -369  ,  1818, -297  ,  1784, -297  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1231, -1765  ,  1125, -1805  ,  1188, -1789  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3060, -319  ,  2936, -198  ,  2947, -220  ,  3040, -357  ,  3051, -342  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   712, -1940  ,  639, -1962  ,  672, -1957  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3012, 358  ,  2959, 383  ,  2915, 394  ,  3169, 143  ,  3151, 192  ,  3098, 279  ,  3063, 320  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -79, -2148  ,  -146, -2175  ,  -119, -2169  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1125, -1805  ,  1061, -1832  ,  1092, -1823  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3185, -22  ,  2936, -198  ,  3060, -319  ,  3076, -297  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2741, -90  ,  2256, -112  ,  2782, -121  ,  2756, -97  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2275, -72  ,  2560, -2  ,  2510, 38  ,  2439, 82  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2940, -519  ,  2871, -644  ,  2914, -581  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2536, -2144  ,  -2437, -2248  ,  -2241, -2333  ,  -2118, -2333  ,  -1941, -2312  ,  -601, -1397  ,  -615, -1191  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2723, -868  ,  2753, -819  ,  2687, -898  ,  2705, -886  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   842, -1904  ,  712, -1940  ,  732, -1939  ,  787, -1927  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918, -1478  ,  2371, -1209  ,  1820, -1518  ,  1875, -1501  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2300, -2325  ,  -2241, -2333  ,  -2437, -2248  ,  -2355, -2305  ,  -2327, -2318  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3132, -217  ,  3157, -172  ,  3169, -140  ,  3175, -111  ,  3185, -22  ,  3090, -264  ,  3113, -242  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2871, -644  ,  2753, -819  ,  2857, -675  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1061, -1832  ,  963, -1866  ,  1022, -1850  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1491, -1645  ,  253, -2047  ,  427, -2004  ,  1454, -1666  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2936, -198  ,  3185, -22  ,  3181, 4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1316, -1726  ,  427, -2004  ,  712, -1940  ,  963, -1866  ,  1283, -1745  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2256, -112  ,  2882, -204  ,  2782, -121  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1433, -1673  ,  427, -2004  ,  1316, -1726  ,  1400, -1694  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1354, -2329  ,  -601, -1397  ,  -1577, -2316  ,  -1440, -2332  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1629, -369  ,  1879, -290  ,  1818, -297  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1879, -290  ,  1629, -369  ,  1608, -385  ,  1462, -514  ,  1421, -565  ,  2047, -261  ,  1970, -269  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1200, -2328  ,  -1146, -2321  ,  -590, -1539  ,  -595, -1409  ,  -601, -1397  ,  -1354, -2329  ,  -1270, -2333  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2125, -1376  ,  2371, -1209  ,  1918, -1478  ,  2011, -1440  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -146, -2175  ,  -234, -2201  ,  -171, -2186  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -693, -2267  ,  -590, -1539  ,  -842, -2278  ,  -759, -2276  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   639, -1962  ,  712, -1940  ,  427, -2004  ,  531, -1989  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -959, -2301  ,  -905, -2287  ,  -590, -1539  ,  -1146, -2321  ,  -1042, -2315  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1782, -2310  ,  -601, -1397  ,  -1941, -2312  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1577, -2316  ,  -601, -1397  ,  -1782, -2310  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2371, -1209  ,  2232, -1317  ,  2288, -1280  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   481, -1137  ,  2387, -1200  ,  701, -1053  ,  617, -1076  ,  566, -1094  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1820, -1518  ,  2371, -1209  ,  1663, -1581  ,  1741, -1554  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -603, -2263  ,  -527, -2245  ,  -584, -1566  ,  -590, -1539  ,  -693, -2267  ,  -638, -2267  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2826, -719  ,  2753, -819  ,  2813, -744  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3040, -357  ,  2954, -246  ,  2143, -225  ,  2070, -255  ,  2940, -519  ,  3026, -392  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -79, -2148  ,  -527, -2245  ,  -234, -2201  ,  -146, -2175  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1663, -1581  ,  2371, -1209  ,  -584, -1566  ,  -527, -2245  ,  253, -2047  ,  1589, -1613  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -584, -1566  ,  233, -1216  ,  111, -1235  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -842, -2278  ,  -590, -1539  ,  -905, -2287  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2208, -174  ,  2954, -246  ,  2241, -136  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2178, -201  ,  2954, -246  ,  2208, -174  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2940, -519  ,  2070, -255  ,  2047, -261  ,  2387, -1200  ,  2687, -898  ,  2753, -819  ,  2871, -644  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   253, -2047  ,  84, -2093  ,  137, -2083  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2143, -225  ,  2954, -246  ,  2178, -201  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   84, -2093  ,  -527, -2245  ,  -79, -2148  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1125, -1805  ,  963, -1866  ,  1061, -1832  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   856, -966  ,  2387, -1200  ,  995, -863  ,  965, -881  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   427, -2004  ,  253, -2047  ,  366, -2022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2510, -1099  ,  2654, -933  ,  2387, -1200  ,  2479, -1128  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1373, -609  ,  2387, -1200  ,  2047, -261  ,  1421, -565  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -584, -1566  ,  2371, -1209  ,  2387, -1200  ,  334, -1192  ,  233, -1216  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2954, -246  ,  3040, -357  ,  2947, -220  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1309, -654  ,  2387, -1200  ,  1373, -609  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1063, -812  ,  995, -863  ,  2387, -1200  ,  1309, -654  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   767, -1022  ,  2387, -1200  ,  856, -966  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   701, -1053  ,  2387, -1200  ,  767, -1022  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   334, -1192  ,  2387, -1200  ,  481, -1137  }
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
