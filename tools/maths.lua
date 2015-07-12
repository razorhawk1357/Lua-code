local abs = math.abs
local sqrt = math.sqrt

function math.clamp (v, l, h)
 	return (v < l and l) or (v > h and h) or v 
end

function math.vec2(mx,my)
	local vec2 = {}

	vec2.x = mx
	vec2.y = my

	function vec2:move(x,y,dt)
		local delta = dt or 1
		self.x = self.x + x * delta
		self.y = self.y + y * delta
	end
	
	function vec2:rotate(phi)
	    local c, s = cos(phi), sin(phi)
        self.x, self.y = c * self.x - s * self.y, s * self.x + c * self.y
	end

	return vec2
end

function math.dist(x1,x2)
    return abs(x2-x1) 
end

function math.distf(x1,y1,x2,y2)
    local dx = x1 - x2
    local dy = y1 - y2
    return sqrt( dx * dx + dy * dy ) 
end