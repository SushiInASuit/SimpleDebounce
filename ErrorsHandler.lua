local ErrorsHandler = {}

function ErrorsHandler.PlayerFetchFailed(Player)
	return ((Player.Name or Player).." was not recognised by the script. Removal declined.")
end

function ErrorsHandler.KeyFetchFailed(Player, Key)
	return (Key.." debounce was not recognised by the script for "..(Player.Name or Player)..".")
end

return ErrorsHandler
