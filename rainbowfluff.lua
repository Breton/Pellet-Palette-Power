function rainbowFluff(love,level)
	level = level or 1
	levels = {
		"testmap4.tmx"
	}
	local ctx={}
	ctx.map=maploader.load(levels[level])

	function ctx.name (name, character) 
		if character == "Yellow" or character == "Red" or character == "Purple" then 
			return ctx[character]
		else 
		--replacable with proper cache lookup later
		return ctx[name]
	    end
	end
	layer = ctx.map.tl["Ground"] or {}
	ctx.tiles = layer.tileData or {}

	function ctx.quad(name, character) 
		return ctx.quads[name]
	end

	love.graphics.setColor(255, 255, 255, 200)


	ctx.love=love
	ctx.mapproperties={}
	ctx.body   	= love.graphics.newImage(db.name( "body"   	))
	ctx.ear    	= love.graphics.newImage(db.name( "ear"    	))
	ctx.face   	= love.graphics.newImage(db.name( "face"   	))
	ctx.logo   	= love.graphics.newImage(db.name( "logo"   	))
	ctx.cloud  	= love.graphics.newImage(db.name( "cloud"  	))
	ctx.selfmag	= love.graphics.newImage(db.name( "selfmag"	))
	
	ctx.Yellow =  love.graphics.newImage(db.name("yellow").image )
	ctx.Purple =  love.graphics.newImage(db.name("purple").image )
	ctx.Red =  love.graphics.newImage(db.name("red").image )
	ctx.quads = {
		walk1 = love.graphics.newQuad(0,0,32,32,128,32),
		walk2 = love.graphics.newQuad(32,0,32,32,128,32),
		walk3 = love.graphics.newQuad(64,0,32,32,128,32),
		walk4 = love.graphics.newQuad(96,0,32,32,128,32),
	}


	ctx.flufft = Flufft:new()
	ctx.planet = Planet:new()
	ctx.camera= Camera:new(ctx)
	ctx.creatures = {}                                                 
	ctx.creatures[1] =  Creature:new(11,11,ctx,0.3,"Red",-0.1,1,10,1,1,0,-10,2)
	ctx.creatures[2] =  Creature:new(16,16,ctx,0.3,"Red",-0.1,1,10,1,1,0,-10,2) 
	ctx.creatures[3] =  Creature:new(16,12,ctx,0.3,"Red",-0.1,1,10,1,1,0,-10,2)
	ctx.creatures[4] =  Creature:new(16,12,ctx,0.3,"Red",-0.1,1,10,1,1,0,-10,2)
	ctx.creatures[5] =  Creature:new(16,12,ctx,0.3,"Red",-0.1,1,10,1,1,0,-10,2)
	ctx.creatures[6] =  Creature:new(16,13,ctx,0.3,"Purple",-0.1,1,10,1,-10,0,1,2)
	ctx.creatures[7] =  Creature:new(16,14,ctx,0.3,"Purple",-0.1,1,10,1,-10,0,1,2)
	ctx.creatures[8] =  Creature:new(16,11,ctx,0.3,"Purple",-0.1,1,10,1,-10,0,1,2)
	ctx.creatures[9] =  Creature:new(16,11,ctx,0.3,"Purple",-0.1,1,10,1,-10,0,1,2)
	ctx.creatures[10] = Creature:new(16,11,ctx,0.3,"Purple",-0.1,1,10,1,-10,0,1,2)
	                                                             
	use_music=true
	local auBGM

	if use_music == true then
	--	auBGM = love.audio.newSource("sfx/bgm.wav")
	--	auBGM:setLooping(true)
	--	auBGM:setVolume(0.6)
	--	auBGM:play()
	end

	function ctx:update (dt,ctx)

		local space = love.keyboard.isDown(" ")
		ctx=self
		ctx.mouse={x=love.mouse.getX()/ctx.camera.zoom, y=love.mouse.getY()/ctx.camera.zoom}
		ctx.flufft = ctx.flufft:newState(dt,ctx.flufft,{mouse=ctx.mouse,tiles=layer.tileData,map=map, key=space, mapproperties=ctx.mapproperties })
		--print("object")
		--print(DumpObject(ctx.mapproperties))
		ctx.creatures[1]:update(dt, ctx.creatures[1], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[2]:update(dt, ctx.creatures[2], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[3]:update(dt, ctx.creatures[3], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[4]:update(dt, ctx.creatures[4], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[5]:update(dt, ctx.creatures[5], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[6]:update(dt, ctx.creatures[6], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[7]:update(dt, ctx.creatures[7], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[8]:update(dt, ctx.creatures[8], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[9]:update(dt, ctx.creatures[9], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[10]:update(dt, ctx.creatures[10], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })



	end
	function ctx:draw ()
		ctx=self
		
		--map:setDrawRange(0, 0, ctx.camera.width, ctx.camera.height)
		--map.drawList={map.drawList[1]}
		--map:draw()
		drawlist({ {type="map", ref=map}})
		drawlist( ctx.creatures[1]:newDrawable()) 
		drawlist( ctx.creatures[2]:newDrawable()) 
		drawlist( ctx.creatures[3]:newDrawable()) 
		drawlist( ctx.creatures[4]:newDrawable()) 
		drawlist( ctx.creatures[5]:newDrawable()) 
		drawlist( ctx.creatures[6]:newDrawable()) 
		drawlist( ctx.creatures[7]:newDrawable())
		drawlist( ctx.creatures[8]:newDrawable())
		drawlist( ctx.creatures[9]:newDrawable())
		drawlist( ctx.creatures[10]:newDrawable())

		drawlist(  ctx.flufft:newDrawable())


	end

	local updatef
	function ctx:stop ()
	  	self.paused = true 
	  	updatef=self.update 
	  	self.update=function () end 
	--	auBGM:stop()
	end
	function ctx:resume()
		self.paused = false 
		self.update=updatef
	end 

	return ctx
end
