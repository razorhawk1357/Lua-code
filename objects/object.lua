local Object = {}

function Object:new(x,y,w,h,frame,id)
	local object = gfx:sprite(getOBM().spriteSheet,frame,x,y,64,64)

	object.x = x or 0
	object.y = y or 0
	object.width  = w or 0
	object.height = h or 0

	object.velX = 0
	object.velY = 0
	object.dirX = 0
	object.dirY = 0

	object.speed = 0
	
	object.remove = false

	object.id = id or "object"

	function object:load()			end
	function object:preDestroy()	end
	function object:tick(dt)		end
	function object:collision(obj)	end

	function object:destroy()
		self:preDestroy()
		
		gameLoop:removeLoop(self)
		Runtime:removeEventListener("touch",self)
		self:removeEventListener("touch",self)

		self:removeSelf()
		self.remove = true
	end

	return object
end

return Object