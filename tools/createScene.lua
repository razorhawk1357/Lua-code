local options = {
	"", 	-- name
	false,	-- camera
	false,  -- update
	false,	-- load
	false,  -- obm
	false   -- gsm
}

local disp = {
	"name:   ",
	"camera: ",
	"update: ",
	"load:   ",
	"obm:    ",
	"gsm:    ",
}

local curserX = 1

local b2s

function cls()
	os.execute("cls")
end

function run()
	while true do
		cls()
		print ("name: ")
		options.name = io.read()
		print("ok the scene name is: "..options.name)
		print("is this right? y/n")
		if io.read() == 'y' then
			break
		end
	end
	cls()

	while true do
		cls()
		for i = 1,#disp do
			local d = disp[i]
			local o = b2s(options[i])
			if curserX == i then
				print(d..o.." <--")
			else
				print(d..o)
			end
		end
		input = io.read()
		if input == 'z' then
			curserX = curserX - 1
		elseif input == 'x' then
			curserX = curserX + 1
		elseif input == 'c' then
			options[curserX] = not options[curserX]
		end

		if curserX > #disp then
			curserX = #disp
		elseif curserX < 1 then
			curserX = 1
		end
	end

end

function b2s(b)
	if type(b) ~= "boolean" then return b end
	if b then return "true" else return "false" end
end

run()
