local Part = script.Parent
local Debounce = false

Part.Touched:Connect(function(part: Part | any): ()
	-- Check if the part that touched this object has a Humanoid and HumanoidRootPart,
	-- and if the code is not currently on debounce (to prevent multiple triggers).
	if part.Parent:FindFirstChild("Humanoid") and part.Parent:FindFirstChild("HumanoidRootPart") and not Debounce then
		local Character = part.Parent
		local Humanoid: Humanoid = Character.Humanoid

		-- Check if the Humanoid's WalkSpeed is the default value (16).
		-- If it is, set it to 100 (speed up the character).
		if Humanoid.WalkSpeed == 16 then
			Character.Humanoid.WalkSpeed = 100
		else
			-- If the WalkSpeed is not 16 (meaning it might have been changed before),
			-- set it back to the default value (16).
			Character.Humanoid.WalkSpeed = 16
		end

		-- Set debounce to true to prevent this block of code from running multiple times in quick succession.
		Debounce = true

		-- Wait for 0.5 seconds before resetting the debounce.
		task.wait(0.5)

		-- Reset debounce to false, allowing the code to run again if the part is touched after this delay.
		Debounce = false
	end
end)
