local tile = require "tiles.tile"

function loadMap(m,img)

	map = require ("maps."..m)

	for i = 1,#map do
		local t = tile:new(img,map[i][3],64*map[i][1]-32,64*map[i][2]-32,64,64,map[i][4])

		tlm:add(t,map[i][1],map[i][2])
	end

end

function genMap(img)
	local tiles = tlm:getTiles()

	
end