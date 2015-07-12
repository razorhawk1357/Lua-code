local gsm = {}

local scenes

function gsm:load()
	gameLoop:addLoop(self)
	scenes = {}
end

function gsm:tick(dt)
	
end

function gsm:gotoScene(s)

	if #scenes > 0 then
		scenes[1]:destroy()
		scenes[1] = nil
		table.remove(scenes,1)
	end
	s:load()
	table.insert(scenes,s)
end

return gsm