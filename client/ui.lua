
RegisterNUICallback("action", function(data)
    print(data.action)
    if data.action == "close" then
        SetNuiFocus(false, false)
    end
end)

RegisterNUICallback("retreiveContracts", function(cb)
    -- contracts is test case for available contracts
    contracts = {
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
    print("length is " .. #contracts[1])
    --ESX.TriggerServerCallback("trucking:getContracts", function(contracts) 
        SendNUIMessage({action = "contracts_page", info = contracts})        
    --end, source)
end)