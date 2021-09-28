
RegisterNUICallback("action", function(data)
    print(data.action)
    if data.action == "close" then
        SetNuiFocus(false, false)
    end
end)

RegisterNUICallback("retreiveContracts", function(cb)
    ESX.TriggerServerCallback("trucking:getContracts", function(contracts) 
        cb(contracts)
    end, source)
end)