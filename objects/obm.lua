local obm = {}

local objects
local remove 
local insert 
local camera 

function obm:load()
	gameLoop:addLoop(self)
	objects = {}
	remove = table.remove
	insert = table.insert
	camera = getCamera()

	self.spriteSheet = gfx:spriteSheet("spriteSheet.png",16,16)
end

function obm:tick(dt)
	for i = #objects,1,-1 do
		local o = objects[i]
		if o.remove then
			remove(objects,i)
			o = nil
		end
	end
end

function obm:add(o,l)
	local layer = l or 2
	o:load()
	insert(objects,o)
	camera:add(o,layer,false)
end

function obm:getObjects()
	return objects
end

return obm