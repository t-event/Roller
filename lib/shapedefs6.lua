-- This file is for use with Corona(R) SDK
--
-- Ground shapes ("1"-"4") generated programmatically 2026-09-15 for the
-- new bane 6 terrain (see TIL-ORJAN.md): each fixture is a trapezoid
-- sampled directly from the same curve the matching level6/N.png ground
-- art was rendered from, so there is no hand-tracing guesswork involved,
-- the shape is mathematically exact for the art it goes with.
-- The "del1" worm-body shape below is copied verbatim from
-- lib/shapedefs4.lua (the worm itself is identical across levels).
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
                    shape = {   -3840.0, -1770.9  ,  -3650.0, -1720.7  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1720.7  ,  -3458.0, -1679.5  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1679.5  ,  -3266.0, -1633.5  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1633.5  ,  -3074.0, -1607.9  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1607.9  ,  -2882.0, -1586.1  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1586.1  ,  -2690.0, -1458.1  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1458.1  ,  -2498.0, -1341.7  ,  -2498.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1341.7  ,  -2306.0, -1247.3  ,  -2306.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -1247.3  ,  -2114.0, -1111.8  ,  -2114.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -1111.8  ,  -1922.0, -964.6  ,  -1922.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -964.6  ,  -1730.0, -837.7  ,  -1730.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -837.7  ,  -1538.0, -705.5  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -705.5  ,  -1346.0, -541.7  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -541.7  ,  -1154.0, -479.6  ,  -1154.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -479.6  ,  -962.0, -471.8  ,  -962.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -471.8  ,  -770.0, -435.0  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -435.0  ,  -578.0, -403.8  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -403.8  ,  -386.0, -343.5  ,  -386.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -343.5  ,  -194.0, -305.6  ,  -194.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -305.6  ,  -2.0, -259.0  ,  -2.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -259.0  ,  190.0, -128.6  ,  190.0, 2351.0  ,  -2.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -128.6  ,  382.0, -0.2  ,  382.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -0.2  ,  574.0, 108.0  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 108.0  ,  766.0, 232.9  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 232.9  ,  958.0, 356.2  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 356.2  ,  1150.0, 457.8  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 457.8  ,  1342.0, 544.2  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 544.2  ,  1534.0, 621.6  ,  1534.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 621.6  ,  1726.0, 672.2  ,  1726.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 672.2  ,  1918.0, 712.8  ,  1918.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, 712.8  ,  2110.0, 727.1  ,  2110.0, 2351.0  ,  1918.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, 727.1  ,  2302.0, 763.3  ,  2302.0, 2351.0  ,  2110.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 763.3  ,  2494.0, 838.7  ,  2494.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 838.7  ,  2686.0, 922.4  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 922.4  ,  2878.0, 1002.4  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1002.4  ,  3070.0, 1074.5  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1074.5  ,  3262.0, 1146.6  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1146.6  ,  3454.0, 1230.8  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1230.8  ,  3646.0, 1316.2  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1316.2  ,  3838.0, 1413.1  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
                    }
		}
		,
		["2"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -1721.5  ,  -3650.0, -1664.2  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1664.2  ,  -3458.0, -1590.9  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1590.9  ,  -3266.0, -1472.3  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1472.3  ,  -3074.0, -1393.8  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1393.8  ,  -2882.0, -1328.0  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1328.0  ,  -2690.0, -1244.0  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1244.0  ,  -2498.0, -1158.4  ,  -2498.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1158.4  ,  -2306.0, -1065.6  ,  -2306.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -1065.6  ,  -2114.0, -1018.1  ,  -2114.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -1018.1  ,  -1922.0, -994.5  ,  -1922.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -994.5  ,  -1730.0, -962.0  ,  -1730.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -962.0  ,  -1538.0, -907.6  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -907.6  ,  -1346.0, -786.5  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -786.5  ,  -1154.0, -718.7  ,  -1154.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -718.7  ,  -962.0, -671.5  ,  -962.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -671.5  ,  -770.0, -547.6  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -547.6  ,  -578.0, -432.8  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -432.8  ,  -386.0, -317.1  ,  -386.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -317.1  ,  -194.0, -220.3  ,  -194.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -220.3  ,  -2.0, -129.4  ,  -2.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -129.4  ,  190.0, -47.3  ,  190.0, 2351.0  ,  -2.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -47.3  ,  382.0, 43.5  ,  382.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, 43.5  ,  574.0, 136.5  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 136.5  ,  766.0, 243.9  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 243.9  ,  958.0, 357.3  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 357.3  ,  1150.0, 426.8  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 426.8  ,  1342.0, 502.0  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 502.0  ,  1534.0, 615.0  ,  1534.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 615.0  ,  1726.0, 754.0  ,  1726.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 754.0  ,  1918.0, 909.3  ,  1918.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, 909.3  ,  2110.0, 1042.6  ,  2110.0, 2351.0  ,  1918.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, 1042.6  ,  2302.0, 1167.3  ,  2302.0, 2351.0  ,  2110.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 1167.3  ,  2494.0, 1257.1  ,  2494.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 1257.1  ,  2686.0, 1342.1  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 1342.1  ,  2878.0, 1418.0  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1418.0  ,  3070.0, 1471.6  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1471.6  ,  3262.0, 1525.8  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1525.8  ,  3454.0, 1627.5  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1627.5  ,  3646.0, 1689.5  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1689.5  ,  3838.0, 1756.1  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
                    }
		}
		,
		["3"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -1620.6  ,  -3650.0, -1550.3  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1550.3  ,  -3458.0, -1507.4  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1507.4  ,  -3266.0, -1504.8  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1504.8  ,  -3074.0, -1471.5  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1471.5  ,  -2882.0, -1414.9  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1414.9  ,  -2690.0, -1363.2  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1363.2  ,  -2498.0, -1287.7  ,  -2498.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1287.7  ,  -2306.0, -1217.6  ,  -2306.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -1217.6  ,  -2114.0, -1148.4  ,  -2114.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -1148.4  ,  -1922.0, -1084.7  ,  -1922.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -1084.7  ,  -1730.0, -978.1  ,  -1730.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -978.1  ,  -1538.0, -886.3  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -886.3  ,  -1346.0, -820.5  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -820.5  ,  -1154.0, -742.1  ,  -1154.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -742.1  ,  -962.0, -635.8  ,  -962.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -635.8  ,  -770.0, -495.9  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -495.9  ,  -578.0, -329.7  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -329.7  ,  -386.0, -132.6  ,  -386.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -132.6  ,  -194.0, 12.6  ,  -194.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, 12.6  ,  -2.0, 115.3  ,  -2.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, 115.3  ,  190.0, 165.7  ,  190.0, 2351.0  ,  -2.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, 165.7  ,  382.0, 226.6  ,  382.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, 226.6  ,  574.0, 344.3  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 344.3  ,  766.0, 408.5  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 408.5  ,  958.0, 464.3  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 464.3  ,  1150.0, 530.6  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 530.6  ,  1342.0, 608.9  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 608.9  ,  1534.0, 693.2  ,  1534.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 693.2  ,  1726.0, 753.0  ,  1726.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 753.0  ,  1918.0, 799.9  ,  1918.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, 799.9  ,  2110.0, 883.9  ,  2110.0, 2351.0  ,  1918.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, 883.9  ,  2302.0, 964.3  ,  2302.0, 2351.0  ,  2110.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 964.3  ,  2494.0, 1057.1  ,  2494.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 1057.1  ,  2686.0, 1152.0  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 1152.0  ,  2878.0, 1236.0  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1236.0  ,  3070.0, 1195.7  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1195.7  ,  3262.0, 1191.9  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1191.9  ,  3454.0, 1300.4  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1300.4  ,  3646.0, 1349.3  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1349.3  ,  3838.0, 1406.4  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
                    }
		}
		,
		["4"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -1731.6  ,  -3650.0, -1658.7  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1658.7  ,  -3458.0, -1605.2  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1605.2  ,  -3266.0, -1559.0  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1559.0  ,  -3074.0, -1530.2  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1530.2  ,  -2882.0, -1502.1  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1502.1  ,  -2690.0, -1465.3  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1465.3  ,  -2498.0, -1392.7  ,  -2498.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1392.7  ,  -2306.0, -1252.8  ,  -2306.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -1252.8  ,  -2114.0, -1143.0  ,  -2114.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -1143.0  ,  -1922.0, -1034.0  ,  -1922.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -1034.0  ,  -1730.0, -921.1  ,  -1730.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -921.1  ,  -1538.0, -819.2  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -819.2  ,  -1346.0, -763.8  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -763.8  ,  -1154.0, -683.1  ,  -1154.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -683.1  ,  -962.0, -614.0  ,  -962.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -614.0  ,  -770.0, -541.3  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -541.3  ,  -578.0, -494.5  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -494.5  ,  -386.0, -481.4  ,  -386.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -481.4  ,  -194.0, -423.9  ,  -194.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -423.9  ,  -2.0, -331.3  ,  -2.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -331.3  ,  190.0, -236.2  ,  190.0, 2351.0  ,  -2.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -236.2  ,  382.0, -121.3  ,  382.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -121.3  ,  574.0, -15.2  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -15.2  ,  766.0, 117.7  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 117.7  ,  958.0, 245.3  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 245.3  ,  1150.0, 356.4  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 356.4  ,  1342.0, 448.3  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 448.3  ,  1534.0, 565.2  ,  1534.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 565.2  ,  1726.0, 660.3  ,  1726.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 660.3  ,  1918.0, 739.7  ,  1918.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, 739.7  ,  2110.0, 908.0  ,  2110.0, 2351.0  ,  1918.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, 908.0  ,  2302.0, 1048.3  ,  2302.0, 2351.0  ,  2110.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 1048.3  ,  2494.0, 1151.8  ,  2494.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 1151.8  ,  2686.0, 1248.2  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 1248.2  ,  2878.0, 1327.1  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1327.1  ,  3070.0, 1303.9  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1303.9  ,  3262.0, 1286.0  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1286.0  ,  3454.0, 1292.1  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1292.1  ,  3646.0, 1322.3  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1322.3  ,  3838.0, 1387.0  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
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
