local Scene = {}

function Scene:new(id)
	local scene = {}

	scene.id = id or "scene"

	function scene:load()   	end
	function scene:tick(dt) 	end
	function scene:preDestroy() end
	function scene:destroy()	
		self:preDestroy()

		
	end

	return scene
end

return Scene