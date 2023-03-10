function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

function StartCarContract() -- cardealers comment
    local StartContract = false
    local BaseFee = 500
    local FeePerExtraDelivery = 850

    ESX.TriggerServerCallback("isTruckOwned", function(HasTruck)
        if HasTruck then
            SpawnCarTrailer()
        else
            return
            TriggerEvent('chat:addMessage', {
                args = { 'You need your company truck!' }
            })
        end
    end, source)
end

function SpawnCarTrailer() -- cardealers
    -- load the model
    RequestModel("tr2")

    -- wait for the model to load
    while not HasModelLoaded("tr2") do
        Wait(500) -- often you'll also see Citizen.Wait
    end
    local pos = Config.CarTrailer
    local vehicle = CreateVehicle("tr2", pos.x, pos.y, pos.z, pos.w, true, false)

    TriggerEvent('chat:addMessage', {
        args = { 'Nice, now go deliver the cars to the dealer.' }
    })

end

function SpawnTrailer(jobType)
    print(jobType)

    local pos =  Config[jobType].trailerSpawn
    local vehicleType = Config[jobType].vehicle
    print(jobType)
    RequestModel(vehicleType)

    while not HasModelLoaded(vehicleType) do
        Wait(500)
    end
    
    local vehicle = CreateVehicle(vehicleType, pos.x, pos.y, pos.z, pos.w, true, false)

end

function SpawnContractItems(contract)
    if contract.type == "car" then
        contract.items = json.decode(contract.items)
        for k, v in pairs(contract.items) do
            print("entered " .. v.name)
            local vehicleType = v.name
            local pos = Config[contract.type].spawnPoint
            RequestModel(vehicleType)
            
            while not HasModelLoaded(vehicleType) do
                Wait(500)
            end
            for i=1,v.quantity,1 do
                local closestVehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 71)
                print(closestVehicle)
                if closestVehicle == 0 then
                    print("EMPTY")
                    local vehicle = CreateVehicle(vehicleType, pos.x, pos.y, pos.z, pos.w, true, false)
                    print("Spawned at " , pos.x, pos.y)
                else
                    while GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 71) ~= 0 do
                        Wait(10)
                    end
                    local vehicle = CreateVehicle(vehicleType, pos.x, pos.y, pos.z, pos.w, true, false)

                    print("NOT EMPTY")
                        
                end
                    
            end
               
        end
    end
    return true
end

function spawnDelieveryMarkers()
end