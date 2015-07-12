local gfx = {}

function gfx:spriteSheet(img,w,h)
	local options =
	{
	    width = w,
	    height = h,
	    numFrames = 256/w, 

	    sheetContentWidth = 256,
    	sheetContentHeight = 256 
	}
	local sheet = graphics.newImageSheet( "assets/"..img, options )

	return sheet
end

function gfx:sprite(spriteSheet,frame,x,y,w,h)
	local spr = display.newImage( spriteSheet, frame )

	spr.x = x
	spr.y = y

	spr.width = w
	spr.height = h

	return spr
end

return gfx