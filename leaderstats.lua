game.Players.PlayerAdded:Connect(function(plr) --when a player joins this script will start
	
	local stats = Instance.new("Folder")   -- makes a folder
	stats.Name = "leaderstats"               -- gives the folder the name "leaderstats"
	stats.Parent = plr							-- puts the folder with the player 
	
	local cash = Instance.new("IntValue")    --makes a new intvalue 
	cash.Parent = stats  -- puts the value in the folder that we created above
	cash.Name = "Cash" --names the value to "Cash"
	cash.Value = 0 	 --you dont need to do this line but if you want your 
						--players to start with a bit of cash then change the number
	
    --you can have more if you want for example  
	
	local points = Instance.new("IntValue")
	points.Parent = stats
	points.Name = "Points"
	points.Value = 100 		--I changed the value so the players start with 100 points
	
end)