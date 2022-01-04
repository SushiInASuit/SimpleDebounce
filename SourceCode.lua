local CurrentVersion = 1

-- // Services
local PlayerService = game:GetService("Players")

-- // Library
local ErrorsHandler = require(script.Errors)

-- // Functions
local DebounceHandler = {}
DebounceHandler.__index = DebounceHandler

function DebounceHandler.New()
	return setmetatable({}, DebounceHandler)
end

function DebounceHandler:Set(Player, Key, Time)		
	if self[Player.Name] == nil then		
		self[Player.Name] = {}
		self[Player.Name][Key] = {}
		
		local Key = self[Player.Name][Key]
		
		Key["Time"] = Time
		Key["Debounce"] = tick()
	else
		if self[Player.Name][Key] == nil then
			self[Player.Name][Key] = {}
			
			local Key = self[Player.Name][Key]

			Key["Time"] = Time
			Key["Debounce"] = tick()
		else
			self[Player.Name][Key]["Debounce"] = tick()
		end
	end
end

function DebounceHandler:Get(Player, Key)
	if self[Player.Name] ~= nil then		
		if self[Player.Name][Key] ~= nil then
			return ((tick() - self[Player.Name][Key]["Debounce"]) > self[Player.Name][Key]["Time"])
		else
			error(ErrorsHandler["KeyFetchFailed"](Player, Key))
		end
	else
		error(ErrorsHandler["PlayerFetchFailed"](Player))
	end
end
		
function DebounceHandler:RemovePlayer(Player)
	if self[Player.Name] ~= nil then
		self[Player.Name] = nil
		
		warn(Player.Name.." has been removed from debounce table")
	else
		error(ErrorsHandler["PlayerFetchFailed"](Player))
	end
end

function DebounceHandler:RemoveDebounce(Player, Key)
	if self[Player.Name] ~= nil then
		if self[Player.Name][Key] ~= nil then
			self[Player.Name][Key] = nil
			
			warn(Key.." debounce for "..Player.Name.." has been removed from debounce table")
		else
			error(ErrorsHandler["KeyFetchFailed"](Player, Key))
		end
	else
		error(ErrorsHandler["PlayerFetchFailed"](Player))
	end
end

function DebounceHandler:GetPlayerDebounces(Player)
	return self[Player.Name]
end

function DebounceHandler:GetAllDebounces()
	return self
end

function DebounceHandler:GetVersion()
	return CurrentVersion
end

return DebounceHandler

