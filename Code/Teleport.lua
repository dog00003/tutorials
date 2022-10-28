script.Parent.Touched:Connect(function(plr)    --when the part it touched do this script
	if plr.Parent:FindFirstChild("Humanoid") then  --if the thing that touches the part 
													--has a Humanoid which all players do
		plr.Parent.HumanoidRootPart.CFrame = script.Parent.Parent.Teleport2.CFrame
		--it will move them to the position of the Teleport2 
	end --ending the if statment 
end) --ending the function