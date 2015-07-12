local scene = require ("scenes.scene")
local player = require ("objects.player")

local level = scene:new("level")

local obm = getOBM()

require ("generator.generator")

function level:load()
	generateMap()

	obm:add(player:new(256,256),3)
end

return level