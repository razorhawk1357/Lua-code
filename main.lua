-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- requires
local GameLoop 		= require ("tools.gameLoop")
local gsm      		= require ("tools.gsm")
local obm      		= require ("tools.obm")
local perspective 	= require ("tools.perspective")
local gfx       	= require ("tools.gfx")
local tlm           = require ("tools.tlm")

-- local init
local main 		= {}
local camera 	= perspective.createView(4)

-- global init
GAME_TIME = 0 -- global game ticker
gameLoop  = GameLoop:new()

display.setStatusBar( display.HiddenStatusBar )
display.setDefault("magTextureFilter", "nearest" )

--camera.xScale,camera.yScale = 4.5,4.5

math.randomseed(os.time())

-- functions
function main:load()
	gameLoop:start()
	gameLoop:addLoop(self)

	Runtime:addEventListener('key',self)

	tlm:load()
	gsm:load()
	obm:load()

	gsm:gotoScene(require ("scenes.level"))
end
function main:tick(dt)
	GAME_TIME = GAME_TIME + dt
end

function main:key(event)
	local key = event.keyName
	if key == '-' then
		camera.xScale = camera.xScale - .2
		camera.yScale = camera.yScale - .2
	elseif key == '=' then
		camera.xScale = camera.xScale + .2
		camera.yScale = camera.yScale + .2
	end
end

function getCamera()
	return camera
end
function getGFX()
	return gfx
end
function getTLM()
	return tlm
end
function getOBM()
	return obm
end

main:load()