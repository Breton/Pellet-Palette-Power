require("MiddleClass.lua")
require ("Vector.lua")

Creature = class("Creature")


function Creature:initialize(x,y,BigUpdatRate,Type,Lazyness)
	--the current location of the creature
	self.NewLocation = Vector:new(x,y)
	
	--the old location of the creature
	self.OldLocation = Vector:new(x,y)
	
	--smoothed position of the creature
	self.SmoothedLocation = Vector:new(x,y)
	
	--the time between big updates
	self.TimeBetweenBigUpdates = BigUpdatRate
	
	--the time since the last big update
	self.TimeSinceLastBigUpdate = 1
	
	--the type of creature this creature is
	self.CreatureType = Type
	
	--this is how much the creature needs to move before it moves
	self.Lazyness = Lazyness
	--retuen constructed creature
	return self
end

function Creature:update(dt,oldstate,ctx)
	--perform small update
	self:SmallUpdate()
	
	--check if big update is needed
	
	--update time since last big update
	
	
	self.TimeSinceLastBigUpdate = self.TimeSinceLastBigUpdate + dt
	
	if self.TimeBetweenBigUpdates < self.TimeSinceLastBigUpdate then
		self.TimeSinceLastBigUpdate = self.TimeSinceLastBigUpdate - self.TimeBetweenBigUpdates;
		
		--perform big update
		self:BigUpdate(dt,oldstate,ctx)
		
	end
end


function Creature:newDrawable(state)
	local d = {}
	state = self
	table.insert(d, {
		 name="body",  --center and scale should be camera and db responsibilities
		 character="ballochan",
		 x=self.SmoothedLocation.x*32,
		 y=self.SmoothedLocation.y*32,     --x and y assuming 800x600 screen
		 a=0,
		 sx=0.25,
		 sy=0.25,
		 cx=0,
		 cy=0
	})

	return d
end

function Creature:SmallUpdate()
	--get the percent of time untill the next update
	local BigUpdatePercent = self.TimeSinceLastBigUpdate/ self.TimeBetweenBigUpdates
	
	self.SmoothedLocation.x = (self.NewLocation.x * BigUpdatePercent) + (self.OldLocation.x * (1- BigUpdatePercent))
	self.SmoothedLocation.y = (self.NewLocation.y * BigUpdatePercent) + (self.OldLocation.y * (1- BigUpdatePercent))
	
end

function Creature:BigUpdate(dt,oldstate,ctx)

	
	--get grazing direction
	local vecGrazing = self:Grazing(dt,oldstate,ctx)
	
	--local vecGrazing = Vector:new(0,0)
	
	--turn planed direction to grid locked direction
	local vecGridDirection = self:FinalMoveDirection(dt,oldstate,ctx,vecGrazing)
	
	--apply it to character
	self:Move(dt,oldstate,ctx,vecGridDirection)
	
end

function Creature:EatFood(dt,oldstate,ctx)
	--get the food levels in this cell
	local Food = getTileProperty("food", newx,newy,ctx)
	
	--if this creature is a red creature
	if self.CreatureType == "red" then 
		
		--eat the correct food
		
		--deposite the correct food
		
	--else
	end
	--if this creature is a green creature
	--if then 
	
	--else
	
	--if this creature is a blue creature
	--if then 
	
	--else
	
	--subtract a grazing amount from the cell
	--setTileProperty("food",{greenfood=20, redfood=30}, self.NewLocation.x,self.NewLocation.y,ctx)
end

--get the food level for this creature at this point
function Creature:GetFoodLevelForThisCreature(x,y,ctx)
	
	--check if there is food in this square
	
	--if this creature is a red creature
	--if self.CreatureType == "red" then
		if getTileProperty("RedFood",x,y,ctx,"RedPellets") ~= nil then
			print("i do cocane")
			return getTileProperty("RedFood",x,y,ctx,"RedPellets")
		end
	--end
	
	--if this creature is a green creature
	--if self.CreatureType == "green" then 

	--end
	
	--if this creature is a blue creature
	--if self.CreatureType == "blue" then 

	--end
	
	return 0
	
