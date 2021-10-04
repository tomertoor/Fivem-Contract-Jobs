ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNUICallback("action", function(data)
    print(data.action)
    if data.action == "close" then
        SetNuiFocus(false, false)
    end
end)

RegisterNUICallback("retreiveContracts", function(cb)
    -- contracts is test case for available contracts
    --[[contracts = {
        {
            requester = "Tomer",
            type = "car",
            items = {
                {
                    name = "adder",
                    label = "Adder",
                    quantity = 2 
                },
                {
                    name = "deevo",
                    label = "Deevo",
                    quantity = 2 
                },
                {
                    name = "adder",
                    label = "Adder",
                    quantity = 2 
                },
            },
            money = 40000
        },
        {
            requester = "Ram",
            type = "car",
            items = {
                [1] = {
                    name = "adder",
                    label = "Adder",
                    quantity = 2 
                },
                [2] = {
                    name = "deevo",
                    label = "Deevo",
                    quantity = 2 
                },
                [3] = {
                    name = "adder",
                    label = "Adder",
                    quantity = 2 
                },
            },
            money = 40000
        }
    }
    print(contracts[1].requester)
    print("length is " .. #contracts[1])]]
    ESX.TriggerServerCallback("trucking:getAvailableContracts", function(contracts) 
        print("length is: " .. contracts[1].items)
        SendNUIMessage({action = "contracts_page", info = contracts})        
    end, source)
end)

RegisterNUICallback("takeContract", function(id)
    print("ID IS " .. id.data)
    ESX.TriggerServerCallback("trucking:checkAvailableContract", function(isTaken) 
        if isTaken then
            SendNUIMessage({action = "contractTaken"})
        end
    end, id.data)
end)