Contract{}

-- Contract.GetLevel = function(player, jobType)
-- end

Contract.GetDelivers = function(id)
end

Contract.incrementDelivery = function(id)
end

Contract.setDeliveries = function(id)
end

--- Resets the deliveries for a specific player.
-- Resets to 0 in the SQL.
-- @param id - The ID number of the player for example from RegisterCommand(source)
-- @return 0 For success or 1 for failure
Contract.resetDeliveries = function(id)
    MySQL.Async.execute("UPDATE delivered_contract SET deliveries = 0 WHERE identifier = @playerIdentifier",
    { ["@playerIdentifier"] = GetPlayerIdentifiers(id)[1]},
    function(result)end)
end

AddEventHandler("onResourceStart", function(resource)
    if resource == "contract-jobs" then

    end
end)