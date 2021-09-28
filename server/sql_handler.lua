-- ESX.RegisterServerCallback("sql_jobs:increaceQuantity"
-- , function(src, cb, jobType)
--     MySQL.Async.execute("UPDATE ")
-- end)


ESX.RegisterServerCallback("sql_jobs:getDelivers"
, function(src, cb, target)
    MySQL.Async.fetchAll("SELECT deliveries FROM deliveries WHERE identifier=@playerId;",
    {
        ["@playerId"] = GetPlayerIdentifiers(target)
    },
    function(result)
        cb(result[1].deliveries)
    end)
 end)

ESX.RegisterServerCallback("sql_jobs:incrementDelivery"
, function(src, cb)
    MySQL.Async.execute("UPDATE deliveries_contract SET deliveries=deliveries+1 WHERE identifier=@playerId;",
    {
        ["@playerId"] = GetPlayerIdentifiers(src)
    },
    function(result)
        cb(result)
    end)
 end)

ESX.RegisterServerCallback("sql_jobs:setDeliveries"
, function(src, cb, amount)
    MySQL.Async.execute("UPDATE delivered_contract SET deliveries = @value WHERE identifier = @playerIdentifier;",
    {
        ["@value"]            = amount,
        ["@playerIdentifier"] = GetPlayerIdentifiers(src)[1]
    },
    function(result)
        cb(result)
    end)
 end)

ESX.RegisterServerCallback("sql_jobs:resetDeliveries", function(src, cb)
    MySQL.Async.execute("UPDATE delivered_contract SET deliveries = 0 WHERE identifier = @playerIdentifier;",
    { ["@playerIdentifier"] = GetPlayerIdentifiers(src)[1]},
    function(result)
        cb(result)
    end)
end)