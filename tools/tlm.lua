local tlm = {}

local insert = table.insert
local remove = table.remove
local gfx    

function tlm:load()
	gfx = _G.getGFX()

	self.tiles = {}
	self.sheet = gfx:spriteSheet("tileSheet.png",16,16)
end

function tlm:add(t,l)
    local layer = l or 1
	getCamera():add(t,layer,false)
	insert(self.tiles,t)
	Runtime:addEventListener("touch",self)
end

function tlm:touch(event)
    
end

function tlm:getTiles()
	return self.tiles
end

function tlm:destroy()
    for i = #self.tiles,1,-1 do
        local t = self.tiles[i]
        t:destroy()
        t = nil
        remove(self.tiles,i)
    end
    
	Runtime:removeEventListener("touch",self)
end

return tlm