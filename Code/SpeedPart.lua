script.Parent.Touched:Connect(function(plr)	--when the part is touched
	if plr.Parent:FindFirstChild("Humanoid") then  --if the part that touched has a humanoid so checking if a player
		if plr.Parent.Humanoid.WalkSpeed == 16 then --if the walkspeed is 16 (16 is the normall)
			plr.Parent.Humanoid.WalkSpeed = 100 --gives the player speed by changing the walkspeed to 100 
			script.Disabled = true   --disabling the script so the player can move away from the part 
			wait(0.5) 
			script.Disabled = false --Enaberling the script again
		else -- if the players walkspeed is not 16 then do this instead. If you only want to give speed and not take it away then you can remove this bit 
			plr.Parent.Humanoid.WalkSpeed = 16 --change the walkspeed to 16
			script.Disabled = true
			wait(0.5)
			script.Disabled = false
		end
	end
end)

