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
                    shape = {   -3840.0, 2351.0  ,  -3814.0, 2125.9  ,  -3814.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3814.0, 2125.9  ,  -3788.0, 1497.3  ,  -3788.0, 2351.0  ,  -3814.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3788.0, 1497.3  ,  -3760.0, 518.6  ,  -3760.0, 2351.0  ,  -3788.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3760.0, 518.6  ,  -3734.0, -470.4  ,  -3734.0, 2351.0  ,  -3760.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3734.0, -470.4  ,  -3708.0, -1326.5  ,  -3708.0, 2351.0  ,  -3734.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3708.0, -1326.5  ,  -3680.0, -1904.7  ,  -3680.0, 2351.0  ,  -3708.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3680.0, -1904.7  ,  -3654.0, -2020.2  ,  -3654.0, 2351.0  ,  -3680.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3654.0, -2020.2  ,  -3650.0, -2017.6  ,  -3650.0, 2351.0  ,  -3654.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2017.6  ,  -3628.0, -2002.7  ,  -3628.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3628.0, -2002.7  ,  -3600.0, -1982.1  ,  -3600.0, 2351.0  ,  -3628.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3600.0, -1982.1  ,  -3574.0, -1959.6  ,  -3574.0, 2351.0  ,  -3600.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3574.0, -1959.6  ,  -3548.0, -1933.5  ,  -3548.0, 2351.0  ,  -3574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3548.0, -1933.5  ,  -3520.0, -1904.9  ,  -3520.0, 2351.0  ,  -3548.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3520.0, -1904.9  ,  -3494.0, -1881.2  ,  -3494.0, 2351.0  ,  -3520.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3494.0, -1881.2  ,  -3468.0, -1861.7  ,  -3468.0, 2351.0  ,  -3494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3468.0, -1861.7  ,  -3458.0, -1854.0  ,  -3458.0, 2351.0  ,  -3468.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1854.0  ,  -3440.0, -1839.1  ,  -3440.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3440.0, -1839.1  ,  -3266.0, -1710.6  ,  -3266.0, 2351.0  ,  -3440.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1710.6  ,  -3074.0, -1567.7  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1567.7  ,  -2882.0, -1400.5  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1400.5  ,  -2690.0, -1253.1  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1253.1  ,  -2608.0, -1201.3  ,  -2608.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2608.0, -1201.3  ,  -2578.0, -1198.0  ,  -2578.0, 2351.0  ,  -2608.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2578.0, -1198.0  ,  -2548.0, -1192.0  ,  -2548.0, 2351.0  ,  -2578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2548.0, -1192.0  ,  -2520.0, -1182.3  ,  -2520.0, 2351.0  ,  -2548.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2520.0, -1182.3  ,  -2498.0, -1171.5  ,  -2498.0, 2351.0  ,  -2520.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1171.5  ,  -2490.0, -1166.7  ,  -2490.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2490.0, -1166.7  ,  -2460.0, -1144.4  ,  -2460.0, 2351.0  ,  -2490.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2460.0, -1144.4  ,  -2432.0, -1114.4  ,  -2432.0, 2351.0  ,  -2460.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2432.0, -1114.4  ,  -2402.0, -1062.2  ,  -2402.0, 2351.0  ,  -2432.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2402.0, -1062.2  ,  -2372.0, -1099.6  ,  -2372.0, 2351.0  ,  -2402.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2074.0, -677.0  ,  -2046.0, -726.6  ,  -2046.0, 2351.0  ,  -2074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2046.0, -726.6  ,  -2016.0, -759.2  ,  -2016.0, 2351.0  ,  -2046.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2016.0, -759.2  ,  -1986.0, -781.6  ,  -1986.0, 2351.0  ,  -2016.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1986.0, -781.6  ,  -1958.0, -796.3  ,  -1958.0, 2351.0  ,  -1986.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1958.0, -796.3  ,  -1928.0, -806.8  ,  -1928.0, 2351.0  ,  -1958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1928.0, -806.8  ,  -1922.0, -808.4  ,  -1922.0, 2351.0  ,  -1928.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -808.4  ,  -1898.0, -812.8  ,  -1898.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1898.0, -812.8  ,  -1870.0, -814.6  ,  -1870.0, 2351.0  ,  -1898.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1870.0, -814.6  ,  -1730.0, -705.6  ,  -1730.0, 2351.0  ,  -1870.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -705.6  ,  -1538.0, -591.6  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -591.6  ,  -1346.0, -499.9  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -499.9  ,  -1154.0, -408.4  ,  -1154.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -408.4  ,  -962.0, -393.2  ,  -962.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -393.2  ,  -770.0, -331.1  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -331.1  ,  -578.0, -262.5  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -262.5  ,  -386.0, -250.1  ,  -386.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -250.1  ,  -194.0, -213.9  ,  -194.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -213.9  ,  -2.0, -183.9  ,  -2.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -183.9  ,  190.0, -53.5  ,  190.0, 2351.0  ,  -2.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -53.5  ,  382.0, 104.5  ,  382.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, 104.5  ,  574.0, 174.1  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 174.1  ,  766.0, 321.6  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 321.6  ,  958.0, 473.5  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 473.5  ,  1150.0, 535.0  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 535.0  ,  1342.0, 591.4  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 591.4  ,  1534.0, 721.4  ,  1534.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 721.4  ,  1600.0, 745.6  ,  1600.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1600.0, 745.6  ,  1630.0, 747.8  ,  1630.0, 2351.0  ,  1600.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1630.0, 747.8  ,  1660.0, 753.8  ,  1660.0, 2351.0  ,  1630.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1660.0, 753.8  ,  1688.0, 763.5  ,  1688.0, 2351.0  ,  1660.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1688.0, 763.5  ,  1718.0, 779.0  ,  1718.0, 2351.0  ,  1688.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1718.0, 779.0  ,  1726.0, 784.3  ,  1726.0, 2351.0  ,  1718.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 784.3  ,  1748.0, 801.4  ,  1748.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1748.0, 801.4  ,  1776.0, 831.4  ,  1776.0, 2351.0  ,  1748.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1776.0, 831.4  ,  1806.0, 883.6  ,  1806.0, 2351.0  ,  1776.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1806.0, 883.6  ,  1836.0, 807.7  ,  1836.0, 2351.0  ,  1806.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2240.0, 1133.0  ,  2270.0, 1080.8  ,  2270.0, 2351.0  ,  2240.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2270.0, 1080.8  ,  2300.0, 1049.1  ,  2300.0, 2351.0  ,  2270.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2300.0, 1049.1  ,  2302.0, 1047.4  ,  2302.0, 2351.0  ,  2300.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 1047.4  ,  2328.0, 1028.5  ,  2328.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2328.0, 1028.5  ,  2358.0, 1012.9  ,  2358.0, 2351.0  ,  2328.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2358.0, 1012.9  ,  2388.0, 1002.6  ,  2388.0, 2351.0  ,  2358.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2388.0, 1002.6  ,  2416.0, 997.2  ,  2416.0, 2351.0  ,  2388.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2416.0, 997.2  ,  2446.0, 996.3  ,  2446.0, 2351.0  ,  2416.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2446.0, 996.3  ,  2494.0, 1018.7  ,  2494.0, 2351.0  ,  2446.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 1018.7  ,  2686.0, 1091.7  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 1091.7  ,  2878.0, 1135.4  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1135.4  ,  3070.0, 1291.1  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1291.1  ,  3262.0, 1410.7  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1410.7  ,  3454.0, 1442.1  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1442.1  ,  3646.0, 1489.2  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1489.2  ,  3838.0, 1555.3  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2351.0  ,  -3802.0, -2351.0  ,  -3802.0, -2336.9  ,  -3840.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3802.0, -2351.0  ,  -3754.0, -2351.0  ,  -3754.0, -2336.9  ,  -3802.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3754.0, -2351.0  ,  -3706.0, -2351.0  ,  -3706.0, -2336.9  ,  -3754.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3706.0, -2351.0  ,  -3658.0, -2351.0  ,  -3658.0, -2336.9  ,  -3706.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3658.0, -2351.0  ,  -3650.0, -2351.0  ,  -3650.0, -2336.9  ,  -3658.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2351.0  ,  -3630.0, -2351.0  ,  -3630.0, -2336.9  ,  -3650.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3630.0, -2351.0  ,  -3610.0, -2351.0  ,  -3610.0, -2336.9  ,  -3630.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3610.0, -2351.0  ,  -3582.0, -2351.0  ,  -3582.0, -2336.9  ,  -3610.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3582.0, -2351.0  ,  -3562.0, -2351.0  ,  -3562.0, -2336.9  ,  -3582.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3562.0, -2351.0  ,  -3534.0, -2351.0  ,  -3534.0, -2336.9  ,  -3562.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3534.0, -2351.0  ,  -3486.0, -2351.0  ,  -3486.0, -2336.9  ,  -3534.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3486.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -2336.9  ,  -3486.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3438.0, -2351.0  ,  -3438.0, -2336.9  ,  -3458.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3438.0, -2351.0  ,  -3390.0, -2351.0  ,  -3390.0, -2336.9  ,  -3438.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3390.0, -2351.0  ,  -3360.0, -2351.0  ,  -3360.0, -2336.9  ,  -3390.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3360.0, -2351.0  ,  -3312.0, -2351.0  ,  -3312.0, -2336.9  ,  -3360.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3312.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -2336.9  ,  -3312.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3264.0, -2351.0  ,  -3264.0, -2336.9  ,  -3266.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3264.0, -2351.0  ,  -3216.0, -2351.0  ,  -3216.0, -2336.7  ,  -3264.0, -2336.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3216.0, -2351.0  ,  -3168.0, -2351.0  ,  -3168.0, -2334.7  ,  -3216.0, -2336.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3168.0, -2351.0  ,  -3120.0, -2351.0  ,  -3120.0, -2330.0  ,  -3168.0, -2334.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3120.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -2321.6  ,  -3120.0, -2330.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -2235.6  ,  -3074.0, -2321.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -2057.0  ,  -2882.0, -2235.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1876.4  ,  -2690.0, -2057.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -2351.0  ,  -2306.0, -2351.0  ,  -2306.0, -1734.1  ,  -2498.0, -1876.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -2351.0  ,  -2160.0, -2351.0  ,  -2160.0, -1680.5  ,  -2306.0, -1734.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2160.0, -2351.0  ,  -2114.0, -2351.0  ,  -2114.0, -1677.2  ,  -2160.0, -1680.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -2351.0  ,  -2112.0, -2351.0  ,  -2112.0, -1677.2  ,  -2114.0, -1677.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2112.0, -2351.0  ,  -2064.0, -2351.0  ,  -2064.0, -1681.1  ,  -2112.0, -1677.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2064.0, -2351.0  ,  -2016.0, -2351.0  ,  -2016.0, -1691.5  ,  -2064.0, -1681.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2016.0, -2351.0  ,  -1968.0, -2351.0  ,  -1968.0, -1704.3  ,  -2016.0, -1691.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1968.0, -2351.0  ,  -1922.0, -2351.0  ,  -1922.0, -1718.0  ,  -1968.0, -1704.3  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -2351.0  ,  -1920.0, -2351.0  ,  -1920.0, -1718.6  ,  -1922.0, -1718.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1920.0, -2351.0  ,  -1730.0, -2351.0  ,  -1730.0, -1788.6  ,  -1920.0, -1718.6  }
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
                    shape = {   -3840.0, -1336.2  ,  -3650.0, -1285.7  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1285.7  ,  -3458.0, -1280.4  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1280.4  ,  -3266.0, -1226.3  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1226.3  ,  -3074.0, -1229.1  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1229.1  ,  -2882.0, -1156.8  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1156.8  ,  -2690.0, -1168.7  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1168.7  ,  -2570.0, -1135.8  ,  -2570.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2570.0, -1135.8  ,  -2542.0, -1134.0  ,  -2542.0, 2351.0  ,  -2570.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2542.0, -1134.0  ,  -2512.0, -1128.0  ,  -2512.0, 2351.0  ,  -2542.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2512.0, -1128.0  ,  -2498.0, -1123.7  ,  -2498.0, 2351.0  ,  -2512.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1123.7  ,  -2482.0, -1117.4  ,  -2482.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2482.0, -1117.4  ,  -2454.0, -1102.7  ,  -2454.0, 2351.0  ,  -2482.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2454.0, -1102.7  ,  -2424.0, -1080.3  ,  -2424.0, 2351.0  ,  -2454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2424.0, -1080.3  ,  -2394.0, -1047.8  ,  -2394.0, 2351.0  ,  -2424.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2394.0, -1047.8  ,  -2366.0, -998.1  ,  -2366.0, 2351.0  ,  -2394.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2366.0, -998.1  ,  -2336.0, -997.4  ,  -2336.0, 2351.0  ,  -2366.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2046.0, -620.7  ,  -2016.0, -673.0  ,  -2016.0, 2351.0  ,  -2046.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2016.0, -673.0  ,  -1986.0, -704.7  ,  -1986.0, 2351.0  ,  -2016.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1986.0, -704.7  ,  -1958.0, -725.3  ,  -1958.0, 2351.0  ,  -1986.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1958.0, -725.3  ,  -1928.0, -740.9  ,  -1928.0, 2351.0  ,  -1958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1928.0, -740.9  ,  -1922.0, -743.3  ,  -1922.0, 2351.0  ,  -1928.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -743.3  ,  -1898.0, -751.1  ,  -1898.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1898.0, -751.1  ,  -1870.0, -756.6  ,  -1870.0, 2351.0  ,  -1898.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1870.0, -756.6  ,  -1840.0, -757.7  ,  -1840.0, 2351.0  ,  -1870.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1840.0, -757.7  ,  -1730.0, -715.1  ,  -1730.0, 2351.0  ,  -1840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -715.1  ,  -1538.0, -620.6  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -620.6  ,  -1346.0, -532.6  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -532.6  ,  -1154.0, -458.7  ,  -1154.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -458.7  ,  -962.0, -424.3  ,  -962.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -424.3  ,  -770.0, -349.7  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -349.7  ,  -578.0, -287.7  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -287.7  ,  -516.0, -256.5  ,  -516.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -516.0, -256.5  ,  -486.0, -253.6  ,  -486.0, 2351.0  ,  -516.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -486.0, -253.6  ,  -456.0, -247.6  ,  -456.0, 2351.0  ,  -486.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -456.0, -247.6  ,  -428.0, -237.9  ,  -428.0, 2351.0  ,  -456.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -428.0, -237.9  ,  -398.0, -222.3  ,  -398.0, 2351.0  ,  -428.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -398.0, -222.3  ,  -386.0, -214.3  ,  -386.0, 2351.0  ,  -398.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -214.3  ,  -368.0, -200.0  ,  -368.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -368.0, -200.0  ,  -340.0, -170.0  ,  -340.0, 2351.0  ,  -368.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -340.0, -170.0  ,  -310.0, -117.8  ,  -310.0, 2351.0  ,  -340.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -310.0, -117.8  ,  -280.0, -148.9  ,  -280.0, 2351.0  ,  -310.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   164.0, 296.0  ,  190.0, 249.1  ,  190.0, 2351.0  ,  164.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, 249.1  ,  192.0, 246.4  ,  192.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   192.0, 246.4  ,  222.0, 213.8  ,  222.0, 2351.0  ,  192.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   222.0, 213.8  ,  252.0, 191.5  ,  252.0, 2351.0  ,  222.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   252.0, 191.5  ,  280.0, 176.8  ,  280.0, 2351.0  ,  252.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   280.0, 176.8  ,  310.0, 166.2  ,  310.0, 2351.0  ,  280.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   310.0, 166.2  ,  340.0, 160.2  ,  340.0, 2351.0  ,  310.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   340.0, 160.2  ,  368.0, 158.4  ,  368.0, 2351.0  ,  340.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   368.0, 158.4  ,  382.0, 162.6  ,  382.0, 2351.0  ,  368.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, 162.6  ,  574.0, 225.2  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 225.2  ,  766.0, 334.2  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 334.2  ,  958.0, 415.1  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 415.1  ,  1150.0, 538.5  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 538.5  ,  1342.0, 609.7  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 609.7  ,  1434.0, 632.5  ,  1434.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1434.0, 632.5  ,  1464.0, 634.9  ,  1464.0, 2351.0  ,  1434.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1464.0, 634.9  ,  1494.0, 640.9  ,  1494.0, 2351.0  ,  1464.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1494.0, 640.9  ,  1522.0, 650.6  ,  1522.0, 2351.0  ,  1494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1522.0, 650.6  ,  1534.0, 656.2  ,  1534.0, 2351.0  ,  1522.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 656.2  ,  1552.0, 666.2  ,  1552.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1552.0, 666.2  ,  1582.0, 688.5  ,  1582.0, 2351.0  ,  1552.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1582.0, 688.5  ,  1610.0, 718.5  ,  1610.0, 2351.0  ,  1582.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1610.0, 718.5  ,  1640.0, 770.8  ,  1640.0, 2351.0  ,  1610.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1640.0, 770.8  ,  1670.0, 710.1  ,  1670.0, 2351.0  ,  1640.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2010.0, 937.8  ,  2040.0, 885.6  ,  2040.0, 2351.0  ,  2010.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2040.0, 885.6  ,  2070.0, 853.9  ,  2070.0, 2351.0  ,  2040.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2070.0, 853.9  ,  2098.0, 833.3  ,  2098.0, 2351.0  ,  2070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2098.0, 833.3  ,  2110.0, 826.3  ,  2110.0, 2351.0  ,  2098.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, 826.3  ,  2128.0, 817.7  ,  2128.0, 2351.0  ,  2110.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2128.0, 817.7  ,  2158.0, 807.5  ,  2158.0, 2351.0  ,  2128.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2158.0, 807.5  ,  2186.0, 802.0  ,  2186.0, 2351.0  ,  2158.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2186.0, 802.0  ,  2216.0, 800.9  ,  2216.0, 2351.0  ,  2186.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2216.0, 800.9  ,  2302.0, 833.2  ,  2302.0, 2351.0  ,  2216.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 833.2  ,  2494.0, 903.7  ,  2494.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 903.7  ,  2686.0, 982.0  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 982.0  ,  2878.0, 1050.3  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1050.3  ,  3070.0, 1132.1  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1132.1  ,  3262.0, 1222.5  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1222.5  ,  3454.0, 1253.8  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1253.8  ,  3646.0, 1321.6  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1321.6  ,  3838.0, 1406.4  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
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
                    shape = {   -3840.0, -1463.7  ,  -3650.0, -1424.2  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1424.2  ,  -3458.0, -1373.2  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1373.2  ,  -3266.0, -1269.5  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1269.5  ,  -3074.0, -1250.7  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1250.7  ,  -2882.0, -1234.5  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1234.5  ,  -2690.0, -1093.9  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1093.9  ,  -2498.0, -1012.5  ,  -2498.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1012.5  ,  -2306.0, -995.2  ,  -2306.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -995.2  ,  -2114.0, -914.8  ,  -2114.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -914.8  ,  -1922.0, -817.9  ,  -1922.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -817.9  ,  -1850.0, -779.4  ,  -1850.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1850.0, -779.4  ,  -1822.0, -777.6  ,  -1822.0, 2351.0  ,  -1850.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1822.0, -777.6  ,  -1792.0, -771.6  ,  -1792.0, 2351.0  ,  -1822.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1792.0, -771.6  ,  -1762.0, -761.0  ,  -1762.0, 2351.0  ,  -1792.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1762.0, -761.0  ,  -1734.0, -746.3  ,  -1734.0, 2351.0  ,  -1762.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1734.0, -746.3  ,  -1730.0, -743.8  ,  -1730.0, 2351.0  ,  -1734.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -743.8  ,  -1704.0, -724.0  ,  -1704.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1704.0, -724.0  ,  -1674.0, -691.4  ,  -1674.0, 2351.0  ,  -1704.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1674.0, -691.4  ,  -1646.0, -641.8  ,  -1646.0, 2351.0  ,  -1674.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1646.0, -641.8  ,  -1616.0, -644.6  ,  -1616.0, 2351.0  ,  -1646.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1190.0, -303.5  ,  -1162.0, -353.2  ,  -1162.0, 2351.0  ,  -1190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1162.0, -353.2  ,  -1154.0, -363.2  ,  -1154.0, 2351.0  ,  -1162.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -363.2  ,  -1132.0, -385.7  ,  -1132.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1132.0, -385.7  ,  -1102.0, -408.1  ,  -1102.0, 2351.0  ,  -1132.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1102.0, -408.1  ,  -1074.0, -422.8  ,  -1074.0, 2351.0  ,  -1102.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1074.0, -422.8  ,  -1044.0, -433.4  ,  -1044.0, 2351.0  ,  -1074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1044.0, -433.4  ,  -1014.0, -439.4  ,  -1014.0, 2351.0  ,  -1044.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1014.0, -439.4  ,  -986.0, -441.2  ,  -986.0, 2351.0  ,  -1014.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -986.0, -441.2  ,  -962.0, -435.4  ,  -962.0, 2351.0  ,  -986.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -962.0, -435.4  ,  -770.0, -405.1  ,  -770.0, 2351.0  ,  -962.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -770.0, -405.1  ,  -578.0, -403.2  ,  -578.0, 2351.0  ,  -770.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -403.2  ,  -386.0, -371.7  ,  -386.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -371.7  ,  -304.0, -367.4  ,  -304.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -304.0, -367.4  ,  -274.0, -365.3  ,  -274.0, 2351.0  ,  -304.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -274.0, -365.3  ,  -246.0, -359.6  ,  -246.0, 2351.0  ,  -274.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -246.0, -359.6  ,  -216.0, -349.0  ,  -216.0, 2351.0  ,  -246.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -216.0, -349.0  ,  -194.0, -337.9  ,  -194.0, 2351.0  ,  -216.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -337.9  ,  -186.0, -333.1  ,  -186.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -186.0, -333.1  ,  -158.0, -312.0  ,  -158.0, 2351.0  ,  -186.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -158.0, -312.0  ,  -128.0, -279.4  ,  -128.0, 2351.0  ,  -158.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -128.0, -279.4  ,  -98.0, -224.6  ,  -98.0, 2351.0  ,  -128.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -98.0, -224.6  ,  -70.0, -281.6  ,  -70.0, 2351.0  ,  -98.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   226.0, 171.6  ,  256.0, 119.3  ,  256.0, 2351.0  ,  226.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   256.0, 119.3  ,  284.0, 89.4  ,  284.0, 2351.0  ,  256.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   284.0, 89.4  ,  314.0, 67.0  ,  314.0, 2351.0  ,  284.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   314.0, 67.0  ,  344.0, 51.5  ,  344.0, 2351.0  ,  314.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   344.0, 51.5  ,  372.0, 41.7  ,  372.0, 2351.0  ,  344.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   372.0, 41.7  ,  382.0, 39.2  ,  382.0, 2351.0  ,  372.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, 39.2  ,  402.0, 35.7  ,  402.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   402.0, 35.7  ,  432.0, 36.0  ,  432.0, 2351.0  ,  402.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   432.0, 36.0  ,  574.0, 135.5  ,  574.0, 2351.0  ,  432.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, 135.5  ,  766.0, 307.2  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 307.2  ,  958.0, 402.0  ,  958.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 402.0  ,  1150.0, 560.6  ,  1150.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1150.0, 560.6  ,  1342.0, 644.9  ,  1342.0, 2351.0  ,  1150.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1342.0, 644.9  ,  1534.0, 753.4  ,  1534.0, 2351.0  ,  1342.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 753.4  ,  1688.0, 769.4  ,  1688.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1688.0, 769.4  ,  1716.0, 771.2  ,  1716.0, 2351.0  ,  1688.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1716.0, 771.2  ,  1726.0, 772.7  ,  1726.0, 2351.0  ,  1716.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 772.7  ,  1746.0, 777.2  ,  1746.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1746.0, 777.2  ,  1776.0, 787.8  ,  1776.0, 2351.0  ,  1746.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1776.0, 787.8  ,  1804.0, 802.5  ,  1804.0, 2351.0  ,  1776.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1804.0, 802.5  ,  1834.0, 824.9  ,  1834.0, 2351.0  ,  1804.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1834.0, 824.9  ,  1864.0, 857.4  ,  1864.0, 2351.0  ,  1834.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1864.0, 857.4  ,  1892.0, 907.1  ,  1892.0, 2351.0  ,  1864.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1892.0, 907.1  ,  1918.0, 798.0  ,  1918.0, 2351.0  ,  1892.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2286.0, 1162.6  ,  2302.0, 1130.7  ,  2302.0, 2351.0  ,  2286.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 1130.7  ,  2314.0, 1113.0  ,  2314.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2314.0, 1113.0  ,  2344.0, 1080.4  ,  2344.0, 2351.0  ,  2314.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2344.0, 1080.4  ,  2374.0, 1058.1  ,  2374.0, 2351.0  ,  2344.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2374.0, 1058.1  ,  2402.0, 1043.4  ,  2402.0, 2351.0  ,  2374.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2402.0, 1043.4  ,  2432.0, 1032.8  ,  2432.0, 2351.0  ,  2402.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2432.0, 1032.8  ,  2462.0, 1026.8  ,  2462.0, 2351.0  ,  2432.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2462.0, 1026.8  ,  2490.0, 1025.0  ,  2490.0, 2351.0  ,  2462.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2490.0, 1025.0  ,  2494.0, 1026.3  ,  2494.0, 2351.0  ,  2490.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 1026.3  ,  2686.0, 1098.3  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 1098.3  ,  2878.0, 1119.8  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1119.8  ,  3070.0, 1218.5  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1218.5  ,  3262.0, 1286.1  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1286.1  ,  3454.0, 1286.0  ,  3454.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1286.0  ,  3646.0, 1352.4  ,  3646.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1352.4  ,  3838.0, 1472.3  ,  3838.0, 2351.0  ,  3646.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3840.0, -2351.0  ,  -3650.0, -2351.0  ,  -3650.0, -1864.2  ,  -3840.0, -1903.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -1813.2  ,  -3650.0, -1864.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -1709.5  ,  -3458.0, -1813.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -1690.7  ,  -3266.0, -1709.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -2888.0, -2351.0  ,  -2888.0, -1676.2  ,  -3074.0, -1690.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2888.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -1674.5  ,  -2888.0, -1676.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2840.0, -2351.0  ,  -2840.0, -1655.6  ,  -2882.0, -1674.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2840.0, -2351.0  ,  -2792.0, -2351.0  ,  -2792.0, -1623.6  ,  -2840.0, -1655.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2792.0, -2351.0  ,  -2744.0, -2351.0  ,  -2744.0, -1614.9  ,  -2792.0, -1623.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2744.0, -2351.0  ,  -2696.0, -2351.0  ,  -2696.0, -1630.4  ,  -2744.0, -1614.9  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2696.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -1632.5  ,  -2696.0, -1630.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2648.0, -2351.0  ,  -2648.0, -1648.1  ,  -2690.0, -1632.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2648.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1709.7  ,  -2648.0, -1648.1  }
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
                    shape = {   -3840.0, -2004.1  ,  -3650.0, -1890.9  ,  -3650.0, 2351.0  ,  -3840.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3650.0, -1890.9  ,  -3458.0, -1737.6  ,  -3458.0, 2351.0  ,  -3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -1737.6  ,  -3266.0, -1626.1  ,  -3266.0, 2351.0  ,  -3458.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -1626.1  ,  -3074.0, -1540.2  ,  -3074.0, 2351.0  ,  -3266.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -1540.2  ,  -2882.0, -1412.7  ,  -2882.0, 2351.0  ,  -3074.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -1412.7  ,  -2690.0, -1355.6  ,  -2690.0, 2351.0  ,  -2882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -1355.6  ,  -2498.0, -1251.5  ,  -2498.0, 2351.0  ,  -2690.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2498.0, -1251.5  ,  -2306.0, -1092.9  ,  -2306.0, 2351.0  ,  -2498.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2306.0, -1092.9  ,  -2114.0, -1016.5  ,  -2114.0, 2351.0  ,  -2306.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2114.0, -1016.5  ,  -1922.0, -939.8  ,  -1922.0, 2351.0  ,  -2114.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1922.0, -939.8  ,  -1730.0, -878.7  ,  -1730.0, 2351.0  ,  -1922.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1730.0, -878.7  ,  -1538.0, -773.6  ,  -1538.0, 2351.0  ,  -1730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1538.0, -773.6  ,  -1346.0, -620.4  ,  -1346.0, 2351.0  ,  -1538.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1346.0, -620.4  ,  -1224.0, -571.6  ,  -1224.0, 2351.0  ,  -1346.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1224.0, -571.6  ,  -1196.0, -569.8  ,  -1196.0, 2351.0  ,  -1224.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1196.0, -569.8  ,  -1166.0, -563.8  ,  -1166.0, 2351.0  ,  -1196.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1166.0, -563.8  ,  -1154.0, -560.2  ,  -1154.0, 2351.0  ,  -1166.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1154.0, -560.2  ,  -1136.0, -553.2  ,  -1136.0, 2351.0  ,  -1154.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1136.0, -553.2  ,  -1108.0, -538.5  ,  -1108.0, 2351.0  ,  -1136.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1108.0, -538.5  ,  -1078.0, -516.2  ,  -1078.0, 2351.0  ,  -1108.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1078.0, -516.2  ,  -1048.0, -483.6  ,  -1048.0, 2351.0  ,  -1078.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1048.0, -483.6  ,  -1020.0, -434.0  ,  -1020.0, 2351.0  ,  -1048.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1020.0, -434.0  ,  -990.0, -541.3  ,  -990.0, 2351.0  ,  -1020.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -658.0, -196.3  ,  -630.0, -245.9  ,  -630.0, 2351.0  ,  -658.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -630.0, -245.9  ,  -600.0, -278.5  ,  -600.0, 2351.0  ,  -630.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -600.0, -278.5  ,  -578.0, -295.7  ,  -578.0, 2351.0  ,  -600.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -578.0, -295.7  ,  -570.0, -300.9  ,  -570.0, 2351.0  ,  -578.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -570.0, -300.9  ,  -542.0, -315.6  ,  -542.0, 2351.0  ,  -570.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -542.0, -315.6  ,  -512.0, -326.2  ,  -512.0, 2351.0  ,  -542.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -512.0, -326.2  ,  -482.0, -332.1  ,  -482.0, 2351.0  ,  -512.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -482.0, -332.1  ,  -454.0, -333.9  ,  -454.0, 2351.0  ,  -482.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -454.0, -333.9  ,  -386.0, -300.5  ,  -386.0, 2351.0  ,  -454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -386.0, -300.5  ,  -194.0, -249.6  ,  -194.0, 2351.0  ,  -386.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -194.0, -249.6  ,  -2.0, -167.2  ,  -2.0, 2351.0  ,  -194.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2.0, -167.2  ,  190.0, -105.3  ,  190.0, 2351.0  ,  -2.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   190.0, -105.3  ,  382.0, -69.9  ,  382.0, 2351.0  ,  190.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   382.0, -69.9  ,  574.0, -15.5  ,  574.0, 2351.0  ,  382.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   574.0, -15.5  ,  766.0, 68.8  ,  766.0, 2351.0  ,  574.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   766.0, 68.8  ,  794.0, 82.5  ,  794.0, 2351.0  ,  766.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   794.0, 82.5  ,  824.0, 85.2  ,  824.0, 2351.0  ,  794.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   824.0, 85.2  ,  852.0, 90.7  ,  852.0, 2351.0  ,  824.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   852.0, 90.7  ,  882.0, 101.0  ,  882.0, 2351.0  ,  852.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   882.0, 101.0  ,  912.0, 116.5  ,  912.0, 2351.0  ,  882.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   912.0, 116.5  ,  940.0, 137.1  ,  940.0, 2351.0  ,  912.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   940.0, 137.1  ,  958.0, 154.6  ,  958.0, 2351.0  ,  940.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   958.0, 154.6  ,  970.0, 168.8  ,  970.0, 2351.0  ,  958.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   970.0, 168.8  ,  1000.0, 221.1  ,  1000.0, 2351.0  ,  970.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1000.0, 221.1  ,  1028.0, 185.4  ,  1028.0, 2351.0  ,  1000.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1526.0, 784.0  ,  1534.0, 766.4  ,  1534.0, 2351.0  ,  1526.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1534.0, 766.4  ,  1556.0, 731.7  ,  1556.0, 2351.0  ,  1534.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1556.0, 731.7  ,  1584.0, 701.8  ,  1584.0, 2351.0  ,  1556.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1584.0, 701.8  ,  1614.0, 679.4  ,  1614.0, 2351.0  ,  1584.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1614.0, 679.4  ,  1644.0, 663.8  ,  1644.0, 2351.0  ,  1614.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1644.0, 663.8  ,  1672.0, 654.1  ,  1672.0, 2351.0  ,  1644.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1672.0, 654.1  ,  1702.0, 648.1  ,  1702.0, 2351.0  ,  1672.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1702.0, 648.1  ,  1726.0, 646.4  ,  1726.0, 2351.0  ,  1702.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1726.0, 646.4  ,  1732.0, 647.5  ,  1732.0, 2351.0  ,  1726.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1732.0, 647.5  ,  1918.0, 826.2  ,  1918.0, 2351.0  ,  1732.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1918.0, 826.2  ,  2110.0, 1032.6  ,  2110.0, 2351.0  ,  1918.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2110.0, 1032.6  ,  2302.0, 1204.8  ,  2302.0, 2351.0  ,  2110.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2302.0, 1204.8  ,  2494.0, 1356.5  ,  2494.0, 2351.0  ,  2302.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2494.0, 1356.5  ,  2686.0, 1431.1  ,  2686.0, 2351.0  ,  2494.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2686.0, 1431.1  ,  2878.0, 1462.7  ,  2878.0, 2351.0  ,  2686.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   2878.0, 1462.7  ,  3070.0, 1497.1  ,  3070.0, 2351.0  ,  2878.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3070.0, 1497.1  ,  3262.0, 1499.3  ,  3262.0, 2351.0  ,  3070.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3262.0, 1499.3  ,  3438.0, 1459.1  ,  3438.0, 2351.0  ,  3262.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3438.0, 1459.1  ,  3454.0, 1453.0  ,  3454.0, 2351.0  ,  3438.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3454.0, 1453.0  ,  3464.0, 1450.6  ,  3464.0, 2351.0  ,  3454.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3464.0, 1450.6  ,  3490.0, 1450.1  ,  3490.0, 2351.0  ,  3464.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3490.0, 1450.1  ,  3518.0, 1457.3  ,  3518.0, 2351.0  ,  3490.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3518.0, 1457.3  ,  3544.0, 1469.4  ,  3544.0, 2351.0  ,  3518.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3544.0, 1469.4  ,  3570.0, 1484.2  ,  3570.0, 2351.0  ,  3544.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3570.0, 1484.2  ,  3598.0, 1500.0  ,  3598.0, 2351.0  ,  3570.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3598.0, 1500.0  ,  3624.0, 1514.3  ,  3624.0, 2351.0  ,  3598.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3624.0, 1514.3  ,  3646.0, 1526.9  ,  3646.0, 2351.0  ,  3624.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3646.0, 1526.9  ,  3650.0, 1529.3  ,  3650.0, 2351.0  ,  3646.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3650.0, 1529.3  ,  3678.0, 1566.4  ,  3678.0, 2351.0  ,  3650.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3678.0, 1566.4  ,  3704.0, 1674.6  ,  3704.0, 2351.0  ,  3678.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3704.0, 1674.6  ,  3730.0, 1836.0  ,  3730.0, 2351.0  ,  3704.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3730.0, 1836.0  ,  3758.0, 2030.8  ,  3758.0, 2351.0  ,  3730.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3758.0, 2030.8  ,  3784.0, 2192.1  ,  3784.0, 2351.0  ,  3758.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3784.0, 2192.1  ,  3810.0, 2304.0  ,  3810.0, 2351.0  ,  3784.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   3810.0, 2304.0  ,  3838.0, 2350.8  ,  3838.0, 2351.0  ,  3810.0, 2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3558.0, -2351.0  ,  -3532.0, -2351.0  ,  -3532.0, -2233.1  ,  -3558.0, -2351.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3532.0, -2351.0  ,  -3484.0, -2351.0  ,  -3484.0, -2192.5  ,  -3532.0, -2233.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3484.0, -2351.0  ,  -3458.0, -2351.0  ,  -3458.0, -2177.6  ,  -3484.0, -2192.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3458.0, -2351.0  ,  -3436.0, -2351.0  ,  -3436.0, -2167.0  ,  -3458.0, -2177.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3436.0, -2351.0  ,  -3266.0, -2351.0  ,  -3266.0, -2066.1  ,  -3436.0, -2167.0  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3266.0, -2351.0  ,  -3074.0, -2351.0  ,  -3074.0, -1980.2  ,  -3266.0, -2066.1  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -3074.0, -2351.0  ,  -2882.0, -2351.0  ,  -2882.0, -1852.7  ,  -3074.0, -1980.2  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2882.0, -2351.0  ,  -2752.0, -2351.0  ,  -2752.0, -1804.4  ,  -2882.0, -1852.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2752.0, -2351.0  ,  -2704.0, -2351.0  ,  -2704.0, -1796.6  ,  -2752.0, -1804.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2704.0, -2351.0  ,  -2690.0, -2351.0  ,  -2690.0, -1795.6  ,  -2704.0, -1796.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2690.0, -2351.0  ,  -2656.0, -2351.0  ,  -2656.0, -1790.7  ,  -2690.0, -1795.6  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2656.0, -2351.0  ,  -2608.0, -2351.0  ,  -2608.0, -1792.4  ,  -2656.0, -1790.7  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2608.0, -2351.0  ,  -2560.0, -2351.0  ,  -2560.0, -1809.5  ,  -2608.0, -1792.4  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2560.0, -2351.0  ,  -2512.0, -2351.0  ,  -2512.0, -1826.3  ,  -2560.0, -1809.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -2512.0, -2351.0  ,  -2498.0, -2351.0  ,  -2498.0, -1831.0  ,  -2512.0, -1826.3  }
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
