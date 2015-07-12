local object = require ("objects.object")

local Player = {}

local camera = getCamera()

function Player:new(x,y)
	local player = object:new(x,y,16,16,1,'player')

	function player:load()
		gameLoop:addLoop(self)

		self.speed = 1

		Runtime:addEventListener('key',self)
	end

	function player:tick(dt)
		camera:setFocus(self)

		self.x = self.x + self.velX
		self.y = self.y + self.velY
	end

	function player:key(event)
		local key = event.keyName

		if event.phase == 'down' then
			if key == 'left' then
				self.velX = -self.speed
			elseif key == 'right' then
				self.velX = self.speed
			end

			if key == 'up' then
				self.velY = -self.speed
			elseif key == 'down' then
				self.velY = self.speed
			end
		elseif event.phase == 'up' then
			if key == 'left' or key == 'right' then
				self.velX = 0 
			end

			if key == 'up' or key == 'down' then
				self.velY = 0
			end
		end
	end

	return player
end

return Player