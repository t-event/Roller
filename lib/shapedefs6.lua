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
                    shape = {   -3840.0, 2351.0  ,  -3786.0, 1505.6  ,  -3786.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3786.0, 1505.6  ,  -3732.0, -324.0  ,  -3732.0, 2351.0  ,  -3786.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3732.0, -324.0  ,  -3678.0, -1625.7  ,  -3678.0, 2351.0  ,  -3732.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3678.0, -1625.7  ,  -3650.0, -1720.7  ,  -3650.0, 2351.0  ,  -3678.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1720.7  ,  -3624.0, -1716.4  ,  -3624.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3624.0, -1716.4  ,  -3570.0, -1706.6  ,  -3570.0, 2351.0  ,  -3624.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3570.0, -1706.6  ,  -3516.0, -1694.3  ,  -3516.0, 2351.0  ,  -3570.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3516.0, -1694.3  ,  -3460.0, -1680.0  ,  -3460.0, 2351.0  ,  -3516.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3460.0, -1680.0  ,  -3458.0, -1679.5  ,  -3458.0, 2351.0  ,  -3460.0, 2351.0  }
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
                    shape = {   -1922.0, -964.6  ,  -1828.0, -893.9  ,  -1828.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1828.0, -893.9  ,  -1772.0, -860.8  ,  -1772.0, 2351.0  ,  -1828.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1772.0, -860.8  ,  -1730.0, -837.7  ,  -1730.0, 2351.0  ,  -1772.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -837.7  ,  -1714.0, -828.8  ,  -1714.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1714.0, -828.8  ,  -1688.0, -813.9  ,  -1688.0, 2351.0  ,  -1714.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1688.0, -813.9  ,  -1658.0, -795.7  ,  -1658.0, 2351.0  ,  -1688.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1658.0, -795.7  ,  -1632.0, -778.6  ,  -1632.0, 2351.0  ,  -1658.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1632.0, -778.6  ,  -1600.0, 2054.3  ,  -1600.0, 2351.0  ,  -1632.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1600.0, 2054.3  ,  -1574.0, 1350.0  ,  -1574.0, 2351.0  ,  -1600.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1574.0, 1350.0  ,  -1544.0, 347.1  ,  -1544.0, 2351.0  ,  -1574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1544.0, 347.1  ,  -1538.0, 159.6  ,  -1538.0, 2351.0  ,  -1544.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, 159.6  ,  -1518.0, -356.5  ,  -1518.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1518.0, -356.5  ,  -1486.0, -659.1  ,  -1486.0, 2351.0  ,  -1518.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1092.0, -480.5  ,  -1060.0, -172.2  ,  -1060.0, 2351.0  ,  -1092.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1060.0, -172.2  ,  -1034.0, 497.6  ,  -1034.0, 2351.0  ,  -1060.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1034.0, 497.6  ,  -1004.0, 1433.3  ,  -1004.0, 2351.0  ,  -1034.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1004.0, 1433.3  ,  -978.0, 2081.1  ,  -978.0, 2351.0  ,  -1004.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -978.0, 2081.1  ,  -962.0, 2300.1  ,  -962.0, 2351.0  ,  -978.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, 2300.1  ,  -946.0, -468.2  ,  -946.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -946.0, -468.2  ,  -920.0, -462.7  ,  -920.0, 2351.0  ,  -946.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -920.0, -462.7  ,  -888.0, -456.2  ,  -888.0, 2351.0  ,  -920.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -888.0, -456.2  ,  -864.0, -451.5  ,  -864.0, 2351.0  ,  -888.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -864.0, -451.5  ,  -806.0, -441.0  ,  -806.0, 2351.0  ,  -864.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -806.0, -441.0  ,  -770.0, -435.0  ,  -770.0, 2351.0  ,  -806.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -435.0  ,  -748.0, -431.5  ,  -748.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -748.0, -431.5  ,  -578.0, -403.8  ,  -578.0, 2351.0  ,  -748.0, 2351.0  }
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
                    shape = {   382.0, -0.2  ,  414.0, 17.7  ,  414.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   414.0, 17.7  ,  472.0, 49.7  ,  472.0, 2351.0  ,  414.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   472.0, 49.7  ,  528.0, 81.1  ,  528.0, 2351.0  ,  472.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   528.0, 81.1  ,  554.0, 96.2  ,  554.0, 2351.0  ,  528.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   554.0, 96.2  ,  574.0, 108.0  ,  574.0, 2351.0  ,  554.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 108.0  ,  586.0, 115.2  ,  586.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   586.0, 115.2  ,  612.0, 131.3  ,  612.0, 2351.0  ,  586.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   612.0, 131.3  ,  642.0, 2169.0  ,  642.0, 2351.0  ,  612.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   642.0, 2169.0  ,  668.0, 1688.3  ,  668.0, 2351.0  ,  642.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   668.0, 1688.3  ,  700.0, 935.7  ,  700.0, 2351.0  ,  668.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   700.0, 935.7  ,  726.0, 440.0  ,  726.0, 2351.0  ,  700.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   726.0, 440.0  ,  758.0, 227.5  ,  758.0, 2351.0  ,  726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1152.0, 458.8  ,  1182.0, 652.3  ,  1182.0, 2351.0  ,  1152.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1182.0, 652.3  ,  1208.0, 1090.1  ,  1208.0, 2351.0  ,  1182.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1208.0, 1090.1  ,  1240.0, 1750.5  ,  1240.0, 2351.0  ,  1208.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1240.0, 1750.5  ,  1266.0, 2175.3  ,  1266.0, 2351.0  ,  1240.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1266.0, 2175.3  ,  1298.0, 524.9  ,  1298.0, 2351.0  ,  1266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1298.0, 524.9  ,  1322.0, 535.4  ,  1322.0, 2351.0  ,  1298.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1322.0, 535.4  ,  1342.0, 544.2  ,  1342.0, 2351.0  ,  1322.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 544.2  ,  1354.0, 549.4  ,  1354.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1354.0, 549.4  ,  1380.0, 560.8  ,  1380.0, 2351.0  ,  1354.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1380.0, 560.8  ,  1438.0, 585.4  ,  1438.0, 2351.0  ,  1380.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1438.0, 585.4  ,  1494.0, 607.5  ,  1494.0, 2351.0  ,  1438.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1494.0, 607.5  ,  1534.0, 621.6  ,  1534.0, 2351.0  ,  1494.0, 2351.0  }
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
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2351.0  ,  -3650.0, -2351.0  ,  -3650.0, -2239.5  ,  -3840.0, -2304.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -2119.9  ,  -3650.0, -2239.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -2005.8  ,  -3458.0, -2119.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -1901.8  ,  -3266.0, -2005.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -3040.0, -2351.0  ,  -3040.0, -1890.0  ,  -3074.0, -1901.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3040.0, -2351.0  ,  -2984.0, -2351.0  ,  -2984.0, -1875.7  ,  -3040.0, -1890.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2984.0, -2351.0  ,  -2926.0, -2351.0  ,  -2926.0, -1868.0  ,  -2984.0, -1875.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2926.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -1866.9  ,  -2926.0, -1868.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2870.0, -2351.0  ,  -2870.0, -1867.3  ,  -2882.0, -1866.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2870.0, -2351.0  ,  -2812.0, -2351.0  ,  -2812.0, -1872.7  ,  -2870.0, -1867.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2812.0, -2351.0  ,  -2756.0, -2351.0  ,  -2756.0, -1878.3  ,  -2812.0, -1872.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2756.0, -2351.0  ,  -2698.0, -2351.0  ,  -2698.0, -1877.9  ,  -2756.0, -1878.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2698.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -1877.2  ,  -2698.0, -1877.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2640.0, -2351.0  ,  -2640.0, -1873.1  ,  -2690.0, -1877.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2640.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1864.1  ,  -2640.0, -1873.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -2351.0  ,  -2306.0, -2351.0  ,  -2306.0, -1859.5  ,  -2498.0, -1864.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -2351.0  ,  -2114.0, -2351.0  ,  -2114.0, -1846.4  ,  -2306.0, -1859.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -2351.0  ,  -1922.0, -2351.0  ,  -1922.0, -1808.6  ,  -2114.0, -1846.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -2351.0  ,  -1730.0, -2351.0  ,  -1730.0, -1751.8  ,  -1922.0, -1808.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -2351.0  ,  -1538.0, -2351.0  ,  -1538.0, -1684.7  ,  -1730.0, -1751.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -2351.0  ,  -1346.0, -2351.0  ,  -1346.0, -1617.6  ,  -1538.0, -1684.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -2351.0  ,  -1154.0, -2351.0  ,  -1154.0, -1560.6  ,  -1346.0, -1617.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -2351.0  ,  -962.0, -2351.0  ,  -962.0, -1522.5  ,  -1154.0, -1560.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -2351.0  ,  -770.0, -2351.0  ,  -770.0, -1509.0  ,  -962.0, -1522.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -2351.0  ,  -578.0, -2351.0  ,  -578.0, -1530.9  ,  -770.0, -1509.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -2351.0  ,  -386.0, -2351.0  ,  -386.0, -1593.9  ,  -578.0, -1530.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -2351.0  ,  -194.0, -2351.0  ,  -194.0, -1688.3  ,  -386.0, -1593.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -2351.0  ,  -2.0, -2351.0  ,  -2.0, -1799.9  ,  -194.0, -1688.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -2351.0  ,  190.0, -2351.0  ,  190.0, -1850.1  ,  -2.0, -1799.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -2351.0  ,  382.0, -2351.0  ,  382.0, -1755.4  ,  190.0, -1850.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -2351.0  ,  574.0, -2351.0  ,  574.0, -1692.0  ,  382.0, -1755.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -2351.0  ,  766.0, -2351.0  ,  766.0, -1669.6  ,  574.0, -1692.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, -2351.0  ,  958.0, -2351.0  ,  958.0, -1666.2  ,  766.0, -1669.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, -2351.0  ,  1150.0, -2351.0  ,  1150.0, -1656.4  ,  958.0, -1666.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, -2351.0  ,  1342.0, -2351.0  ,  1342.0, -1641.8  ,  1150.0, -1656.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, -2351.0  ,  1534.0, -2351.0  ,  1534.0, -1624.4  ,  1342.0, -1641.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, -2351.0  ,  1726.0, -2351.0  ,  1726.0, -1607.1  ,  1534.0, -1624.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, -2351.0  ,  1918.0, -2351.0  ,  1918.0, -1592.4  ,  1726.0, -1607.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, -2351.0  ,  2110.0, -2351.0  ,  2110.0, -1582.6  ,  1918.0, -1592.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, -2351.0  ,  2302.0, -2351.0  ,  2302.0, -1579.1  ,  2110.0, -1582.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, -2351.0  ,  2494.0, -2351.0  ,  2494.0, -1515.5  ,  2302.0, -1579.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, -2351.0  ,  2686.0, -2351.0  ,  2686.0, -1400.9  ,  2494.0, -1515.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, -2351.0  ,  2878.0, -2351.0  ,  2878.0, -1322.8  ,  2686.0, -1400.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, -2351.0  ,  3070.0, -2351.0  ,  3070.0, -1315.5  ,  2878.0, -1322.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, -2351.0  ,  3262.0, -2351.0  ,  3262.0, -1358.6  ,  3070.0, -1315.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, -2351.0  ,  3454.0, -2351.0  ,  3454.0, -1426.5  ,  3262.0, -1358.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, -2351.0  ,  3646.0, -2351.0  ,  3646.0, -1486.8  ,  3454.0, -1426.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, -2351.0  ,  3838.0, -2351.0  ,  3838.0, -1510.7  ,  3646.0, -1486.8  }
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
                    shape = {   -2114.0, -1018.1  ,  -2052.0, -1014.1  ,  -2052.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2052.0, -1014.1  ,  -1994.0, -1008.7  ,  -1994.0, 2351.0  ,  -2052.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1994.0, -1008.7  ,  -1936.0, -998.1  ,  -1936.0, 2351.0  ,  -1994.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1936.0, -998.1  ,  -1922.0, -994.5  ,  -1922.0, 2351.0  ,  -1936.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -994.5  ,  -1912.0, -991.8  ,  -1912.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1912.0, -991.8  ,  -1880.0, -984.2  ,  -1880.0, 2351.0  ,  -1912.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1880.0, -984.2  ,  -1854.0, -979.1  ,  -1854.0, 2351.0  ,  -1880.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1854.0, -979.1  ,  -1822.0, 2033.5  ,  -1822.0, 2351.0  ,  -1854.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1822.0, 2033.5  ,  -1796.0, 1273.8  ,  -1796.0, 2351.0  ,  -1822.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1796.0, 1273.8  ,  -1766.0, 179.6  ,  -1766.0, 2351.0  ,  -1796.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1766.0, 179.6  ,  -1740.0, -601.8  ,  -1740.0, 2351.0  ,  -1766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1740.0, -601.8  ,  -1730.0, -797.9  ,  -1730.0, 2351.0  ,  -1740.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -797.9  ,  -1708.0, -958.8  ,  -1708.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1314.0, -768.8  ,  -1282.0, -414.8  ,  -1282.0, 2351.0  ,  -1314.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1282.0, -414.8  ,  -1256.0, 325.9  ,  -1256.0, 2351.0  ,  -1282.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1256.0, 325.9  ,  -1226.0, 1350.7  ,  -1226.0, 2351.0  ,  -1256.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1226.0, 1350.7  ,  -1200.0, 2057.1  ,  -1200.0, 2351.0  ,  -1226.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1200.0, 2057.1  ,  -1168.0, -720.9  ,  -1168.0, 2351.0  ,  -1200.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1168.0, -720.9  ,  -1154.0, -718.7  ,  -1154.0, 2351.0  ,  -1168.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -718.7  ,  -1142.0, -716.9  ,  -1142.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1142.0, -716.9  ,  -1112.0, -712.7  ,  -1112.0, 2351.0  ,  -1142.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1112.0, -712.7  ,  -1086.0, -708.7  ,  -1086.0, 2351.0  ,  -1112.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1086.0, -708.7  ,  -1028.0, -696.3  ,  -1028.0, 2351.0  ,  -1086.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1028.0, -696.3  ,  -972.0, -676.2  ,  -972.0, 2351.0  ,  -1028.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -972.0, -676.2  ,  -962.0, -671.5  ,  -962.0, 2351.0  ,  -972.0, 2351.0  }
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
                    shape = {   382.0, 43.5  ,  568.0, 133.5  ,  568.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   568.0, 133.5  ,  574.0, 136.5  ,  574.0, 2351.0  ,  568.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 136.5  ,  626.0, 162.9  ,  626.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   626.0, 162.9  ,  682.0, 193.2  ,  682.0, 2351.0  ,  626.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   682.0, 193.2  ,  708.0, 208.3  ,  708.0, 2351.0  ,  682.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   708.0, 208.3  ,  740.0, 227.7  ,  740.0, 2351.0  ,  708.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   740.0, 227.7  ,  766.0, 243.9  ,  766.0, 2351.0  ,  740.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 243.9  ,  798.0, 2151.7  ,  798.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   798.0, 2151.7  ,  822.0, 1722.3  ,  822.0, 2351.0  ,  798.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   822.0, 1722.3  ,  854.0, 1008.0  ,  854.0, 2351.0  ,  822.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   854.0, 1008.0  ,  880.0, 536.9  ,  880.0, 2351.0  ,  854.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   880.0, 536.9  ,  912.0, 333.1  ,  912.0, 2351.0  ,  880.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1306.0, 484.6  ,  1338.0, 701.9  ,  1338.0, 2351.0  ,  1306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1338.0, 701.9  ,  1342.0, 758.2  ,  1342.0, 2351.0  ,  1338.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 758.2  ,  1362.0, 1108.5  ,  1362.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1362.0, 1108.5  ,  1394.0, 1760.2  ,  1394.0, 2351.0  ,  1362.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1394.0, 1760.2  ,  1420.0, 2178.5  ,  1420.0, 2351.0  ,  1394.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1420.0, 2178.5  ,  1452.0, 563.0  ,  1452.0, 2351.0  ,  1420.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1452.0, 563.0  ,  1478.0, 578.9  ,  1478.0, 2351.0  ,  1452.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1478.0, 578.9  ,  1508.0, 598.0  ,  1508.0, 2351.0  ,  1478.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1508.0, 598.0  ,  1534.0, 615.0  ,  1534.0, 2351.0  ,  1508.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 615.0  ,  1592.0, 654.3  ,  1592.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1592.0, 654.3  ,  1648.0, 694.3  ,  1648.0, 2351.0  ,  1592.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1648.0, 694.3  ,  1726.0, 754.0  ,  1726.0, 2351.0  ,  1648.0, 2351.0  }
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
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2351.0  ,  -3650.0, -2351.0  ,  -3650.0, -1431.2  ,  -3840.0, -1395.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -1534.1  ,  -3650.0, -1431.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -1688.5  ,  -3458.0, -1534.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -1871.1  ,  -3266.0, -1688.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -1707.7  ,  -3074.0, -1871.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -1552.5  ,  -2882.0, -1707.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1448.5  ,  -2690.0, -1552.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -2351.0  ,  -2306.0, -2351.0  ,  -2306.0, -1411.6  ,  -2498.0, -1448.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -2351.0  ,  -2114.0, -2351.0  ,  -2114.0, -1436.3  ,  -2306.0, -1411.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -2351.0  ,  -1922.0, -2351.0  ,  -1922.0, -1507.6  ,  -2114.0, -1436.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -2351.0  ,  -1730.0, -2351.0  ,  -1730.0, -1614.6  ,  -1922.0, -1507.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -2351.0  ,  -1538.0, -2351.0  ,  -1538.0, -1639.6  ,  -1730.0, -1614.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -2351.0  ,  -1346.0, -2351.0  ,  -1346.0, -1656.9  ,  -1538.0, -1639.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -2351.0  ,  -1154.0, -2351.0  ,  -1154.0, -1600.1  ,  -1346.0, -1656.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -2351.0  ,  -962.0, -2351.0  ,  -962.0, -1680.8  ,  -1154.0, -1600.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -2351.0  ,  -770.0, -2351.0  ,  -770.0, -1689.2  ,  -962.0, -1680.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -2351.0  ,  -578.0, -2351.0  ,  -578.0, -1692.7  ,  -770.0, -1689.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -2351.0  ,  -386.0, -2351.0  ,  -386.0, -1702.7  ,  -578.0, -1692.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -2351.0  ,  -194.0, -2351.0  ,  -194.0, -1717.7  ,  -386.0, -1702.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -2351.0  ,  -2.0, -2351.0  ,  -2.0, -1678.6  ,  -194.0, -1717.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -2351.0  ,  190.0, -2351.0  ,  190.0, -1408.4  ,  -2.0, -1678.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -2351.0  ,  382.0, -2351.0  ,  382.0, -1272.7  ,  190.0, -1408.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -2351.0  ,  574.0, -2351.0  ,  574.0, -1315.0  ,  382.0, -1272.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -2351.0  ,  766.0, -2351.0  ,  766.0, -1459.6  ,  574.0, -1315.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, -2351.0  ,  958.0, -2351.0  ,  958.0, -1635.2  ,  766.0, -1459.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, -2351.0  ,  1150.0, -2351.0  ,  1150.0, -1755.4  ,  958.0, -1635.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, -2351.0  ,  1342.0, -2351.0  ,  1342.0, -1746.4  ,  1150.0, -1755.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, -2351.0  ,  1534.0, -2351.0  ,  1534.0, -1724.4  ,  1342.0, -1746.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, -2351.0  ,  1726.0, -2351.0  ,  1726.0, -1702.5  ,  1534.0, -1724.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, -2351.0  ,  1918.0, -2351.0  ,  1918.0, -1683.9  ,  1726.0, -1702.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, -2351.0  ,  2110.0, -2351.0  ,  2110.0, -1671.5  ,  1918.0, -1683.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, -2351.0  ,  2302.0, -2351.0  ,  2302.0, -1667.1  ,  2110.0, -1671.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, -2351.0  ,  2494.0, -2351.0  ,  2494.0, -1663.8  ,  2302.0, -1667.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, -2351.0  ,  2686.0, -2351.0  ,  2686.0, -1654.5  ,  2494.0, -1663.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, -2351.0  ,  2878.0, -2351.0  ,  2878.0, -1640.5  ,  2686.0, -1654.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, -2351.0  ,  3070.0, -2351.0  ,  3070.0, -1624.0  ,  2878.0, -1640.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, -2351.0  ,  3262.0, -2351.0  ,  3262.0, -1607.5  ,  3070.0, -1624.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, -2351.0  ,  3454.0, -2351.0  ,  3454.0, -1593.5  ,  3262.0, -1607.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, -2351.0  ,  3646.0, -2351.0  ,  3646.0, -1584.2  ,  3454.0, -1593.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, -2351.0  ,  3838.0, -2351.0  ,  3838.0, -1580.9  ,  3646.0, -1584.2  }
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
                    shape = {   -2114.0, -1148.4  ,  -1972.0, -1102.5  ,  -1972.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1972.0, -1102.5  ,  -1922.0, -1084.7  ,  -1922.0, 2351.0  ,  -1972.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -1084.7  ,  -1916.0, -1082.4  ,  -1916.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1916.0, -1082.4  ,  -1858.0, -1055.9  ,  -1858.0, 2351.0  ,  -1916.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1858.0, -1055.9  ,  -1832.0, -1041.6  ,  -1832.0, 2351.0  ,  -1858.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1832.0, -1041.6  ,  -1802.0, -1023.7  ,  -1802.0, 2351.0  ,  -1832.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1802.0, -1023.7  ,  -1776.0, -1007.4  ,  -1776.0, 2351.0  ,  -1802.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1776.0, -1007.4  ,  -1744.0, 2032.3  ,  -1744.0, 2351.0  ,  -1776.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1744.0, 2032.3  ,  -1730.0, 1664.8  ,  -1730.0, 2351.0  ,  -1744.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, 1664.8  ,  -1718.0, 1273.8  ,  -1718.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1718.0, 1273.8  ,  -1686.0, 119.6  ,  -1686.0, 2351.0  ,  -1718.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1686.0, 119.6  ,  -1662.0, -579.3  ,  -1662.0, 2351.0  ,  -1686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1662.0, -579.3  ,  -1630.0, -922.1  ,  -1630.0, 2351.0  ,  -1662.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1236.0, -775.2  ,  -1204.0, -422.6  ,  -1204.0, 2351.0  ,  -1236.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1204.0, -422.6  ,  -1178.0, 320.2  ,  -1178.0, 2351.0  ,  -1204.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1178.0, 320.2  ,  -1154.0, 1148.6  ,  -1154.0, 2351.0  ,  -1178.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, 1148.6  ,  -1146.0, 1413.3  ,  -1146.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1146.0, 1413.3  ,  -1122.0, 2056.9  ,  -1122.0, 2351.0  ,  -1146.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1122.0, 2056.9  ,  -1090.0, -714.1  ,  -1090.0, 2351.0  ,  -1122.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1090.0, -714.1  ,  -1064.0, -701.2  ,  -1064.0, 2351.0  ,  -1090.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1064.0, -701.2  ,  -1032.0, -683.4  ,  -1032.0, 2351.0  ,  -1064.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1032.0, -683.4  ,  -1006.0, -667.2  ,  -1006.0, 2351.0  ,  -1032.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1006.0, -667.2  ,  -962.0, -635.8  ,  -962.0, 2351.0  ,  -1006.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -635.8  ,  -950.0, -626.6  ,  -950.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -950.0, -626.6  ,  -892.0, -583.4  ,  -892.0, 2351.0  ,  -950.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -892.0, -583.4  ,  -770.0, -495.9  ,  -770.0, 2351.0  ,  -892.0, 2351.0  }
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
                    shape = {   574.0, 344.3  ,  632.0, 369.7  ,  632.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   632.0, 369.7  ,  688.0, 387.2  ,  688.0, 2351.0  ,  632.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   688.0, 387.2  ,  746.0, 403.3  ,  746.0, 2351.0  ,  688.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   746.0, 403.3  ,  766.0, 408.5  ,  766.0, 2351.0  ,  746.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 408.5  ,  772.0, 410.1  ,  772.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   772.0, 410.1  ,  804.0, 418.4  ,  804.0, 2351.0  ,  772.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   804.0, 418.4  ,  828.0, 424.7  ,  828.0, 2351.0  ,  804.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   828.0, 424.7  ,  860.0, 2167.9  ,  860.0, 2351.0  ,  828.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   860.0, 2167.9  ,  886.0, 1731.5  ,  886.0, 2351.0  ,  860.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   886.0, 1731.5  ,  918.0, 1067.0  ,  918.0, 2351.0  ,  886.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   918.0, 1067.0  ,  944.0, 640.1  ,  944.0, 2351.0  ,  918.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   944.0, 640.1  ,  958.0, 510.5  ,  958.0, 2351.0  ,  944.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 510.5  ,  974.0, 470.0  ,  974.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1368.0, 620.7  ,  1400.0, 822.3  ,  1400.0, 2351.0  ,  1368.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1400.0, 822.3  ,  1426.0, 1235.7  ,  1426.0, 2351.0  ,  1400.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1426.0, 1235.7  ,  1458.0, 1838.2  ,  1458.0, 2351.0  ,  1426.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1458.0, 1838.2  ,  1484.0, 2212.2  ,  1484.0, 2351.0  ,  1458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1484.0, 2212.2  ,  1514.0, 685.1  ,  1514.0, 2351.0  ,  1484.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1514.0, 685.1  ,  1534.0, 693.2  ,  1534.0, 2351.0  ,  1514.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 693.2  ,  1540.0, 695.6  ,  1540.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1540.0, 695.6  ,  1572.0, 707.9  ,  1572.0, 2351.0  ,  1540.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1572.0, 707.9  ,  1598.0, 717.3  ,  1598.0, 2351.0  ,  1572.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1598.0, 717.3  ,  1654.0, 735.0  ,  1654.0, 2351.0  ,  1598.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1654.0, 735.0  ,  1712.0, 749.8  ,  1712.0, 2351.0  ,  1654.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1712.0, 749.8  ,  1726.0, 753.0  ,  1726.0, 2351.0  ,  1712.0, 2351.0  }
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
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2351.0  ,  -3650.0, -2351.0  ,  -3650.0, -1698.0  ,  -3840.0, -1700.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -1691.1  ,  -3650.0, -1698.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -1680.8  ,  -3458.0, -1691.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -1668.6  ,  -3266.0, -1680.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -1656.4  ,  -3074.0, -1668.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -1646.1  ,  -2882.0, -1656.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1639.1  ,  -2690.0, -1646.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -2351.0  ,  -2306.0, -2351.0  ,  -2306.0, -1636.7  ,  -2498.0, -1639.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -2351.0  ,  -2114.0, -2351.0  ,  -2114.0, -1643.1  ,  -2306.0, -1636.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -2351.0  ,  -1922.0, -2351.0  ,  -1922.0, -1661.7  ,  -2114.0, -1643.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -2351.0  ,  -1730.0, -2351.0  ,  -1730.0, -1689.6  ,  -1922.0, -1661.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -2351.0  ,  -1538.0, -2351.0  ,  -1538.0, -1722.5  ,  -1730.0, -1689.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -2351.0  ,  -1346.0, -2351.0  ,  -1346.0, -1688.1  ,  -1538.0, -1722.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -2351.0  ,  -1154.0, -2351.0  ,  -1154.0, -1723.5  ,  -1346.0, -1688.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -2351.0  ,  -962.0, -2351.0  ,  -962.0, -1802.2  ,  -1154.0, -1723.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -2351.0  ,  -770.0, -2351.0  ,  -770.0, -1808.8  ,  -962.0, -1802.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -2351.0  ,  -578.0, -2351.0  ,  -578.0, -1804.9  ,  -770.0, -1808.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -2351.0  ,  -386.0, -2351.0  ,  -386.0, -1793.6  ,  -578.0, -1804.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -2351.0  ,  -194.0, -2351.0  ,  -194.0, -1776.7  ,  -386.0, -1793.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -2351.0  ,  -2.0, -2351.0  ,  -2.0, -1756.8  ,  -194.0, -1776.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -2351.0  ,  190.0, -2351.0  ,  190.0, -1736.8  ,  -2.0, -1756.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -2351.0  ,  382.0, -2351.0  ,  382.0, -1719.9  ,  190.0, -1736.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -2351.0  ,  574.0, -2351.0  ,  574.0, -1708.5  ,  382.0, -1719.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -2351.0  ,  766.0, -2351.0  ,  766.0, -1704.5  ,  574.0, -1708.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, -2351.0  ,  958.0, -2351.0  ,  958.0, -1720.1  ,  766.0, -1704.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, -2351.0  ,  1150.0, -2351.0  ,  1150.0, -1742.0  ,  958.0, -1720.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, -2351.0  ,  1342.0, -2351.0  ,  1342.0, -1788.2  ,  1150.0, -1742.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, -2351.0  ,  1534.0, -2351.0  ,  1534.0, -1792.7  ,  1342.0, -1788.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, -2351.0  ,  1726.0, -2351.0  ,  1726.0, -1687.8  ,  1534.0, -1792.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, -2351.0  ,  1918.0, -2351.0  ,  1918.0, -1596.3  ,  1726.0, -1687.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, -2351.0  ,  2110.0, -2351.0  ,  2110.0, -1540.2  ,  1918.0, -1596.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, -2351.0  ,  2302.0, -2351.0  ,  2302.0, -1523.4  ,  2110.0, -1540.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, -2351.0  ,  2494.0, -2351.0  ,  2494.0, -1539.9  ,  2302.0, -1523.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, -2351.0  ,  2686.0, -2351.0  ,  2686.0, -1591.0  ,  2494.0, -1539.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, -2351.0  ,  2878.0, -2351.0  ,  2878.0, -1670.1  ,  2686.0, -1591.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, -2351.0  ,  3070.0, -2351.0  ,  3070.0, -1741.7  ,  2878.0, -1670.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, -2351.0  ,  3262.0, -2351.0  ,  3262.0, -1676.0  ,  3070.0, -1741.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, -2351.0  ,  3454.0, -2351.0  ,  3454.0, -1642.4  ,  3262.0, -1676.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, -2351.0  ,  3646.0, -2351.0  ,  3646.0, -1630.5  ,  3454.0, -1642.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, -2351.0  ,  3838.0, -2351.0  ,  3838.0, -1617.1  ,  3646.0, -1630.5  }
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
                    shape = {   -2114.0, -1143.0  ,  -2086.0, -1127.5  ,  -2086.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2086.0, -1127.5  ,  -2030.0, -1096.2  ,  -2030.0, 2351.0  ,  -2086.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2030.0, -1096.2  ,  -1972.0, -1063.2  ,  -1972.0, 2351.0  ,  -2030.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1972.0, -1063.2  ,  -1946.0, -1048.1  ,  -1946.0, 2351.0  ,  -1972.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1946.0, -1048.1  ,  -1922.0, -1034.0  ,  -1922.0, 2351.0  ,  -1946.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -1034.0  ,  -1914.0, -1029.3  ,  -1914.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1914.0, -1029.3  ,  -1890.0, -1015.1  ,  -1890.0, 2351.0  ,  -1914.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1890.0, -1015.1  ,  -1858.0, 2031.4  ,  -1858.0, 2351.0  ,  -1890.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1858.0, 2031.4  ,  -1832.0, 1270.4  ,  -1832.0, 2351.0  ,  -1858.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1832.0, 1270.4  ,  -1800.0, 112.5  ,  -1800.0, 2351.0  ,  -1832.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1800.0, 112.5  ,  -1774.0, -631.8  ,  -1774.0, 2351.0  ,  -1800.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1774.0, -631.8  ,  -1744.0, -929.2  ,  -1744.0, 2351.0  ,  -1774.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -762.3  ,  -1318.0, -415.6  ,  -1318.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1318.0, -415.6  ,  -1292.0, 325.1  ,  -1292.0, 2351.0  ,  -1318.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1292.0, 325.1  ,  -1260.0, 1415.8  ,  -1260.0, 2351.0  ,  -1292.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1260.0, 1415.8  ,  -1234.0, 2097.1  ,  -1234.0, 2351.0  ,  -1260.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1234.0, 2097.1  ,  -1204.0, -705.4  ,  -1204.0, 2351.0  ,  -1234.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1204.0, -705.4  ,  -1178.0, -693.8  ,  -1178.0, 2351.0  ,  -1204.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1178.0, -693.8  ,  -1154.0, -683.1  ,  -1154.0, 2351.0  ,  -1178.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -683.1  ,  -1146.0, -679.6  ,  -1146.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1146.0, -679.6  ,  -1120.0, -668.3  ,  -1120.0, 2351.0  ,  -1146.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1120.0, -668.3  ,  -1064.0, -645.7  ,  -1064.0, 2351.0  ,  -1120.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1064.0, -645.7  ,  -1006.0, -625.9  ,  -1006.0, 2351.0  ,  -1064.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1006.0, -625.9  ,  -962.0, -614.0  ,  -962.0, 2351.0  ,  -1006.0, 2351.0  }
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
                    shape = {   574.0, -15.2  ,  692.0, 65.9  ,  692.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   692.0, 65.9  ,  748.0, 105.2  ,  748.0, 2351.0  ,  692.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   748.0, 105.2  ,  766.0, 117.7  ,  766.0, 2351.0  ,  748.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 117.7  ,  806.0, 145.1  ,  806.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   806.0, 145.1  ,  832.0, 162.7  ,  832.0, 2351.0  ,  806.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   832.0, 162.7  ,  862.0, 182.8  ,  862.0, 2351.0  ,  832.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   862.0, 182.8  ,  888.0, 200.0  ,  888.0, 2351.0  ,  862.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   888.0, 200.0  ,  920.0, 2147.6  ,  920.0, 2351.0  ,  888.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   920.0, 2147.6  ,  946.0, 1665.6  ,  946.0, 2351.0  ,  920.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   946.0, 1665.6  ,  958.0, 1392.5  ,  958.0, 2351.0  ,  946.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 1392.5  ,  978.0, 936.7  ,  978.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   978.0, 936.7  ,  1002.0, 499.4  ,  1002.0, 2351.0  ,  978.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1002.0, 499.4  ,  1034.0, 291.9  ,  1034.0, 2351.0  ,  1002.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1428.0, 497.9  ,  1460.0, 717.9  ,  1460.0, 2351.0  ,  1428.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1460.0, 717.9  ,  1486.0, 1162.1  ,  1486.0, 2351.0  ,  1460.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1486.0, 1162.1  ,  1518.0, 1805.9  ,  1518.0, 2351.0  ,  1486.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1518.0, 1805.9  ,  1534.0, 2075.1  ,  1534.0, 2351.0  ,  1518.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 2075.1  ,  1542.0, 2181.0  ,  1542.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1542.0, 2181.0  ,  1574.0, 590.3  ,  1574.0, 2351.0  ,  1542.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1574.0, 590.3  ,  1600.0, 606.3  ,  1600.0, 2351.0  ,  1574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1600.0, 606.3  ,  1632.0, 624.0  ,  1632.0, 2351.0  ,  1600.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1632.0, 624.0  ,  1658.0, 636.1  ,  1658.0, 2351.0  ,  1632.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1658.0, 636.1  ,  1714.0, 656.5  ,  1714.0, 2351.0  ,  1658.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1714.0, 656.5  ,  1726.0, 660.3  ,  1726.0, 2351.0  ,  1714.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 660.3  ,  1772.0, 673.8  ,  1772.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1772.0, 673.8  ,  1918.0, 739.7  ,  1918.0, 2351.0  ,  1772.0, 2351.0  }
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
                    shape = {   3454.0, 1292.1  ,  3458.0, 1292.4  ,  3458.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3458.0, 1292.4  ,  3512.0, 1298.0  ,  3512.0, 2351.0  ,  3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3512.0, 1298.0  ,  3566.0, 1306.0  ,  3566.0, 2351.0  ,  3512.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3566.0, 1306.0  ,  3620.0, 1316.4  ,  3620.0, 2351.0  ,  3566.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3620.0, 1316.4  ,  3646.0, 1322.3  ,  3646.0, 2351.0  ,  3620.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1322.3  ,  3674.0, 1344.6  ,  3674.0, 2351.0  ,  3646.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3674.0, 1344.6  ,  3728.0, 1659.9  ,  3728.0, 2351.0  ,  3674.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3728.0, 1659.9  ,  3782.0, 2119.1  ,  3782.0, 2351.0  ,  3728.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3782.0, 2119.1  ,  3838.0, 2350.7  ,  3838.0, 2351.0  ,  3782.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2351.0  ,  -3650.0, -2351.0  ,  -3650.0, -1584.6  ,  -3840.0, -1570.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -1609.3  ,  -3650.0, -1584.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -1611.2  ,  -3458.0, -1609.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -1647.1  ,  -3266.0, -1611.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -1714.0  ,  -3074.0, -1647.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -1707.5  ,  -2882.0, -1714.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1630.8  ,  -2690.0, -1707.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -2351.0  ,  -2306.0, -2351.0  ,  -2306.0, -1587.1  ,  -2498.0, -1630.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -2351.0  ,  -2114.0, -2351.0  ,  -2114.0, -1581.1  ,  -2306.0, -1587.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -2351.0  ,  -1922.0, -2351.0  ,  -1922.0, -1712.3  ,  -2114.0, -1581.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -2351.0  ,  -1730.0, -2351.0  ,  -1730.0, -1818.8  ,  -1922.0, -1712.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -2351.0  ,  -1538.0, -2351.0  ,  -1538.0, -1831.0  ,  -1730.0, -1818.8  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -2351.0  ,  -1346.0, -2351.0  ,  -1346.0, -1843.2  ,  -1538.0, -1831.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -2351.0  ,  -1154.0, -2351.0  ,  -1154.0, -1853.6  ,  -1346.0, -1843.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -2351.0  ,  -962.0, -2351.0  ,  -962.0, -1860.5  ,  -1154.0, -1853.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -2351.0  ,  -770.0, -2351.0  ,  -770.0, -1863.0  ,  -962.0, -1860.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -2351.0  ,  -578.0, -2351.0  ,  -578.0, -1856.4  ,  -770.0, -1863.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -2351.0  ,  -386.0, -2351.0  ,  -386.0, -1837.5  ,  -578.0, -1856.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -2351.0  ,  -194.0, -2351.0  ,  -194.0, -1809.1  ,  -386.0, -1837.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -2351.0  ,  -2.0, -2351.0  ,  -2.0, -1775.7  ,  -194.0, -1809.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -2351.0  ,  190.0, -2351.0  ,  190.0, -1724.1  ,  -2.0, -1775.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -2351.0  ,  382.0, -2351.0  ,  382.0, -1620.0  ,  190.0, -1724.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -2351.0  ,  574.0, -2351.0  ,  574.0, -1570.0  ,  382.0, -1620.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -2351.0  ,  766.0, -2351.0  ,  766.0, -1458.6  ,  574.0, -1570.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, -2351.0  ,  958.0, -2351.0  ,  958.0, -1339.7  ,  766.0, -1458.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, -2351.0  ,  1150.0, -2351.0  ,  1150.0, -1283.1  ,  958.0, -1339.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, -2351.0  ,  1342.0, -2351.0  ,  1342.0, -1332.0  ,  1150.0, -1283.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, -2351.0  ,  1534.0, -2351.0  ,  1534.0, -1511.3  ,  1342.0, -1332.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, -2351.0  ,  1726.0, -2351.0  ,  1726.0, -1621.2  ,  1534.0, -1511.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, -2351.0  ,  1918.0, -2351.0  ,  1918.0, -1732.2  ,  1726.0, -1621.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, -2351.0  ,  2110.0, -2351.0  ,  2110.0, -1701.7  ,  1918.0, -1732.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, -2351.0  ,  2302.0, -2351.0  ,  2302.0, -1686.9  ,  2110.0, -1701.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, -2351.0  ,  2494.0, -2351.0  ,  2494.0, -1690.2  ,  2302.0, -1686.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, -2351.0  ,  2686.0, -2351.0  ,  2686.0, -1699.4  ,  2494.0, -1690.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, -2351.0  ,  2878.0, -2351.0  ,  2878.0, -1713.1  ,  2686.0, -1699.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, -2351.0  ,  3070.0, -2351.0  ,  3070.0, -1729.4  ,  2878.0, -1713.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, -2351.0  ,  3262.0, -2351.0  ,  3262.0, -1745.6  ,  3070.0, -1729.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, -2351.0  ,  3454.0, -2351.0  ,  3454.0, -1759.4  ,  3262.0, -1745.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, -2351.0  ,  3646.0, -2351.0  ,  3646.0, -1768.6  ,  3454.0, -1759.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, -2351.0  ,  3838.0, -2351.0  ,  3838.0, -1771.8  ,  3646.0, -1768.6  }
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
