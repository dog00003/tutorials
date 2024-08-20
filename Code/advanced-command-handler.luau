-- ROBLOX Services
local Players = game:GetService("Players")

--------------------------------------------

local permissionsTable = {
	["Player"] = {
		Id = 0,
	},
	["Administrator"] = {
		Id = 1,
		Users = { "Your_UserName"; 1; }, -- UserName / UserId
		--Group = { Id = 0; Rank = 1; },
	},
}

-- Functions
local function checkRank(player: Player): string
	for rank, requirements in pairs(permissionsTable) do
		if requirements.Group then
			if not requirements.Group.Id or not requirements.Group.Rank then
				warn("Requirements table is missing mandatory fields.")
				return "Player"
			end

			local RankInGroup = player:GetRankInGroup(requirements.Group.Id)
			if RankInGroup >= requirements.Group.Rank then
				return rank
			end
		end

		if requirements.Users then
			for _, user in ipairs(requirements.Users) do
				if (typeof(user) == "string" and player.Name == user) or 
					(typeof(user) == "number" and player.UserId == user) then
					return rank
				end
			end
		end
	end

	return "Player"
end

local function checkPermissions(player: Player, requiredRank: string): boolean
	local playerRank = checkRank(player)
	local playerRankId = permissionsTable[playerRank].Id or 0
	local requiredRankId = permissionsTable[requiredRank] and permissionsTable[requiredRank].Id or 0

	return playerRankId >= requiredRankId
end

local function handleCommand(player: Player, commandName: string, args: {string})
	if commandName == "kick" then
		local hasPermissions = checkPermissions(player, "Administrator")
		if hasPermissions then
			if #args >= 1 then
				if args[1] == "all" then
					for _, targetPlayer in ipairs(Players:GetPlayers()) do
						targetPlayer:Kick("You have been kicked by an admin.")
					end
				else
					local targetPlayerName = args[1]
					local targetPlayer = Players:FindFirstChild(targetPlayerName)

					if targetPlayer then
						targetPlayer:Kick("You have been kicked by an admin.")
					end
				end
			end
		end
	end
end

-- Events
Players.PlayerAdded:Connect(function(player: Player)
	player.Chatted:Connect(function(message: string)
		if string.sub(message, 1, 1) == "/" then 
			local splitMessage = string.split(string.sub(message, 2), " ")
			local commandName = table.remove(splitMessage, 1)
			local args = splitMessage

			handleCommand(player, commandName, args)
		end
	end)
end)
