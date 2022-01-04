-- // Services
local StorageService = game:GetService("ServerStorage")
local PlayerService = game:GetService("Players")

-- // SimpleDebounce Module
local SimpleDebounce = require(StorageService:WaitForChild("SimpleDebounceV1")).New()

-- // Functions
local function PlayerAdd(Player)
	SimpleDebounce:Set(Player, "Test", 3) 
	-- sets a debounce named "Test" with a cooldown of 3 seconds
	
	warn(SimpleDebounce:GetPlayerDebounces(Player))
	-- visualizes the debounces of the player
	
	while true do
		if SimpleDebounce:Get(Player, "Test") then
			-- the debounce is over!
			warn("Skill Activated!")
			
			SimpleDebounce:Set(Player, "Test")
			-- updates the debounce, now it'll be set to a new tick() for :Get() to use on
			
		else
			-- on cooldown! it hasn't been 3 seconds yet
			warn("On Cooldown!")
		end
		
		task.wait(1)
	end
end

-- // Events
PlayerService.PlayerAdded:Connect(PlayerAdd)

