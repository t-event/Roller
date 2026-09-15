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
                    shape = {   -3840.0, 2351.0  ,  -3786.0, 1436.8  ,  -3786.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3786.0, 1436.8  ,  -3732.0, -529.9  ,  -3732.0, 2351.0  ,  -3786.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3732.0, -529.9  ,  -3678.0, -1905.3  ,  -3678.0, 2351.0  ,  -3732.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3678.0, -1905.3  ,  -3650.0, -1990.9  ,  -3650.0, 2351.0  ,  -3678.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1990.9  ,  -3624.0, -1970.8  ,  -3624.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3624.0, -1970.8  ,  -3570.0, -1929.1  ,  -3570.0, 2351.0  ,  -3624.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3570.0, -1929.1  ,  -3516.0, -1888.6  ,  -3516.0, 2351.0  ,  -3570.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3516.0, -1888.6  ,  -3460.0, -1848.7  ,  -3460.0, 2351.0  ,  -3516.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3460.0, -1848.7  ,  -3458.0, -1847.3  ,  -3458.0, 2351.0  ,  -3460.0, 2351.0  }
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
                    shape = {   -2114.0, -958.4  ,  -1926.0, -842.2  ,  -1926.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1926.0, -842.2  ,  -1922.0, -839.8  ,  -1922.0, 2351.0  ,  -1926.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -839.8  ,  -1868.0, -804.8  ,  -1868.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1868.0, -804.8  ,  -1812.0, -763.7  ,  -1812.0, 2351.0  ,  -1868.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1812.0, -763.7  ,  -1786.0, -743.5  ,  -1786.0, 2351.0  ,  -1812.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1786.0, -743.5  ,  -1754.0, -718.4  ,  -1754.0, 2351.0  ,  -1786.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1754.0, -718.4  ,  -1730.0, -699.8  ,  -1730.0, 2351.0  ,  -1754.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -699.8  ,  -1728.0, -698.2  ,  -1728.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1728.0, -698.2  ,  -1698.0, 2100.7  ,  -1698.0, 2351.0  ,  -1728.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1698.0, 2100.7  ,  -1672.0, 1438.1  ,  -1672.0, 2351.0  ,  -1698.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1672.0, 1438.1  ,  -1640.0, 396.3  ,  -1640.0, 2351.0  ,  -1672.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1640.0, 396.3  ,  -1614.0, -295.7  ,  -1614.0, 2351.0  ,  -1640.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1614.0, -295.7  ,  -1584.0, -603.2  ,  -1584.0, 2351.0  ,  -1614.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1188.0, -446.9  ,  -1158.0, -171.1  ,  -1158.0, 2351.0  ,  -1188.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1158.0, -171.1  ,  -1154.0, -92.0  ,  -1154.0, 2351.0  ,  -1158.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -92.0  ,  -1132.0, 472.1  ,  -1132.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1132.0, 472.1  ,  -1100.0, 1452.0  ,  -1100.0, 2351.0  ,  -1132.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1100.0, 1452.0  ,  -1074.0, 2087.0  ,  -1074.0, 2351.0  ,  -1100.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1074.0, 2087.0  ,  -1044.0, -406.7  ,  -1044.0, 2351.0  ,  -1074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1044.0, -406.7  ,  -1018.0, -400.4  ,  -1018.0, 2351.0  ,  -1044.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1018.0, -400.4  ,  -986.0, -392.9  ,  -986.0, 2351.0  ,  -1018.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -986.0, -392.9  ,  -962.0, -387.2  ,  -962.0, 2351.0  ,  -986.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -387.2  ,  -960.0, -386.8  ,  -960.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -960.0, -386.8  ,  -904.0, -371.1  ,  -904.0, 2351.0  ,  -960.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -904.0, -371.1  ,  -846.0, -350.4  ,  -846.0, 2351.0  ,  -904.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -846.0, -350.4  ,  -770.0, -321.1  ,  -770.0, 2351.0  ,  -846.0, 2351.0  }
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
                    shape = {   382.0, 72.8  ,  402.0, 83.7  ,  402.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   402.0, 83.7  ,  458.0, 113.0  ,  458.0, 2351.0  ,  402.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   458.0, 113.0  ,  516.0, 143.4  ,  516.0, 2351.0  ,  458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   516.0, 143.4  ,  542.0, 157.6  ,  542.0, 2351.0  ,  516.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   542.0, 157.6  ,  572.0, 174.9  ,  572.0, 2351.0  ,  542.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   572.0, 174.9  ,  574.0, 176.0  ,  574.0, 2351.0  ,  572.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 176.0  ,  598.0, 190.7  ,  598.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   598.0, 190.7  ,  630.0, 2146.7  ,  630.0, 2351.0  ,  598.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   630.0, 2146.7  ,  656.0, 1663.0  ,  656.0, 2351.0  ,  630.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   656.0, 1663.0  ,  688.0, 934.0  ,  688.0, 2351.0  ,  656.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   688.0, 934.0  ,  712.0, 500.1  ,  712.0, 2351.0  ,  688.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   712.0, 500.1  ,  744.0, 301.2  ,  744.0, 2351.0  ,  712.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1138.0, 541.7  ,  1150.0, 566.9  ,  1150.0, 2351.0  ,  1138.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 566.9  ,  1170.0, 745.3  ,  1170.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1170.0, 745.3  ,  1196.0, 1175.4  ,  1196.0, 2351.0  ,  1170.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1196.0, 1175.4  ,  1228.0, 1808.7  ,  1228.0, 2351.0  ,  1196.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1228.0, 1808.7  ,  1252.0, 2181.1  ,  1252.0, 2351.0  ,  1228.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1252.0, 2181.1  ,  1284.0, 585.3  ,  1284.0, 2351.0  ,  1252.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1284.0, 585.3  ,  1310.0, 597.1  ,  1310.0, 2351.0  ,  1284.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1310.0, 597.1  ,  1342.0, 612.4  ,  1342.0, 2351.0  ,  1310.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 612.4  ,  1368.0, 625.5  ,  1368.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1368.0, 625.5  ,  1424.0, 654.7  ,  1424.0, 2351.0  ,  1368.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1424.0, 654.7  ,  1482.0, 684.8  ,  1482.0, 2351.0  ,  1424.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1482.0, 684.8  ,  1534.0, 709.8  ,  1534.0, 2351.0  ,  1482.0, 2351.0  }
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
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2351.0  ,  -3650.0, -2351.0  ,  -3650.0, -2262.1  ,  -3840.0, -2304.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -2143.7  ,  -3650.0, -2262.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -1977.6  ,  -3458.0, -2143.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -1813.4  ,  -3266.0, -1977.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -3040.0, -2351.0  ,  -3040.0, -1789.1  ,  -3074.0, -1813.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3040.0, -2351.0  ,  -2984.0, -2351.0  ,  -2984.0, -1754.1  ,  -3040.0, -1789.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2984.0, -2351.0  ,  -2926.0, -2351.0  ,  -2926.0, -1725.8  ,  -2984.0, -1754.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2926.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -1710.4  ,  -2926.0, -1725.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2870.0, -2351.0  ,  -2870.0, -1707.2  ,  -2882.0, -1710.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2870.0, -2351.0  ,  -2812.0, -2351.0  ,  -2812.0, -1696.8  ,  -2870.0, -1707.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2812.0, -2351.0  ,  -2756.0, -2351.0  ,  -2756.0, -1688.7  ,  -2812.0, -1696.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2756.0, -2351.0  ,  -2698.0, -2351.0  ,  -2698.0, -1681.0  ,  -2756.0, -1688.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2698.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -1680.0  ,  -2698.0, -1681.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2640.0, -2351.0  ,  -2640.0, -1674.1  ,  -2690.0, -1680.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2640.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1661.3  ,  -2640.0, -1674.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -2351.0  ,  -2306.0, -2351.0  ,  -2306.0, -1654.6  ,  -2498.0, -1661.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -2351.0  ,  -2114.0, -2351.0  ,  -2114.0, -1671.0  ,  -2306.0, -1654.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -2351.0  ,  -1922.0, -2351.0  ,  -1922.0, -1718.0  ,  -2114.0, -1671.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -2351.0  ,  -1730.0, -2351.0  ,  -1730.0, -1788.6  ,  -1922.0, -1718.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -2351.0  ,  -1538.0, -2351.0  ,  -1538.0, -1872.0  ,  -1730.0, -1788.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -2351.0  ,  -1346.0, -2351.0  ,  -1346.0, -1775.6  ,  -1538.0, -1872.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -2351.0  ,  -1154.0, -2351.0  ,  -1154.0, -1690.9  ,  -1346.0, -1775.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -2351.0  ,  -962.0, -2351.0  ,  -962.0, -1599.1  ,  -1154.0, -1690.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -2351.0  ,  -770.0, -2351.0  ,  -770.0, -1521.7  ,  -962.0, -1599.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -2351.0  ,  -578.0, -2351.0  ,  -578.0, -1488.3  ,  -770.0, -1521.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -2351.0  ,  -386.0, -2351.0  ,  -386.0, -1519.9  ,  -578.0, -1488.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -2351.0  ,  -194.0, -2351.0  ,  -194.0, -1679.2  ,  -386.0, -1519.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -2351.0  ,  -2.0, -2351.0  ,  -2.0, -1861.5  ,  -194.0, -1679.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -2351.0  ,  190.0, -2351.0  ,  190.0, -1827.0  ,  -2.0, -1861.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -2351.0  ,  382.0, -2351.0  ,  382.0, -1765.0  ,  190.0, -1827.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -2351.0  ,  574.0, -2351.0  ,  574.0, -1723.5  ,  382.0, -1765.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -2351.0  ,  766.0, -2351.0  ,  766.0, -1708.8  ,  574.0, -1723.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, -2351.0  ,  958.0, -2351.0  ,  958.0, -1702.2  ,  766.0, -1708.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, -2351.0  ,  1150.0, -2351.0  ,  1150.0, -1683.3  ,  958.0, -1702.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, -2351.0  ,  1342.0, -2351.0  ,  1342.0, -1655.0  ,  1150.0, -1683.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, -2351.0  ,  1534.0, -2351.0  ,  1534.0, -1621.6  ,  1342.0, -1655.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, -2351.0  ,  1726.0, -2351.0  ,  1726.0, -1588.2  ,  1534.0, -1621.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, -2351.0  ,  1918.0, -2351.0  ,  1918.0, -1559.8  ,  1726.0, -1588.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, -2351.0  ,  2110.0, -2351.0  ,  2110.0, -1540.9  ,  1918.0, -1559.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, -2351.0  ,  2302.0, -2351.0  ,  2302.0, -1534.2  ,  2110.0, -1540.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, -2351.0  ,  2494.0, -2351.0  ,  2494.0, -1539.7  ,  2302.0, -1534.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, -2351.0  ,  2686.0, -2351.0  ,  2686.0, -1555.6  ,  2494.0, -1539.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, -2351.0  ,  2878.0, -2351.0  ,  2878.0, -1579.3  ,  2686.0, -1555.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, -2351.0  ,  3070.0, -2351.0  ,  3070.0, -1607.2  ,  2878.0, -1579.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, -2351.0  ,  3262.0, -2351.0  ,  3262.0, -1635.2  ,  3070.0, -1607.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, -2351.0  ,  3454.0, -2351.0  ,  3454.0, -1658.9  ,  3262.0, -1635.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, -2351.0  ,  3646.0, -2351.0  ,  3646.0, -1674.7  ,  3454.0, -1658.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, -2351.0  ,  3838.0, -2351.0  ,  3838.0, -1680.3  ,  3646.0, -1674.7  }
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
                    shape = {   -2306.0, -974.1  ,  -2118.0, -886.3  ,  -2118.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2118.0, -886.3  ,  -2114.0, -884.8  ,  -2114.0, 2351.0  ,  -2118.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -884.8  ,  -2060.0, -864.5  ,  -2060.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2060.0, -864.5  ,  -2004.0, -842.6  ,  -2004.0, 2351.0  ,  -2060.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2004.0, -842.6  ,  -1978.0, -831.6  ,  -1978.0, 2351.0  ,  -2004.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1978.0, -831.6  ,  -1946.0, -817.3  ,  -1946.0, 2351.0  ,  -1978.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1946.0, -817.3  ,  -1922.0, -805.9  ,  -1922.0, 2351.0  ,  -1946.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -805.9  ,  -1920.0, -804.9  ,  -1920.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1920.0, -804.9  ,  -1890.0, 2091.2  ,  -1890.0, 2351.0  ,  -1920.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1890.0, 2091.2  ,  -1864.0, 1401.6  ,  -1864.0, 2351.0  ,  -1890.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1864.0, 1401.6  ,  -1832.0, 314.1  ,  -1832.0, 2351.0  ,  -1864.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1832.0, 314.1  ,  -1806.0, -410.0  ,  -1806.0, 2351.0  ,  -1832.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1806.0, -410.0  ,  -1774.0, -731.9  ,  -1774.0, 2351.0  ,  -1806.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1380.0, -535.0  ,  -1350.0, -246.2  ,  -1350.0, 2351.0  ,  -1380.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1350.0, -246.2  ,  -1346.0, -164.2  ,  -1346.0, 2351.0  ,  -1350.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -164.2  ,  -1324.0, 419.2  ,  -1324.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1324.0, 419.2  ,  -1292.0, 1428.5  ,  -1292.0, 2351.0  ,  -1324.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1292.0, 1428.5  ,  -1266.0, 2080.4  ,  -1266.0, 2351.0  ,  -1292.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1266.0, 2080.4  ,  -1234.0, -471.4  ,  -1234.0, 2351.0  ,  -1266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1234.0, -471.4  ,  -1210.0, -464.9  ,  -1210.0, 2351.0  ,  -1234.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1210.0, -464.9  ,  -1178.0, -458.3  ,  -1178.0, 2351.0  ,  -1210.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1178.0, -458.3  ,  -1154.0, -454.5  ,  -1154.0, 2351.0  ,  -1178.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -454.5  ,  -1152.0, -454.2  ,  -1152.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1152.0, -454.2  ,  -1094.0, -446.9  ,  -1094.0, 2351.0  ,  -1152.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1094.0, -446.9  ,  -1038.0, -438.2  ,  -1038.0, 2351.0  ,  -1094.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1038.0, -438.2  ,  -962.0, -417.0  ,  -962.0, 2351.0  ,  -1038.0, 2351.0  }
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
                    shape = {   382.0, 157.0  ,  538.0, 230.4  ,  538.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   538.0, 230.4  ,  574.0, 247.4  ,  574.0, 2351.0  ,  538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 247.4  ,  596.0, 257.7  ,  596.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   596.0, 257.7  ,  652.0, 283.8  ,  652.0, 2351.0  ,  596.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   652.0, 283.8  ,  678.0, 295.7  ,  678.0, 2351.0  ,  652.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   678.0, 295.7  ,  710.0, 309.9  ,  710.0, 2351.0  ,  678.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   710.0, 309.9  ,  736.0, 321.2  ,  736.0, 2351.0  ,  710.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   736.0, 321.2  ,  766.0, 2184.2  ,  766.0, 2351.0  ,  736.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 2184.2  ,  768.0, 2158.5  ,  768.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   768.0, 2158.5  ,  792.0, 1742.3  ,  792.0, 2351.0  ,  768.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   792.0, 1742.3  ,  824.0, 1047.1  ,  824.0, 2351.0  ,  792.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   824.0, 1047.1  ,  850.0, 586.0  ,  850.0, 2351.0  ,  824.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   850.0, 586.0  ,  882.0, 383.7  ,  882.0, 2351.0  ,  850.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1276.0, 571.4  ,  1308.0, 777.5  ,  1308.0, 2351.0  ,  1276.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1308.0, 777.5  ,  1332.0, 1164.1  ,  1332.0, 2351.0  ,  1308.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1332.0, 1164.1  ,  1342.0, 1357.0  ,  1342.0, 2351.0  ,  1332.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 1357.0  ,  1364.0, 1785.2  ,  1364.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1364.0, 1785.2  ,  1390.0, 2185.3  ,  1390.0, 2351.0  ,  1364.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1390.0, 2185.3  ,  1422.0, 626.3  ,  1422.0, 2351.0  ,  1390.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1422.0, 626.3  ,  1448.0, 634.6  ,  1448.0, 2351.0  ,  1422.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1448.0, 634.6  ,  1478.0, 643.8  ,  1478.0, 2351.0  ,  1448.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1478.0, 643.8  ,  1504.0, 651.6  ,  1504.0, 2351.0  ,  1478.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1504.0, 651.6  ,  1534.0, 660.5  ,  1534.0, 2351.0  ,  1504.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 660.5  ,  1562.0, 668.7  ,  1562.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1562.0, 668.7  ,  1618.0, 685.2  ,  1618.0, 2351.0  ,  1562.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1618.0, 685.2  ,  1726.0, 714.5  ,  1726.0, 2351.0  ,  1618.0, 2351.0  }
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
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2351.0  ,  -3650.0, -2351.0  ,  -3650.0, -1829.9  ,  -3840.0, -1821.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -1855.3  ,  -3650.0, -1829.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -1829.4  ,  -3458.0, -1855.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -1737.8  ,  -3266.0, -1829.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -1695.2  ,  -3074.0, -1737.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -1707.6  ,  -2882.0, -1695.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1714.4  ,  -2690.0, -1707.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -2351.0  ,  -2306.0, -2351.0  ,  -2306.0, -1705.3  ,  -2498.0, -1714.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -2351.0  ,  -2114.0, -2351.0  ,  -2114.0, -1720.5  ,  -2306.0, -1705.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -2351.0  ,  -1922.0, -2351.0  ,  -1922.0, -1764.2  ,  -2114.0, -1720.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -2351.0  ,  -1730.0, -2351.0  ,  -1730.0, -1774.1  ,  -1922.0, -1764.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -2351.0  ,  -1538.0, -2351.0  ,  -1538.0, -1666.7  ,  -1730.0, -1774.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -2351.0  ,  -1346.0, -2351.0  ,  -1346.0, -1512.4  ,  -1538.0, -1666.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -2351.0  ,  -1154.0, -2351.0  ,  -1154.0, -1452.3  ,  -1346.0, -1512.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -2351.0  ,  -962.0, -2351.0  ,  -962.0, -1461.9  ,  -1154.0, -1452.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -2351.0  ,  -770.0, -2351.0  ,  -770.0, -1519.7  ,  -962.0, -1461.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -2351.0  ,  -578.0, -2351.0  ,  -578.0, -1594.8  ,  -770.0, -1519.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -2351.0  ,  -386.0, -2351.0  ,  -386.0, -1660.8  ,  -578.0, -1594.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -2351.0  ,  -194.0, -2351.0  ,  -194.0, -1763.1  ,  -386.0, -1660.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -2351.0  ,  -2.0, -2351.0  ,  -2.0, -1878.3  ,  -194.0, -1763.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -2351.0  ,  190.0, -2351.0  ,  190.0, -1796.3  ,  -2.0, -1878.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -2351.0  ,  382.0, -2351.0  ,  382.0, -1722.4  ,  190.0, -1796.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -2351.0  ,  574.0, -2351.0  ,  574.0, -1672.9  ,  382.0, -1722.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -2351.0  ,  766.0, -2351.0  ,  766.0, -1655.4  ,  574.0, -1672.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, -2351.0  ,  958.0, -2351.0  ,  958.0, -1670.3  ,  766.0, -1655.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, -2351.0  ,  1150.0, -2351.0  ,  1150.0, -1712.8  ,  958.0, -1670.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, -2351.0  ,  1342.0, -2351.0  ,  1342.0, -1776.4  ,  1150.0, -1712.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, -2351.0  ,  1534.0, -2351.0  ,  1534.0, -1851.6  ,  1342.0, -1776.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, -2351.0  ,  1726.0, -2351.0  ,  1726.0, -1800.0  ,  1534.0, -1851.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, -2351.0  ,  1918.0, -2351.0  ,  1918.0, -1586.8  ,  1726.0, -1800.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, -2351.0  ,  2110.0, -2351.0  ,  2110.0, -1475.1  ,  1918.0, -1586.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, -2351.0  ,  2302.0, -2351.0  ,  2302.0, -1494.9  ,  2110.0, -1475.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, -2351.0  ,  2494.0, -2351.0  ,  2494.0, -1608.2  ,  2302.0, -1494.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, -2351.0  ,  2686.0, -2351.0  ,  2686.0, -1735.0  ,  2494.0, -1608.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, -2351.0  ,  2878.0, -2351.0  ,  2878.0, -1758.9  ,  2686.0, -1735.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, -2351.0  ,  3070.0, -2351.0  ,  3070.0, -1787.1  ,  2878.0, -1758.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, -2351.0  ,  3262.0, -2351.0  ,  3262.0, -1815.3  ,  3070.0, -1787.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, -2351.0  ,  3454.0, -2351.0  ,  3454.0, -1839.2  ,  3262.0, -1815.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, -2351.0  ,  3646.0, -2351.0  ,  3646.0, -1855.2  ,  3454.0, -1839.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, -2351.0  ,  3838.0, -2351.0  ,  3838.0, -1860.8  ,  3646.0, -1855.2  }
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
                    shape = {   -2306.0, -998.3  ,  -2158.0, -938.9  ,  -2158.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2158.0, -938.9  ,  -2114.0, -915.7  ,  -2114.0, 2351.0  ,  -2158.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -915.7  ,  -2100.0, -908.2  ,  -2100.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2100.0, -908.2  ,  -2044.0, -878.0  ,  -2044.0, 2351.0  ,  -2100.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2044.0, -878.0  ,  -2018.0, -864.1  ,  -2018.0, 2351.0  ,  -2044.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2018.0, -864.1  ,  -1986.0, -847.5  ,  -1986.0, 2351.0  ,  -2018.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1986.0, -847.5  ,  -1960.0, -834.5  ,  -1960.0, 2351.0  ,  -1986.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1960.0, -834.5  ,  -1928.0, 2048.3  ,  -1928.0, 2351.0  ,  -1960.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1928.0, 2048.3  ,  -1922.0, 1912.0  ,  -1922.0, 2351.0  ,  -1928.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, 1912.0  ,  -1904.0, 1392.3  ,  -1904.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1904.0, 1392.3  ,  -1872.0, 294.1  ,  -1872.0, 2351.0  ,  -1904.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1872.0, 294.1  ,  -1846.0, -436.2  ,  -1846.0, 2351.0  ,  -1872.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1846.0, -436.2  ,  -1814.0, -759.0  ,  -1814.0, 2351.0  ,  -1846.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1420.0, -566.7  ,  -1388.0, -237.7  ,  -1388.0, 2351.0  ,  -1420.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1388.0, -237.7  ,  -1364.0, 393.9  ,  -1364.0, 2351.0  ,  -1388.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1364.0, 393.9  ,  -1346.0, 971.1  ,  -1346.0, 2351.0  ,  -1364.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, 971.1  ,  -1332.0, 1415.7  ,  -1332.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1332.0, 1415.7  ,  -1306.0, 2076.6  ,  -1306.0, 2351.0  ,  -1332.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1306.0, 2076.6  ,  -1274.0, -508.5  ,  -1274.0, 2351.0  ,  -1306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1274.0, -508.5  ,  -1248.0, -497.8  ,  -1248.0, 2351.0  ,  -1274.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1248.0, -497.8  ,  -1218.0, -486.5  ,  -1218.0, 2351.0  ,  -1248.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1218.0, -486.5  ,  -1192.0, -477.5  ,  -1192.0, 2351.0  ,  -1218.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1192.0, -477.5  ,  -1154.0, -465.8  ,  -1154.0, 2351.0  ,  -1192.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -465.8  ,  -1134.0, -460.2  ,  -1134.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1134.0, -460.2  ,  -1078.0, -446.5  ,  -1078.0, 2351.0  ,  -1134.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1078.0, -446.5  ,  -962.0, -425.1  ,  -962.0, 2351.0  ,  -1078.0, 2351.0  }
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
                    shape = {   382.0, -15.7  ,  536.0, 106.9  ,  536.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   536.0, 106.9  ,  574.0, 138.8  ,  574.0, 2351.0  ,  536.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 138.8  ,  592.0, 154.1  ,  592.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   592.0, 154.1  ,  650.0, 204.7  ,  650.0, 2351.0  ,  592.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   650.0, 204.7  ,  676.0, 226.1  ,  676.0, 2351.0  ,  650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   676.0, 226.1  ,  708.0, 250.4  ,  708.0, 2351.0  ,  676.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   708.0, 250.4  ,  732.0, 267.3  ,  732.0, 2351.0  ,  708.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   732.0, 267.3  ,  764.0, 2154.0  ,  764.0, 2351.0  ,  732.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   764.0, 2154.0  ,  766.0, 2126.1  ,  766.0, 2351.0  ,  764.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 2126.1  ,  790.0, 1687.3  ,  790.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   790.0, 1687.3  ,  822.0, 981.3  ,  822.0, 2351.0  ,  790.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   822.0, 981.3  ,  848.0, 531.7  ,  848.0, 2351.0  ,  822.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   848.0, 531.7  ,  878.0, 358.3  ,  878.0, 2351.0  ,  848.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1272.0, 631.6  ,  1304.0, 831.5  ,  1304.0, 2351.0  ,  1272.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1304.0, 831.5  ,  1330.0, 1242.1  ,  1330.0, 2351.0  ,  1304.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1330.0, 1242.1  ,  1342.0, 1468.6  ,  1342.0, 2351.0  ,  1330.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 1468.6  ,  1362.0, 1841.0  ,  1362.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1362.0, 1841.0  ,  1388.0, 2212.9  ,  1388.0, 2351.0  ,  1362.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1388.0, 2212.9  ,  1418.0, 694.0  ,  1418.0, 2351.0  ,  1388.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1418.0, 694.0  ,  1444.0, 704.5  ,  1444.0, 2351.0  ,  1418.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1444.0, 704.5  ,  1476.0, 717.1  ,  1476.0, 2351.0  ,  1444.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1476.0, 717.1  ,  1502.0, 726.8  ,  1502.0, 2351.0  ,  1476.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1502.0, 726.8  ,  1534.0, 738.3  ,  1534.0, 2351.0  ,  1502.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 738.3  ,  1558.0, 746.3  ,  1558.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1558.0, 746.3  ,  1616.0, 763.7  ,  1616.0, 2351.0  ,  1558.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1616.0, 763.7  ,  1726.0, 775.0  ,  1726.0, 2351.0  ,  1616.0, 2351.0  }
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
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2351.0  ,  -3650.0, -2351.0  ,  -3650.0, -1660.4  ,  -3840.0, -1668.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -1639.8  ,  -3650.0, -1660.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -1613.8  ,  -3458.0, -1639.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -1591.2  ,  -3266.0, -1613.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -1586.1  ,  -3074.0, -1591.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -1632.5  ,  -2882.0, -1586.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1709.7  ,  -2690.0, -1632.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -2351.0  ,  -2306.0, -2351.0  ,  -2306.0, -1718.7  ,  -2498.0, -1709.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -2351.0  ,  -2114.0, -2351.0  ,  -2114.0, -1729.0  ,  -2306.0, -1718.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -2351.0  ,  -1922.0, -2351.0  ,  -1922.0, -1758.7  ,  -2114.0, -1729.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -2351.0  ,  -1730.0, -2351.0  ,  -1730.0, -1748.4  ,  -1922.0, -1758.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -2351.0  ,  -1538.0, -2351.0  ,  -1538.0, -1700.3  ,  -1730.0, -1748.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -2351.0  ,  -1346.0, -2351.0  ,  -1346.0, -1638.5  ,  -1538.0, -1700.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -2351.0  ,  -1154.0, -2351.0  ,  -1154.0, -1605.4  ,  -1346.0, -1638.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -2351.0  ,  -962.0, -2351.0  ,  -962.0, -1651.5  ,  -1154.0, -1605.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -2351.0  ,  -770.0, -2351.0  ,  -770.0, -1744.8  ,  -962.0, -1651.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -2351.0  ,  -578.0, -2351.0  ,  -578.0, -1768.0  ,  -770.0, -1744.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -2351.0  ,  -386.0, -2351.0  ,  -386.0, -1769.6  ,  -578.0, -1768.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -2351.0  ,  -194.0, -2351.0  ,  -194.0, -1772.0  ,  -386.0, -1769.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -2351.0  ,  -2.0, -2351.0  ,  -2.0, -1774.8  ,  -194.0, -1772.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -2351.0  ,  190.0, -2351.0  ,  190.0, -1777.7  ,  -2.0, -1774.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -2351.0  ,  382.0, -2351.0  ,  382.0, -1780.1  ,  190.0, -1777.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -2351.0  ,  574.0, -2351.0  ,  574.0, -1769.6  ,  382.0, -1780.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -2351.0  ,  766.0, -2351.0  ,  766.0, -1713.1  ,  574.0, -1769.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, -2351.0  ,  958.0, -2351.0  ,  958.0, -1646.6  ,  766.0, -1713.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, -2351.0  ,  1150.0, -2351.0  ,  1150.0, -1611.1  ,  958.0, -1646.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, -2351.0  ,  1342.0, -2351.0  ,  1342.0, -1631.7  ,  1150.0, -1611.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, -2351.0  ,  1534.0, -2351.0  ,  1534.0, -1736.1  ,  1342.0, -1631.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, -2351.0  ,  1726.0, -2351.0  ,  1726.0, -1859.6  ,  1534.0, -1736.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, -2351.0  ,  1918.0, -2351.0  ,  1918.0, -1836.6  ,  1726.0, -1859.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, -2351.0  ,  2110.0, -2351.0  ,  2110.0, -1818.4  ,  1918.0, -1836.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, -2351.0  ,  2302.0, -2351.0  ,  2302.0, -1812.0  ,  2110.0, -1818.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, -2351.0  ,  2494.0, -2351.0  ,  2494.0, -1811.9  ,  2302.0, -1812.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, -2351.0  ,  2686.0, -2351.0  ,  2686.0, -1811.5  ,  2494.0, -1811.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, -2351.0  ,  2878.0, -2351.0  ,  2878.0, -1810.9  ,  2686.0, -1811.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, -2351.0  ,  3070.0, -2351.0  ,  3070.0, -1810.3  ,  2878.0, -1810.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, -2351.0  ,  3262.0, -2351.0  ,  3262.0, -1809.6  ,  3070.0, -1810.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, -2351.0  ,  3454.0, -2351.0  ,  3454.0, -1797.7  ,  3262.0, -1809.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, -2351.0  ,  3646.0, -2351.0  ,  3646.0, -1639.0  ,  3454.0, -1797.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, -2351.0  ,  3838.0, -2351.0  ,  3838.0, -1576.1  ,  3646.0, -1639.0  }
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
                    shape = {   -2306.0, -1110.7  ,  -2180.0, -1042.1  ,  -2180.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2180.0, -1042.1  ,  -2124.0, -1024.5  ,  -2124.0, 2351.0  ,  -2180.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2124.0, -1024.5  ,  -2114.0, -1021.8  ,  -2114.0, 2351.0  ,  -2124.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -1021.8  ,  -2066.0, -1009.6  ,  -2066.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2066.0, -1009.6  ,  -2040.0, -1002.7  ,  -2040.0, 2351.0  ,  -2066.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2040.0, -1002.7  ,  -2008.0, -993.0  ,  -2008.0, 2351.0  ,  -2040.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2008.0, -993.0  ,  -1984.0, -984.4  ,  -1984.0, 2351.0  ,  -2008.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1984.0, -984.4  ,  -1952.0, 2033.8  ,  -1952.0, 2351.0  ,  -1984.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1952.0, 2033.8  ,  -1926.0, 1278.0  ,  -1926.0, 2351.0  ,  -1952.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1926.0, 1278.0  ,  -1922.0, 1137.7  ,  -1922.0, 2351.0  ,  -1926.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, 1137.7  ,  -1894.0, 127.5  ,  -1894.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1894.0, 127.5  ,  -1868.0, -612.8  ,  -1868.0, 2351.0  ,  -1894.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1868.0, -612.8  ,  -1838.0, -910.2  ,  -1838.0, 2351.0  ,  -1868.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1444.0, -692.3  ,  -1412.0, -340.4  ,  -1412.0, 2351.0  ,  -1444.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1412.0, -340.4  ,  -1386.0, 385.2  ,  -1386.0, 2351.0  ,  -1412.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1386.0, 385.2  ,  -1354.0, 1445.6  ,  -1354.0, 2351.0  ,  -1386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1354.0, 1445.6  ,  -1346.0, 1682.2  ,  -1346.0, 2351.0  ,  -1354.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, 1682.2  ,  -1328.0, 2105.5  ,  -1328.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1328.0, 2105.5  ,  -1298.0, -602.0  ,  -1298.0, 2351.0  ,  -1328.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1298.0, -602.0  ,  -1272.0, -590.4  ,  -1272.0, 2351.0  ,  -1298.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1272.0, -590.4  ,  -1240.0, -579.0  ,  -1240.0, 2351.0  ,  -1272.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1240.0, -579.0  ,  -1214.0, -571.8  ,  -1214.0, 2351.0  ,  -1240.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1214.0, -571.8  ,  -1158.0, -561.9  ,  -1158.0, 2351.0  ,  -1214.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1158.0, -561.9  ,  -1154.0, -561.4  ,  -1154.0, 2351.0  ,  -1158.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -561.4  ,  -1100.0, -555.9  ,  -1100.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1100.0, -555.9  ,  -962.0, -530.9  ,  -962.0, 2351.0  ,  -1100.0, 2351.0  }
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
                    shape = {   382.0, -61.0  ,  522.0, -21.0  ,  522.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   522.0, -21.0  ,  574.0, -6.5  ,  574.0, 2351.0  ,  522.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -6.5  ,  580.0, -4.9  ,  580.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   580.0, -4.9  ,  636.0, 11.2  ,  636.0, 2351.0  ,  580.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   636.0, 11.2  ,  662.0, 19.4  ,  662.0, 2351.0  ,  636.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   662.0, 19.4  ,  694.0, 31.4  ,  694.0, 2351.0  ,  662.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   694.0, 31.4  ,  720.0, 42.6  ,  720.0, 2351.0  ,  694.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   720.0, 42.6  ,  750.0, 2131.9  ,  750.0, 2351.0  ,  720.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   750.0, 2131.9  ,  766.0, 1837.6  ,  766.0, 2351.0  ,  750.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 1837.6  ,  776.0, 1611.2  ,  776.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   776.0, 1611.2  ,  808.0, 820.9  ,  808.0, 2351.0  ,  776.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   808.0, 820.9  ,  834.0, 315.0  ,  834.0, 2351.0  ,  808.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   834.0, 315.0  ,  864.0, 115.1  ,  864.0, 2351.0  ,  834.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1260.0, 258.8  ,  1290.0, 498.7  ,  1290.0, 2351.0  ,  1260.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1290.0, 498.7  ,  1316.0, 999.0  ,  1316.0, 2351.0  ,  1290.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1316.0, 999.0  ,  1342.0, 1598.6  ,  1342.0, 2351.0  ,  1316.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 1598.6  ,  1348.0, 1730.0  ,  1348.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1348.0, 1730.0  ,  1374.0, 2183.2  ,  1374.0, 2351.0  ,  1348.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1374.0, 2183.2  ,  1404.0, 345.9  ,  1404.0, 2351.0  ,  1374.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1404.0, 345.9  ,  1430.0, 367.5  ,  1430.0, 2351.0  ,  1404.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1430.0, 367.5  ,  1462.0, 395.6  ,  1462.0, 2351.0  ,  1430.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1462.0, 395.6  ,  1488.0, 419.4  ,  1488.0, 2351.0  ,  1462.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1488.0, 419.4  ,  1534.0, 462.3  ,  1534.0, 2351.0  ,  1488.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 462.3  ,  1544.0, 471.7  ,  1544.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1544.0, 471.7  ,  1602.0, 525.8  ,  1602.0, 2351.0  ,  1544.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1602.0, 525.8  ,  1726.0, 635.9  ,  1726.0, 2351.0  ,  1602.0, 2351.0  }
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
                    shape = {   3454.0, 1463.5  ,  3458.0, 1463.2  ,  3458.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3458.0, 1463.2  ,  3512.0, 1465.0  ,  3512.0, 2351.0  ,  3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3512.0, 1465.0  ,  3566.0, 1479.4  ,  3566.0, 2351.0  ,  3512.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3566.0, 1479.4  ,  3620.0, 1507.1  ,  3620.0, 2351.0  ,  3566.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3620.0, 1507.1  ,  3646.0, 1523.9  ,  3646.0, 2351.0  ,  3620.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1523.9  ,  3674.0, 1555.7  ,  3674.0, 2351.0  ,  3646.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3674.0, 1555.7  ,  3728.0, 1823.4  ,  3728.0, 2351.0  ,  3674.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3728.0, 1823.4  ,  3782.0, 2179.2  ,  3782.0, 2351.0  ,  3728.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3782.0, 2179.2  ,  3838.0, 2350.8  ,  3838.0, 2351.0  ,  3782.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2351.0  ,  -3650.0, -2351.0  ,  -3650.0, -1550.6  ,  -3840.0, -1534.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -1593.1  ,  -3650.0, -1550.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -1644.5  ,  -3458.0, -1593.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -1684.8  ,  -3266.0, -1644.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -1710.3  ,  -3074.0, -1684.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -1763.6  ,  -2882.0, -1710.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1831.0  ,  -2690.0, -1763.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -2351.0  ,  -2306.0, -2351.0  ,  -2306.0, -1871.7  ,  -2498.0, -1831.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -2351.0  ,  -2114.0, -2351.0  ,  -2114.0, -1872.7  ,  -2306.0, -1871.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -2351.0  ,  -1922.0, -2351.0  ,  -1922.0, -1875.7  ,  -2114.0, -1872.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -2351.0  ,  -1730.0, -2351.0  ,  -1730.0, -1880.2  ,  -1922.0, -1875.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -2351.0  ,  -1538.0, -2351.0  ,  -1538.0, -1876.0  ,  -1730.0, -1880.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -2351.0  ,  -1346.0, -2351.0  ,  -1346.0, -1870.7  ,  -1538.0, -1876.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -2351.0  ,  -1154.0, -2351.0  ,  -1154.0, -1866.2  ,  -1346.0, -1870.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -2351.0  ,  -962.0, -2351.0  ,  -962.0, -1863.1  ,  -1154.0, -1866.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -2351.0  ,  -770.0, -2351.0  ,  -770.0, -1862.1  ,  -962.0, -1863.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -2351.0  ,  -578.0, -2351.0  ,  -578.0, -1859.5  ,  -770.0, -1862.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -2351.0  ,  -386.0, -2351.0  ,  -386.0, -1852.2  ,  -578.0, -1859.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -2351.0  ,  -194.0, -2351.0  ,  -194.0, -1841.2  ,  -386.0, -1852.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -2351.0  ,  -2.0, -2351.0  ,  -2.0, -1790.7  ,  -194.0, -1841.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -2351.0  ,  190.0, -2351.0  ,  190.0, -1691.7  ,  -2.0, -1790.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -2351.0  ,  382.0, -2351.0  ,  382.0, -1635.6  ,  190.0, -1691.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -2351.0  ,  574.0, -2351.0  ,  574.0, -1650.3  ,  382.0, -1635.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -2351.0  ,  766.0, -2351.0  ,  766.0, -1736.0  ,  574.0, -1650.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, -2351.0  ,  958.0, -2351.0  ,  958.0, -1794.9  ,  766.0, -1736.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, -2351.0  ,  1150.0, -2351.0  ,  1150.0, -1796.6  ,  958.0, -1794.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, -2351.0  ,  1342.0, -2351.0  ,  1342.0, -1799.2  ,  1150.0, -1796.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, -2351.0  ,  1534.0, -2351.0  ,  1534.0, -1802.2  ,  1342.0, -1799.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, -2351.0  ,  1726.0, -2351.0  ,  1726.0, -1805.2  ,  1534.0, -1802.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, -2351.0  ,  1918.0, -2351.0  ,  1918.0, -1749.5  ,  1726.0, -1805.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, -2351.0  ,  2110.0, -2351.0  ,  2110.0, -1714.8  ,  1918.0, -1749.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, -2351.0  ,  2302.0, -2351.0  ,  2302.0, -1699.8  ,  2110.0, -1714.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, -2351.0  ,  2494.0, -2351.0  ,  2494.0, -1647.4  ,  2302.0, -1699.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, -2351.0  ,  2686.0, -2351.0  ,  2686.0, -1573.8  ,  2494.0, -1647.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, -2351.0  ,  2878.0, -2351.0  ,  2878.0, -1508.1  ,  2686.0, -1573.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, -2351.0  ,  3070.0, -2351.0  ,  3070.0, -1470.4  ,  2878.0, -1508.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, -2351.0  ,  3262.0, -2351.0  ,  3262.0, -1451.6  ,  3070.0, -1470.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, -2351.0  ,  3454.0, -2351.0  ,  3454.0, -1446.3  ,  3262.0, -1451.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, -2351.0  ,  3646.0, -2351.0  ,  3646.0, -1447.8  ,  3454.0, -1446.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, -2351.0  ,  3838.0, -2351.0  ,  3838.0, -1449.3  ,  3646.0, -1447.8  }
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
