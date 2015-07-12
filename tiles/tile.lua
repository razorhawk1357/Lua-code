local Tile = {}

local gfx = getGFX()

function Tile:new(spriteSheet,frame,x,y,id,solid)
	local tile = gfx:sprite(spriteSheet,frame,x,y,16,16)

	tile.id = id
	tile.solid = solid

    function tile:destroy()
        display.remove(self) 
    end

	return tile
end

return Tile