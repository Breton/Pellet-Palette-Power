function love.keypressed(k)


	-- wsl:todo disable developer keys in release version?
	-- developer keys --
	
	-- reload
	if k == "r" then
		love.filesystem.load("flufft.lua")()
		love.filesystem.load("Creature.lua")
		love.filesystem.load("rainbowfluff.lua")()

		ctx:stop()

		ctx=rainbowFluff(love,1)
	end

    -- ???
	if k =="l" then
		ctx:stop()
		ctx={}
		function ctx:update()
		
		end 
		function ctx:draw()

		end 
		function ctx:stop()
		end 
	end
	
	-- ???
	if k == "k" then 
		ctx:stop()

		ctx=rainbowFluff(love,1)
	end 

	
	-- player keys --
	
	-- pause
	if k =="p" then 
		if ctx.paused then 
			ctx:resume()
		else
			ctx:stop()
	    end 
	end 
	
--	-- cupcake keys -- wsl: Use this approach if NOT wanting to have a variable rate of cupcake expulsion (otherwise see approach in rainbowfluff.lua)	
	if k =="u" then 
		print("ctx")
		print(DumpObject(ctx))
		ctx.tractor:DropRedFood(ctx)
	end 
	
	if k =="i" then 
		ctx.tractor:DropYellowFood(ctx)
	end 
	
	if k =="o" then 
		ctx.tractor:DropPurpleFood(ctx)
	end 
	
-- toggle Gate
--	if k =="a" then
--		ctx.tractor:KeyboardMoveWest()
--	end
--	
end

