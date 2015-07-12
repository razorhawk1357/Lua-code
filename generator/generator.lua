local tlm = getTLM()
local tile = require ("tiles.tile")

local solidFactor = 60
local rnd = math.random
local width = 64
local height = 64

function generateMap()
	local map = {}

	for y = 1,height do
		map[y] = {}
		for x = 1,width do
			local n = 1
			if (math.random(0,100) > solidFactor) then
				n = 2
			end
			map[y][x] = n
		end
	end

	for i = 1,3 do
		smooth(map)
	end

	generateMapFromMap(map)
end

function smooth(map)
	for i = 1,height do
		for j = 1,width do
			local n = getNumTiles(i,j,map)
			if n > 4 then 
				map[i][j] = 2
			elseif n < 4 then
			    map[i][j] = 1
			end
		end
	end
end

function getNumTiles(x,y,map)
	local n = 0
	for i = y-1,y+2 do
		for j = x-1,x+2 do
			if i > 0 and i < height+1 and j > 0 and j < width+1 then
				if i ~= y and j ~= x then
					if map[i][j] == 2 then
						n = n + 1
					end
				end
			else
				n = n + 1
			end
		end
	end
	return n
end

function generateMapFromMap(map)
	for y = 1,height do
		for x = 1,width do
			local frame = 1
			if map[y][x] == 1 then
				frame = 2
			end
			tlm:add(tile:new(tlm.sheet,map[y][x],-8+x*16,-8+y*16,map[y][x],false),4)
		end
	end
end