function rainbowFluff(love,level)
	level = level or 1
	levels = {
		"PPPLevel.tmx"
	}
	local ctx={}
	ctx.map=maploader.load(levels[level])

	
	--function SpawnScan(ctx)
	--	
	--	print("11111111111111111111111ffffffffffffff")
	--	
	--	--return
	--			
	--	ctx.creatures = {}   
	--	
	--	local CreatureNumber = 0
	--	
	--	local MaxX = 50 --ctx.map.tileWidth
	--	local Maxy = 50 --ctx.map.tileHeight
	--	
	--	local x = 0
	--	local y = 0
	--	
	--	local CellScanCount = 0
	--	
	--	--scann through cells
	--	
	--	while y < Maxy  do
	--	
	--		x = 0
	--		while x < MaxX  do
	--	
	--			--get this cells spawn code
	--			local SpawnCode = getTileProperty("SpawnCode",x,y,ctx,"Creatures") 
	--			
	--			if SpawnCode ~= 0 then
	--				
	--				--get rid of spawn icon
	--				--setTileGraphic("Creatures",0,x,y,ctx)
	--				
	--				if(SpawnCode == 1) then
	--				
	--					CreatureNumber = CreatureNumber + 1
	--					
	--					
	--					
	--					ctx.creatures[CreatureNumber] =  Creature:new(x + 1,y + 1,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2)
 	--				
	--				end
	--				
	--				if(SpawnCode == 2) then
	--					
	--					CreatureNumber = CreatureNumber + 1
	--					print("rrrrrrrrrrreeeeddddddsd sssssssssssssssssssssspawwwnnnnnnnnnnn", x,y)
	--					ctx.creatures[CreatureNumber] = Creature:new(x + 1,y + 1,ctx,0.3,"Purple",-0.1,1,3,1,-10,1,-10,2)
	--					
	--				end
	--				
	--				if(SpawnCode == 3) then
	--				
	--					CreatureNumber = CreatureNumber + 1
    --
	--					ctx.creatures[CreatureNumber] =  Creature:new(x + 1,y + 1,ctx,0.3,"Yellow",-0.1,1,3,1,-10,-10,1,2)
	--					
	--				end
	--				
	--			end
    --
	--			--move on to next collumb
	--			x = x +1
	--		end
	--		
	--		--move on to next row
	--		y = y +1
	--	end
	--		
	--end
	--
	--function UpdateScan(ctx,layer,map,dt)
	--
	--	print("222222222222222222222222fffffffffffff")
	--	--return
	--	
	--	--ctx.creatures = {}   
	--	
	--	local CreatureNumber = 0
	--	
	--	local MaxX = 50 --ctx.map.tileWidth
	--	local Maxy = 50 --ctx.map.tileHeight
	--	
	--	local x = 0
	--	local y = 0
	--	
	--	local CellScanCount = 0
	--	
	--	--scann through cells
	--	
	--	while y < Maxy  do
	--	
	--		x = 0
	--		while x < MaxX  do
	--	
	--			--get this cells spawn code
	--			local SpawnCode = getTileProperty("SpawnCode",x,y,ctx,"Creatures") 
	--			
	--			if SpawnCode ~= 0 then
	--				
	--				--get rid of spawn icon
	--				--setTileGraphic("Creatures",0,x,y,ctx)
	--				
	--				if(SpawnCode == 1) then
	--				
	--					CreatureNumber = CreatureNumber + 1
	--					
	--					ctx.creatures[CreatureNumber]:update(dt, ctx.creatures[CreatureNumber], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
 	--				
	--				end
	--				
	--				if(SpawnCode == 2) then
	--					
	--					CreatureNumber = CreatureNumber + 1
    --
	--					ctx.creatures[CreatureNumber]:update(dt, ctx.creatures[CreatureNumber], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
	--					
	--				end
	--				
	--				if(SpawnCode == 3) then
	--				
	--					CreatureNumber = CreatureNumber + 1
    --
	--					ctx.creatures[CreatureNumber]:update(dt, ctx.creatures[CreatureNumber], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
	--					
	--				end
	--				
	--			end
	--			
	--			
	--			
	--			--move on to next collumb
	--			x = x +1
	--		end
	--		
	--		--move on to next row
	--		y = y +1
	--	end
	--	
	--end
	--
	--function DrawScan(drawlist,ctx)
	--
	--	print("3333333333333333333333333333ffff")
	--	
	--	--return
	--	
	--	--ctx.creatures = {}   
	--	
	--	local CreatureNumber = 0
	--	
	--	local MaxX = 50 --ctx.map.tileWidth
	--	local Maxy = 50 --ctx.map.tileHeight
	--	
	--	local x = 0
	--	local y = 0
	--	
	--	local CellScanCount = 0
	--	
	--	--scann through cells
	--	
	--	while y < Maxy  do
	--	
	--		x = 0
	--		while x < MaxX  do
	--	
	--			--get this cells spawn code
	--			local SpawnCode = getTileProperty("SpawnCode",x,y,ctx,"Creatures") 
	--			
	--			if SpawnCode ~= 0 then
	--				
	--				--get rid of spawn icon
	--				setTileGraphic("Creatures",0,x + 0,y + 0,ctx)
	--				
	--				if(SpawnCode == 1) then
	--				
	--					CreatureNumber = CreatureNumber + 1
    --
	--					drawlist( ctx.creatures[CreatureNumber]:newDrawable()) 
 	--				
	--				end
	--				
	--				if(SpawnCode == 2) then
	--					
	--					CreatureNumber = CreatureNumber + 1
    --
	--					drawlist( ctx.creatures[CreatureNumber]:newDrawable()) 
	--					
	--				end
	--				
	--				if(SpawnCode == 3) then
	--				
	--					CreatureNumber = CreatureNumber + 1
    --
	--					drawlist( ctx.creatures[CreatureNumber]:newDrawable()) 
	--					
	--				end
	--				
	--			end
	--			
	--			
	--			
	--			--move on to next collumb
	--			x = x +1
	--		end
	--		
	--		--move on to next row
	--		y = y +1
	--	end
	--
	--end
	
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
	
	--SpawnScan(ctx)
	
	ctx.creatures = {}                                                 
	ctx.creatures[1] =  Creature:new(15,15,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[2] =  Creature:new(15,15,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2) 
	ctx.creatures[3] =  Creature:new(15,15,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[4] =  Creature:new(15,15,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[5] =  Creature:new(15,15,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2)

	ctx.creatures[6] =  Creature:new(15,15,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[7] =  Creature:new(15,15,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2) 
	ctx.creatures[8] =  Creature:new(15,15,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[9] =  Creature:new(15,15,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2)
	ctx.creatures[10] =  Creature:new(15,15,ctx,0.3,"Red",0.1,1,3,1,1,-10,-10,2)	
	
	
	ctx.creatures[11] =  Creature:new(35,15,ctx,0.3,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[12] =  Creature:new(35,15,ctx,0.3,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[13] =  Creature:new(35,15,ctx,0.3,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[14] =  Creature:new(35,15,ctx,0.3,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[15] = Creature:new(35,15,ctx,0.3,"Purple",0.1,1,3,1,-10,-10,1,2)
	
	ctx.creatures[16] =  Creature:new(35,15,ctx,0.3,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[17] =  Creature:new(35,15,ctx,0.3,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[18] =  Creature:new(35,15,ctx,0.3,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[19] =  Creature:new(35,15,ctx,0.3,"Purple",0.1,1,3,1,-10,-10,1,2)
	ctx.creatures[20] = Creature:new(35,15,ctx,0.3,"Purple",0.1,1,3,1,-10,-10,1,2)
	
	
	ctx.creatures[21] = Creature:new(25,35,ctx,0.3,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[22] = Creature:new(25,35,ctx,0.3,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[23] = Creature:new(25,35,ctx,0.3,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[24] = Creature:new(25,35,ctx,0.3,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[25] = Creature:new(25,35,ctx,0.3,"Yellow",0.1,1,3,1,-10,1,-10,2)
	
	ctx.creatures[26] = Creature:new(25,35,ctx,0.3,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[27] = Creature:new(25,35,ctx,0.3,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[28] = Creature:new(25,35,ctx,0.3,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[29] = Creature:new(25,35,ctx,0.3,"Yellow",0.1,1,3,1,-10,1,-10,2)
	ctx.creatures[30] = Creature:new(25,35,ctx,0.3,"Yellow",0.1,1,3,1,-10,1,-10,2)
	
	                                                             
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
		
		--UpdateScan(ctx,layer,map,dt)
		
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
		ctx.creatures[11]:update(dt, ctx.creatures[11], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[12]:update(dt, ctx.creatures[12], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[13]:update(dt, ctx.creatures[13], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[14]:update(dt, ctx.creatures[14], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[15]:update(dt, ctx.creatures[15], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[16]:update(dt, ctx.creatures[16], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[17]:update(dt, ctx.creatures[17], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[18]:update(dt, ctx.creatures[18], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[19]:update(dt, ctx.creatures[19], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[20]:update(dt, ctx.creatures[20], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[21]:update(dt, ctx.creatures[21], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[22]:update(dt, ctx.creatures[22], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[23]:update(dt, ctx.creatures[23], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[24]:update(dt, ctx.creatures[24], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[25]:update(dt, ctx.creatures[25], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[26]:update(dt, ctx.creatures[26], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[27]:update(dt, ctx.creatures[27], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[28]:update(dt, ctx.creatures[28], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[29]:update(dt, ctx.creatures[29], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })
		ctx.creatures[30]:update(dt, ctx.creatures[30], {mouse=ctx.mouse,tiles=layer.tileData,map=map, mapproperties=ctx.mapproperties })


	end
	
	
	
	
	
	
	
	function ctx:draw ()
		ctx=self
		
		--map:setDrawRange(0, 0, ctx.camera.width, ctx.camera.height)
		--map.drawList={map.drawList[1]}
		--map:draw()
		drawlist({ {type="map", ref=map}})
		
		
		--DrawScan(drawlist,ctx)
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
		drawlist( ctx.creatures[11]:newDrawable()) 
		drawlist( ctx.creatures[12]:newDrawable())
		drawlist( ctx.creatures[13]:newDrawable())
		drawlist( ctx.creatures[14]:newDrawable())
		drawlist( ctx.creatures[15]:newDrawable())
		drawlist( ctx.creatures[16]:newDrawable()) 
		drawlist( ctx.creatures[17]:newDrawable()) 
		drawlist( ctx.creatures[18]:newDrawable()) 
		drawlist( ctx.creatures[19]:newDrawable()) 
		drawlist( ctx.creatures[20]:newDrawable()) 
		drawlist( ctx.creatures[21]:newDrawable()) 
		drawlist( ctx.creatures[22]:newDrawable())
		drawlist( ctx.creatures[23]:newDrawable())
		drawlist( ctx.creatures[24]:newDrawable())
		drawlist( ctx.creatures[25]:newDrawable())
		drawlist( ctx.creatures[26]:newDrawable()) 
		drawlist( ctx.creatures[27]:newDrawable())
		drawlist( ctx.creatures[28]:newDrawable())
		drawlist( ctx.creatures[29]:newDrawable())
		drawlist( ctx.creatures[30]:newDrawable())

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
