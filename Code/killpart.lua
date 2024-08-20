local Part = script.Parent

-- Insta-Kill
Part.Touched:Connect(function(part: Part | any): ()
	-- Check whatever touches the part has a Humanoid and a HumanoidRootPart.
	if part.Parent:FindFirstChild("Humanoid") and part.Parent:FindFirstChild("HumanoidRootPart") then
		local Character = part.Parent
		Character.Humanoid.Health = nil -- Insta-Kills the player.
	end
end)

-- Damage
local Debounce = false

Part.Touched:Connect(function(part: Part | any): ()
	-- Check if whatever touches the part has a Humanoid and a HumanoidRootPart, and if the code is not on debounce, because a player touched it.
	if part.Parent:FindFirstChild("Humanoid") and part.Parent:FindFirstChild("HumanoidRootPart") and not Debounce then
		local Character = part.Parent
		Character.Humanoid.Health -= 25 -- Damages the Player 25 HP

		Debounce = true -- Set debounce to true to prevent multiple touches from triggering this block immediately.

		task.wait(0.5) -- Wait for 0.5 seconds before allowing the next touch to trigger.

		Debounce = false -- Reset debounce to false to allow the next touch to trigger this block.
	end
end)
