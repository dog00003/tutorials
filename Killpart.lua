script.Parent.Touched:Connect(function(plr)    -- when the part is touched run this script
	if plr.Parent:FindFirstChild("Humanoid") then      --If the thing that touches the 
											--part has a Humanoid which all players have		
		plr.Parent.Humanoid.Health = 0  	--it will kill the player
	end
end)


--If you would like it to only the damage the player a bit use the script below instead so basicly delete the top or bottom
--btw players start with 100 health

script.Parent.Touched:Connect(function(plr)    
	if plr.Parent:FindFirstChild("Humanoid") then     
		plr.Parent.Humanoid.Health -= 25 --takes away 25 health of the players current health
		script.Disabled = true	--disabling the script gives the player chance to move away
		wait(0.5)			 --but only for 0.5 sec you can change this to the delay you want
		script.Disabled = false --turns the script back on so the player will be 
		--damaged if they touch it again
		
	end
end)
