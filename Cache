-- // Services
local PlayerService = game:GetService("Players")

-- // SimpleDebounce Module
local SimpleDebounce = require(script.Parent).New()

-- // Functions
local function PlayerRemove(Player)
	SimpleDebounce:RemovePlayer(Player)
end

-- // Events
PlayerService.PlayerRemoving:Connect(PlayerRemove)

