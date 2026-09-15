-- This file is for use with Corona(R) SDK
--
-- Ground shapes ("1"-"4") generated programmatically 2026-09-15 for the
-- new bane 5 terrain (see TIL-ORJAN.md): each fixture is a trapezoid
-- sampled directly from the same curve the matching level5/N.png ground
-- art was rendered from, so there is no hand-tracing guesswork involved,
-- the shape is mathematically exact for the art it goes with.
-- The "del1" worm-body shape below is copied verbatim from
-- lib/shapedefs4.lua (the worm itself is identical across levels).
--
-- Usage example:
--			local scaleFactor = 1.0
--			local physicsData = (require "lib.shapedefs5").physicsData(scaleFactor)
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
                    shape = {   -3840.0, 2351.0  ,  -3650.0, -1990.9  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1990.9  ,  -3458.0, -1847.3  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1847.3  ,  -3266.0, -1712.9  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1712.9  ,  -3074.0, -1547.7  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1547.7  ,  -2882.0, -1386.8  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1386.8  ,  -2690.0, -1234.6  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1234.6  ,  -2498.0, -1130.6  ,  -2498.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1130.6  ,  -2306.0, -1064.4  ,  -2306.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -1064.4  ,  -2114.0, -958.4  ,  -2114.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -958.4  ,  -1922.0, -839.8  ,  -1922.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -839.8  ,  -1730.0, -699.8  ,  -1730.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -699.8  ,  -1538.0, -580.9  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -580.9  ,  -1346.0, -508.8  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -508.8  ,  -1154.0, -436.2  ,  -1154.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -436.2  ,  -962.0, -387.2  ,  -962.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -387.2  ,  -770.0, -321.1  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -321.1  ,  -578.0, -276.5  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -276.5  ,  -386.0, -247.4  ,  -386.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -247.4  ,  -194.0, -207.9  ,  -194.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -207.9  ,  -2.0, -153.1  ,  -2.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -153.1  ,  190.0, -45.6  ,  190.0, 2351.0  ,  -2.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -45.6  ,  382.0, 72.8  ,  382.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, 72.8  ,  574.0, 176.0  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 176.0  ,  766.0, 320.9  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 320.9  ,  958.0, 477.6  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 477.6  ,  1150.0, 544.3  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 544.3  ,  1342.0, 612.4  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 612.4  ,  1534.0, 709.8  ,  1534.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 709.8  ,  1726.0, 784.2  ,  1726.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 784.2  ,  1918.0, 854.0  ,  1918.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, 854.0  ,  2110.0, 896.1  ,  2110.0, 2351.0  ,  1918.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, 896.1  ,  2302.0, 952.8  ,  2302.0, 2351.0  ,  2110.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 952.8  ,  2494.0, 1026.6  ,  2494.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 1026.6  ,  2686.0, 1100.8  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 1100.8  ,  2878.0, 1164.5  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1164.5  ,  3070.0, 1296.4  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1296.4  ,  3262.0, 1392.8  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1392.8  ,  3454.0, 1409.8  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1409.8  ,  3646.0, 1479.0  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1479.0  ,  3838.0, 1559.2  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
                    }
		}
		,
		["2"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -1316.9  ,  -3650.0, -1295.7  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1295.7  ,  -3458.0, -1282.8  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1282.8  ,  -3266.0, -1231.7  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1231.7  ,  -3074.0, -1209.0  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1209.0  ,  -2882.0, -1166.7  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1166.7  ,  -2690.0, -1163.5  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1163.5  ,  -2498.0, -1104.5  ,  -2498.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1104.5  ,  -2306.0, -974.1  ,  -2306.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -974.1  ,  -2114.0, -884.8  ,  -2114.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -884.8  ,  -1922.0, -805.9  ,  -1922.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -805.9  ,  -1730.0, -709.7  ,  -1730.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -709.7  ,  -1538.0, -615.8  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -615.8  ,  -1346.0, -518.4  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -518.4  ,  -1154.0, -454.5  ,  -1154.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -454.5  ,  -962.0, -417.0  ,  -962.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -417.0  ,  -770.0, -350.9  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -350.9  ,  -578.0, -281.1  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -281.1  ,  -386.0, -176.3  ,  -386.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -176.3  ,  -194.0, -123.4  ,  -194.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -123.4  ,  -2.0, -91.8  ,  -2.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -91.8  ,  190.0, 42.8  ,  190.0, 2351.0  ,  -2.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, 42.8  ,  382.0, 157.0  ,  382.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, 157.0  ,  574.0, 247.4  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 247.4  ,  766.0, 334.1  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 334.1  ,  958.0, 417.4  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 417.4  ,  1150.0, 511.8  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 511.8  ,  1342.0, 598.3  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 598.3  ,  1534.0, 660.5  ,  1534.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 660.5  ,  1726.0, 714.5  ,  1726.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 714.5  ,  1918.0, 761.2  ,  1918.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, 761.2  ,  2110.0, 788.4  ,  2110.0, 2351.0  ,  1918.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, 788.4  ,  2302.0, 833.6  ,  2302.0, 2351.0  ,  2110.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 833.6  ,  2494.0, 908.8  ,  2494.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 908.8  ,  2686.0, 987.0  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 987.0  ,  2878.0, 1054.3  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1054.3  ,  3070.0, 1131.8  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1131.8  ,  3262.0, 1200.3  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1200.3  ,  3454.0, 1258.0  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1258.0  ,  3646.0, 1328.9  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1328.9  ,  3838.0, 1410.5  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
                    }
		}
		,
		["3"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -1485.3  ,  -3650.0, -1419.3  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1419.3  ,  -3458.0, -1358.1  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1358.1  ,  -3266.0, -1285.2  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1285.2  ,  -3074.0, -1245.4  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1245.4  ,  -2882.0, -1220.0  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1220.0  ,  -2690.0, -1099.6  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1099.6  ,  -2498.0, -1000.1  ,  -2498.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1000.1  ,  -2306.0, -998.3  ,  -2306.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -998.3  ,  -2114.0, -915.7  ,  -2114.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -915.7  ,  -1922.0, -816.3  ,  -1922.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -816.3  ,  -1730.0, -708.5  ,  -1730.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -708.5  ,  -1538.0, -611.9  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -611.9  ,  -1346.0, -538.5  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -538.5  ,  -1154.0, -465.8  ,  -1154.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -465.8  ,  -962.0, -425.1  ,  -962.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -425.1  ,  -770.0, -404.2  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -404.2  ,  -578.0, -394.3  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -394.3  ,  -386.0, -371.9  ,  -386.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -371.9  ,  -194.0, -330.7  ,  -194.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -330.7  ,  -2.0, -253.5  ,  -2.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -253.5  ,  190.0, -152.4  ,  190.0, 2351.0  ,  -2.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -152.4  ,  382.0, -15.7  ,  382.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -15.7  ,  574.0, 138.8  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 138.8  ,  766.0, 289.6  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 289.6  ,  958.0, 413.5  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 413.5  ,  1150.0, 559.8  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 559.8  ,  1342.0, 661.9  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 661.9  ,  1534.0, 738.3  ,  1534.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 738.3  ,  1726.0, 775.0  ,  1726.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 775.0  ,  1918.0, 785.2  ,  1918.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, 785.2  ,  2110.0, 873.9  ,  2110.0, 2351.0  ,  1918.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, 873.9  ,  2302.0, 952.4  ,  2302.0, 2351.0  ,  2110.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 952.4  ,  2494.0, 1033.1  ,  2494.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 1033.1  ,  2686.0, 1093.6  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 1093.6  ,  2878.0, 1122.1  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1122.1  ,  3070.0, 1221.9  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1221.9  ,  3262.0, 1291.5  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1291.5  ,  3454.0, 1303.2  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1303.2  ,  3646.0, 1366.2  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1366.2  ,  3838.0, 1452.4  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
                    }
		}
		,
		["4"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2013.1  ,  -3650.0, -1893.1  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1893.1  ,  -3458.0, -1768.4  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1768.4  ,  -3266.0, -1642.3  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1642.3  ,  -3074.0, -1529.3  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1529.3  ,  -2882.0, -1431.7  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1431.7  ,  -2690.0, -1348.8  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1348.8  ,  -2498.0, -1265.0  ,  -2498.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1265.0  ,  -2306.0, -1110.7  ,  -2306.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -1110.7  ,  -2114.0, -1021.8  ,  -2114.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -1021.8  ,  -1922.0, -955.2  ,  -1922.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -955.2  ,  -1730.0, -857.6  ,  -1730.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -857.6  ,  -1538.0, -756.6  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -756.6  ,  -1346.0, -627.6  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -627.6  ,  -1154.0, -561.4  ,  -1154.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -561.4  ,  -962.0, -530.9  ,  -962.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -530.9  ,  -770.0, -461.3  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -461.3  ,  -578.0, -398.1  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -398.1  ,  -386.0, -315.4  ,  -386.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -315.4  ,  -194.0, -250.3  ,  -194.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -250.3  ,  -2.0, -178.4  ,  -2.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -178.4  ,  190.0, -117.7  ,  190.0, 2351.0  ,  -2.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -117.7  ,  382.0, -61.0  ,  382.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -61.0  ,  574.0, -6.5  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -6.5  ,  766.0, 64.8  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 64.8  ,  958.0, 154.5  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 154.5  ,  1150.0, 217.2  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 217.2  ,  1342.0, 300.9  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 300.9  ,  1534.0, 462.3  ,  1534.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 462.3  ,  1726.0, 635.9  ,  1726.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 635.9  ,  1918.0, 822.2  ,  1918.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, 822.2  ,  2110.0, 1027.2  ,  2110.0, 2351.0  ,  1918.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, 1027.2  ,  2302.0, 1207.9  ,  2302.0, 2351.0  ,  2110.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 1207.9  ,  2494.0, 1347.1  ,  2494.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 1347.1  ,  2686.0, 1422.7  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 1422.7  ,  2878.0, 1459.6  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1459.6  ,  3070.0, 1494.3  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1494.3  ,  3262.0, 1505.4  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1505.4  ,  3454.0, 1463.5  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1463.5  ,  3646.0, 1523.9  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1523.9  ,  3838.0, 2350.8  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
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
