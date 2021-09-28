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
        local HasTruck = 't680'
        local SpawnCarTrailer = 'tr2'
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