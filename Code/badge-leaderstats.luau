--[[
 \> Please note, that there is a rate limit
 :: 50 + 35 * [number of players] per minute
--]]

-- ROBLOX Services
local BadgeService = game:GetService("BadgeService")
local Players = game:GetService("Players")

--------------------------------------------

local badgeIds = { 0, 1 } -- Insert badgeids here.

-- Functions
local function checkPlayerBadges(player: Player)
	-- Create or get the leaderstats folder
	local leaderstatsFolder = player:FindFirstChild("leaderstats") or Instance.new("Folder")
	leaderstatsFolder.Name = "leaderstats"
	leaderstatsFolder.Parent = player

	-- Create the Badges value
	local badgesValue = leaderstatsFolder:FindFirstChild("Badges") or Instance.new("NumberValue")
	badgesValue.Name = "Badges"
	badgesValue.Parent = leaderstatsFolder
	badgesValue.Value = 0

	-- Check each badge
	for _, badge in pairs(badgeIds) do
		local success, hasBadge = pcall(function()
			return BadgeService:UserHasBadgeAsync(player.UserId, badge)
		end)
		
		if success and hasBadge then
			badgesValue.Value += 1
		elseif not success then
			warn("Error while checking if player has badge: " .. tostring(badge))
		end
	end
end

-- Events
Players.PlayerAdded:Connect(function(player: Player)
	checkPlayerBadges(player)
end)
