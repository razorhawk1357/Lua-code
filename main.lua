-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- requires
local GameLoop = require ("tools.gameLoop")

-- local init
local main = {}
-- global init
GAME_TIME = 0
gameLoop  = GameLoop:new()

gameLoop:start()
-- functions
function main:tick(dt)
	GAME_TIME = GAME_TIME + dt
end
gameLoop:addLoop(main)