end

-- get the direction the character wants to go to group better
-- this function returns flock gathering
function Creature:Grouping()

	--loop through the cells surounding the creature
	
	--the distance above and below the player to scan
	local ScanSize = 3
	
	local xOffset = 0
	local yOffset = 0
	
	local CellScanCount = 0
	
	--while yOffset <  
end

--Work out what direction the creature has decided to go in
function Creature:FinalMoveDirection(dt,oldstate,ctx,vecMoveDirectionVector)

--project movement vector onto each direction

--initalise all variables
	local IsUpAvailable	= false
	local IsUpLeftAvailable = false
	local IsLeftAvailable = false
	local IsDownLeftAvailable = false
	local IsDownAvailable = false
	local IsDownRighAvailable = false
	local IsRightAvailable = false 
	local IsUpRightAvailable = false

	--check availability of squares
	if(getTileProperty("obstacle", self.NewLocation.x,self.NewLocation.y -1,ctx,"Ground") ~= 1 and getTileProperty("HasCreature", self.NewLocation.x,self.NewLocation.y -1,ctx,"Creatures") ~= 1) then
		print("Im dr Rockso")
		IsUpAvailable	= true
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x -1,self.NewLocation.y -1,ctx,"Ground") ~= 1 and getTileProperty("HasCreature", self.NewLocation.x -1,self.NewLocation.y -1,ctx,"Creatures") ~= 1) then
		print("Im dr Rockso")
		IsUpLeftAvailable	= true
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x -1,self.NewLocation.y,ctx,"Ground") ~= 1 and getTileProperty("HasCreature", self.NewLocation.x -1,self.NewLocation.y ,ctx,"Creatures") ~= 1) then
		print("Im dr Rockso")
		IsLeftAvailable	= true
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x -1,self.NewLocation.y + 1,ctx,"Ground") ~= 1 and getTileProperty("HasCreature", self.NewLocation.x -1,self.NewLocation.y +1,ctx,"Creatures") ~= 1) then
		print("Im dr Rockso")
		IsDownLeftAvailable	= true
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x ,self.NewLocation.y + 1,ctx,"Ground") ~= 1 and getTileProperty("HasCreature", self.NewLocation.x ,self.NewLocation.y +1,ctx,"Creatures") ~= 1) then
		print("Im dr Rockso")
		IsDownAvailable	= true
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x +1,self.NewLocation.y + 1,ctx,"Ground") ~= 1 and getTileProperty("HasCreature", self.NewLocation.x + 1,self.NewLocation.y +1,ctx,"Creatures") ~= 1) then
		print("Im dr Rockso")
		IsDownRighAvailable	= true
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x +1,self.NewLocation.y ,ctx,"Ground") ~= 1 and getTileProperty("HasCreature", self.NewLocation.x + 1,self.NewLocation.y ,ctx,"Creatures") ~= 1) then
		print("Im dr Rockso")
		IsRightAvailable	= true
	end
	
	if(getTileProperty("obstacle", self.NewLocation.x +1,self.NewLocation.y -1,ctx,"Ground") ~= 1 and getTileProperty("HasCreature", self.NewLocation.x + 1,self.NewLocation.y -1 ,ctx,"Creatures") ~= 1) then
		print("Im dr Rockso")
		IsUpRightAvailable	= true
	end

	--get prefered game move
	
	local NoMoveWorth = self.Lazyness
	local UpMoveWorth = 0
	local UpLeftMoveWorth = 0
	local LeftMoveWorth = 0
	local DownLeftMoveWorth = 0
	local DownMoveWorth = 0
	local DownRightMoveWorth = 0
	local RightMoveWorth = 0
	local UpRightMoveWorth = 0
	
	--evaluate game moves
	
	if IsUpAvailable then
		--project move vector onto move direction
		UpMoveWorth = vecMoveDirectionVector:dot( Vector:new(0,-1))
	end
	
	if IsUpLeftAvailable then
	
		--project move vector onto move direction
		UpLeftMoveWorth = vecMoveDirectionVector:dot( Vector:new(-1,-1))
		
	end
	
	if IsLeftAvailable then
		--project move vector onto move direction
		LeftMoveWorth = vecMoveDirectionVector:dot( Vector:new(-1,0))
	end
	
	if IsDownLeftAvailable then
		--project move vector onto move direction
		DownLeftMoveWorth = vecMoveDirectionVector:dot( Vector:new(-1,1))
	end
	
	if IsDownAvailable then
		--project move vector onto move direction
		DownMoveWorth = vecMoveDirectionVector:dot( Vector:new(0,1))
	end
	
	if IsDownRighAvailable then
		--project move vector onto move direction
		DownRightMoveWorth = vecMoveDirectionVector:dot( Vector:new(1,1))
	end
	
	if IsRightAvailable then
		--project move vector onto move direction
		RightMoveWorth = vecMoveDirectionVector:dot( Vector:new(1,0))
	end
	
	if IsUpRightAvailable then
		--project move vector onto move direction
		UpRightMoveWorth = vecMoveDirectionVector:dot( Vector:new(1,-1))
	end
	
	--get best move
		--compair the cells grazing amount to the current cels grazing amount
	if NoMoveWorth > UpMoveWorth and 
		NoMoveWorth > UpLeftMoveWorth and 
		NoMoveWorth > LeftMoveWorth and
		NoMoveWorth > DownLeftMoveWorth and 
		NoMoveWorth > DownMoveWorth and 
		NoMoveWorth > DownRightMoveWorth and 
		NoMoveWorth > RightMoveWorth and 
		NoMoveWorth > UpRightMoveWorth then
		
		return Vector:new(0,0)
	
	end
	
	if UpMoveWorth > NoMoveWorth and 
		UpMoveWorth > UpLeftMoveWorth and 
		UpMoveWorth > LeftMoveWorth and
		UpMoveWorth > DownLeftMoveWorth and 
		UpMoveWorth > DownMoveWorth and 
		UpMoveWorth > DownRightMoveWorth and 
		UpMoveWorth > RightMoveWorth and 
		UpMoveWorth > UpRightMoveWorth then
		
		return Vector:new(0,-1)
	
	end
	
	if UpLeftMoveWorth > NoMoveWorth and 
		UpLeftMoveWorth > UpMoveWorth and 
		UpLeftMoveWorth > LeftMoveWorth and
		UpLeftMoveWorth > DownLeftMoveWorth and 
		UpLeftMoveWorth > DownMoveWorth and 
		UpLeftMoveWorth > DownRightMoveWorth and 
		UpLeftMoveWorth > RightMoveWorth and 
		UpLeftMoveWorth > UpRightMoveWorth then
		
		return Vector:new(-1,-1)
	
	end
	
	if LeftMoveWorth > NoMoveWorth and 
		LeftMoveWorth > UpMoveWorth and 
		LeftMoveWorth > UpLeftMoveWorth and
		LeftMoveWorth > DownLeftMoveWorth and 
		LeftMoveWorth > DownMoveWorth and 
		LeftMoveWorth > DownRightMoveWorth and 
		LeftMoveWorth > RightMoveWorth and 
		LeftMoveWorth > UpRightMoveWorth then
		
		return Vector:new(-1,0)
	
	end
	
	if DownLeftMoveWorth > NoMoveWorth and 
		DownLeftMoveWorth > UpMoveWorth and 
		DownLeftMoveWorth > UpLeftMoveWorth and
		DownLeftMoveWorth > LeftMoveWorth and 
		DownLeftMoveWorth > DownMoveWorth and 
		DownLeftMoveWorth > DownRightMoveWorth and 
		DownLeftMoveWorth > RightMoveWorth and 
		DownLeftMoveWorth > UpRightMoveWorth then
		
		return Vector:new(-1,1)
	
	end
	
	if DownMoveWorth > NoMoveWorth and 
		DownMoveWorth > UpMoveWorth and 
		DownMoveWorth > UpLeftMoveWorth and
		DownMoveWorth > LeftMoveWorth and 
		DownMoveWorth > DownLeftMoveWorth and 
		DownMoveWorth > DownRightMoveWorth and 
		DownMoveWorth > RightMoveWorth and 
		DownMoveWorth > UpRightMoveWorth then
		
		return Vector:new(0,1)
	
	end
	
	if DownRightMoveWorth > NoMoveWorth and 
		DownRightMoveWorth > UpMoveWorth and 
		DownRightMoveWorth > UpLeftMoveWorth and
		DownRightMoveWorth > LeftMoveWorth and 
		DownRightMoveWorth > DownLeftMoveWorth and 
		DownRightMoveWorth > DownMoveWorth and 
		DownRightMoveWorth > RightMoveWorth and 
		DownRightMoveWorth > UpRightMoveWorth then
		
		return Vector:new(1,1)
	
	end
	
	if RightMoveWorth > NoMoveWorth and 
		RightMoveWorth > UpMoveWorth and 
		RightMoveWorth > UpLeftMoveWorth and
		RightMoveWorth > LeftMoveWorth and 
		RightMoveWorth > DownLeftMoveWorth and 
		RightMoveWorth > DownMoveWorth and 
		RightMoveWorth > DownRightMoveWorth and 
		RightMoveWorth > UpRightMoveWorth then
		
		return Vector:new(1,0)
	
	end
	
	if UpRightMoveWorth > NoMoveWorth and 
		UpRightMoveWorth > UpMoveWorth and 
		UpRightMoveWorth > UpLeftMoveWorth and
		UpRightMoveWorth > LeftMoveWorth and 
		UpRightMoveWorth > DownLeftMoveWorth and 
		UpRightMoveWorth > DownMoveWorth and 
		UpRightMoveWorth > DownRightMoveWorth and 
		UpRightMoveWorth > RightMoveWorth then
		
		return Vector:new(1,-1)
	
	end
	
	return Vector:new(0,0)

