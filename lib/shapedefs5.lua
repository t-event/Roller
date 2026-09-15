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
                    shape = {   -1920.0, -938.9  ,  -1281.0, -614.9  ,  -1281.0, 1175.5  ,  -1920.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1281.0, -614.9  ,  -641.0, -277.4  ,  -641.0, 1175.5  ,  -1281.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -641.0, -277.4  ,  -1.0, -179.9  ,  -1.0, 1175.5  ,  -641.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1.0, -179.9  ,  639.0, 162.7  ,  639.0, 1175.5  ,  -1.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   639.0, 162.7  ,  1279.0, 435.9  ,  1279.0, 1175.5  ,  639.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1279.0, 435.9  ,  1919.0, 784.1  ,  1919.0, 1175.5  ,  1279.0, 1175.5  }
                    }
		}
		,
		["2"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1920.0, -807.5  ,  -1281.0, -646.4  ,  -1281.0, 1175.5  ,  -1920.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1281.0, -646.4  ,  -641.0, -325.8  ,  -641.0, 1175.5  ,  -1281.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -641.0, -325.8  ,  -1.0, 59.4  ,  -1.0, 1175.5  ,  -641.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1.0, 59.4  ,  639.0, 190.8  ,  639.0, 1175.5  ,  -1.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   639.0, 190.8  ,  1279.0, 530.7  ,  1279.0, 1175.5  ,  639.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1279.0, 530.7  ,  1919.0, 758.6  ,  1919.0, 1175.5  ,  1279.0, 1175.5  }
                    }
		}
		,
		["3"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1920.0, -834.4  ,  -1281.0, -665.1  ,  -1281.0, 1175.5  ,  -1920.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1281.0, -665.1  ,  -641.0, -384.7  ,  -641.0, 1175.5  ,  -1281.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -641.0, -384.7  ,  -1.0, -23.3  ,  -1.0, 1175.5  ,  -641.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1.0, -23.3  ,  639.0, 222.4  ,  639.0, 1175.5  ,  -1.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   639.0, 222.4  ,  1279.0, 367.6  ,  1279.0, 1175.5  ,  639.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1279.0, 367.6  ,  1919.0, 747.6  ,  1919.0, 1175.5  ,  1279.0, 1175.5  }
                    }
		}
		,
		["4"] = {
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1920.0, -934.1  ,  -1281.0, -547.0  ,  -1281.0, 1175.5  ,  -1920.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1281.0, -547.0  ,  -641.0, -389.1  ,  -641.0, 1175.5  ,  -1281.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -641.0, -389.1  ,  -1.0, -55.5  ,  -1.0, 1175.5  ,  -641.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   -1.0, -55.5  ,  639.0, 148.8  ,  639.0, 1175.5  ,  -1.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   639.0, 148.8  ,  1279.0, 509.1  ,  1279.0, 1175.5  ,  639.0, 1175.5  }
                    }
                     ,
                    {
                    pe_fixture_id = "", density = 2, friction = 3, bounce = 0, 
                    filter = { categoryBits = 1, maskBits = 65535, groupIndex = 0 },
                    shape = {   1279.0, 509.1  ,  1919.0, 819.4  ,  1919.0, 1175.5  ,  1279.0, 1175.5  }
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
