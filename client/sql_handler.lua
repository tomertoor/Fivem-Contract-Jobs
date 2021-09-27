Contract{}

-- Contract.GetLevel = function(player, jobType)
-- end

Contract.GetDelivers = function(player, jobType)
end

Contract.incrementDelivery = function(player, jobType)
end

Contract.setDeliveries = function(player, jobType)
end

Contract.resetDeliveries = function(player, jobType)
    MySQL.Async.execute("")
end

AddEventHandler("onResourceStart", function(resource)
    if resource == "contract-jobs" then

    end
end)