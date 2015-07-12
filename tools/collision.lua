local obm = getOBM()
local tlm = getTLM()

function collision(obj1)
    local objects = obm:getObjects()
	for i = 1,#objects do
		local obj2 = objects[i]	

		if ( obj1.remove == true ) or ( obj2.remove == true )then  --make sure the first object exists
	    	print(obj1.id,obj2.id)
	    	return false
	   	end

	   	if (obj1 == obj2) then
	   		return false
	   	end

	   	if obj2.contentBounds == nil then
	   		return false
	   	end

	   	if obj1.x+obj1.width/2 > obj2.x-obj2.width/2 and
	   	   obj1.x-obj1.width/2 < obj2.x+obj2.width/2 and
	   	   obj1.y+obj1.height/2 > obj2.y-obj2.height/2 and
           obj1.y-obj1.height/2 < obj2.y+obj2.height/2 then

	   	   obj1:collision(obj2)

	   	end

	end
end

function tileCollision(obj1)
    local tiles = tlm:getTiles()
	for i = 1,#tiles do
		local obj2 = tiles[i]
		if obj2.solid then
			if ( obj1.remove == true ) or ( obj2.remove == true )then  --make sure the first object exists
		    	print(obj1.id,obj2.id)
		    	return false
		   	end

		   	if (obj1 == obj2) then
		   		return false
		   	end

		   	if obj2.contentBounds == nil then
		   		return false
		   	end

		   	local left = obj1.contentBounds.xMin <= obj2.contentBounds.xMin and obj1.contentBounds.xMax >= obj2.contentBounds.xMin
		   	local right = obj1.contentBounds.xMin >= obj2.contentBounds.xMin and obj1.contentBounds.xMin <= obj2.contentBounds.xMax
		   	local up = obj1.contentBounds.yMin <= obj2.contentBounds.yMin and obj1.contentBounds.yMax >= obj2.contentBounds.yMin
		   	local down = obj1.contentBounds.yMin >= obj2.contentBounds.yMin and obj1.contentBounds.yMin <= obj2.contentBounds.yMax

		   	if (left or right) and (up or down) then
		   		obj1:collision(obj2)
		   	end
		end
	end
end