end

--move the creature
function Creature:Move(dt,oldstate,ctx,vecMoveDirectionVector)
	--unmark current cell as ocupied
	setTileProperty("HasCreature",0, self.NewLocation.x,self.NewLocation.y ,ctx)
	
	--mark future cell as ocupied
	setTileProperty("HasCreature",1, self.NewLocation.x + vecMoveDirectionVector.x,self.NewLocation.y + vecMoveDirectionVector.y,ctx)
	
	--apply new position to creature
	self.OldLocation.x = self.NewLocation.x
	self.OldLocation.y = self.NewLocation.y
	
	self.NewLocation.x =  self.NewLocation.x + vecMoveDirectionVector.x
	self.NewLocation.y =  self.NewLocation.y + vecMoveDirectionVector.y
end

--get the direction the character wants to go for more food
function Creature:Grazing(dt,oldstate,ctx)
	
	--create a movement vector
	local vecGrazingDirection = Vector:new(0,0)
	
	--get the food in the cells around the creature
	local CurrentFood = self:GetFoodLevelForThisCreature(self.NewLocation.x,self.NewLocation.y,ctx)
	local UpFood = self:GetFoodLevelForThisCreature(self.NewLocation.x,self.NewLocation.y -1,ctx)
	local UpLeftFood = self:GetFoodLevelForThisCreature(self.NewLocation.x -1,self.NewLocation.y -1,ctx)
	local LeftFood = self:GetFoodLevelForThisCreature(self.NewLocation.x -1,self.NewLocation.y,ctx)
	local DownLeftFood = self:GetFoodLevelForThisCreature(self.NewLocation.x -1,self.NewLocation.y + 1,ctx)
	local DownFood = self:GetFoodLevelForThisCreature(self.NewLocation.x ,self.NewLocation.y + 1,ctx)
	local DownRightFood = self:GetFoodLevelForThisCreature(self.NewLocation.x + 1,self.NewLocation.y + 1,ctx)
	local RightFood = self:GetFoodLevelForThisCreature(self.NewLocation.x + 1,self.NewLocation.y,ctx)
	local UpRightFood = self:GetFoodLevelForThisCreature(self.NewLocation.x + 1,self.NewLocation.y -1,ctx)
		

	--compair the cells grazing amount to the current cels grazing amount
	if CurrentFood > UpFood and 
		CurrentFood > UpLeftFood and 
		CurrentFood > LeftFood and
		CurrentFood > DownLeftFood and 
		CurrentFood > DownFood and 
		CurrentFood > DownRightFood and 
		CurrentFood > RightFood and 
		CurrentFood > UpRightFood then
		
		return Vector:new(0,0)
	
	end
	
	if UpFood > CurrentFood and 
		UpFood > UpLeftFood and 
		UpFood > LeftFood and 
		UpFood > DownLeftFood and 
		UpFood > DownFood and 
		UpFood > DownRightFood and 
		UpFood > RightFood and 
		UpFood > UpRightFood then
		
		return Vector:new(0,-1)
	
	end
	
	if UpLeftFood > CurrentFood and 
		UpLeftFood > UpFood and 
		UpLeftFood > LeftFood and 
		UpLeftFood > DownLeftFood and 
		UpLeftFood > DownFood and 
		UpLeftFood > DownRightFood and 
		UpLeftFood > RightFood and 
		UpLeftFood > UpRightFood then
		
		return Vector:new(-1,-1)
	
	end
	
	if LeftFood > CurrentFood and 
		LeftFood > UpFood and 
		LeftFood > UpLeftFood and 
		LeftFood > DownLeftFood and 
		LeftFood > DownFood and 
		LeftFood > DownRightFood and 
		LeftFood > RightFood and 
		LeftFood > UpRightFood then
		
		return Vector:new(-1,0)
	
	end
	
	if DownLeftFood > CurrentFood and 
		DownLeftFood > UpFood and 
		DownLeftFood > UpLeftFood and 
		DownLeftFood > LeftFood and 
		DownLeftFood > DownFood and 
		DownLeftFood > DownRightFood and 
		DownLeftFood > RightFood and 
		DownLeftFood > UpRightFood then
		
		return Vector:new(-1,1)
	
	end
	
	if DownFood > CurrentFood and 
		DownFood > UpFood and 
		DownFood > UpLeftFood and 
		DownFood > LeftFood and 
		DownFood > DownLeftFood and 
		DownFood > DownRightFood and 
		DownFood > RightFood and 
		DownFood > UpRightFood then
		
		return Vector:new(0,1)
	
	end
	
	if DownRightFood > CurrentFood and 
		DownLeftFood > UpFood and 
		DownLeftFood > UpLeftFood and 
		DownLeftFood > LeftFood and 
		DownLeftFood > DownLeftFood and 
		DownLeftFood > DownFood and 
		DownLeftFood > RightFood and 
		DownLeftFood > UpRightFood then
		
		return Vector:new(1,1)
	
	end
	
	if RightFood > CurrentFood and 
		RightFood > UpFood and 
		RightFood > UpLeftFood and 
		RightFood > LeftFood and 
		RightFood > DownLeftFood and 
		RightFood > DownFood and 
		RightFood > DownLeftFood and 
		RightFood > UpRightFood then
		
		return Vector:new(1,0)
	
	end
	
	if UpRightFood > CurrentFood and 
		UpRightFood > UpFood and 
		UpRightFood > UpLeftFood and 
		UpRightFood > LeftFood and 
		UpRightFood > DownLeftFood and 
		UpRightFood > DownFood and 
		UpRightFood > DownLeftFood and 
		UpRightFood > RightFood then
		
		return Vector:new(1,-1)
	
	end
	
	return Vector:new(0,0)

end