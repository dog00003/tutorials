local admins = {
	{user = "dog00003", rank = 1},
	{user = "otheruser", rank = 3},
}

game.Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(message)
		for i,v in pairs(admins) do
			if v.user == plr.Name then
				print("user is an admin")
				if message == "/Kick all" and v.rank >= 1 then
					for i,v in pairs(game.Players:GetChildren()) do
						v:kick("You have been kicked by an admin")
					end
				end
			end
		end
	end)
end)
