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

-- local init
local main 		= {}
local camera 	= perspective.createView(4)

-- global init
GAME_TIME = 0 -- global game ticker
gameLoop  = GameLoop:new()

display.setStatusBar( display.HiddenStatusBar )
display.setDefault("magTextureFilter", "nearest" )

-- functions
function main:load()
	gameLoop:start()
	gameLoop:addLoop(self)

	gsm:load()
	obm:load()
end
function main:tick(dt)
	GAME_TIME = GAME_TIME + dt
end

function getCamera()
	return camera
end
function getGFX()
	return gfx
end

main:load()