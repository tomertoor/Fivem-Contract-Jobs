ESX = {}
PlayerData = {}
onContract = false

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
  end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do
        if PlayerData.job and PlayerData.job.name == "truckerm" then
            local Player = GetPlayerPed(-1)
            local playerCoords = GetEntityCoords(Player)
            local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, Config.dashboard.x, Config.dashboard.y, Config.dashboard.z)
            local mk = Config.Marker
            if distance > 2.0 then
                DrawMarker(mk.type, Config.dashboard.x, Config.dashboard.y, Config.dashboard.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
            elseif distance <= 2.0 then
                DrawText3Ds(Config.dashboard.x, Config.dashboard.y, Config.dashboard.z, "~y~[G]~s~ Open Dashboard")
                if IsControlJustPressed(0, 47) then
                    openJobMenu()
                end
            end
        end
        Wait(1)
    end
end)

function openJobMenu()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'loading_data',
    })
    Wait(500)
    SendNUIMessage({
        action = 'dashboard',
    })
end

--[[Citizen.CreateThread(function()
    print("Done")
    onContract = true
    local mk = Config.DeliverMarker
    local delieverPoint = Config["car"].delieveryPoint
    local Player = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(Player)
    SetNewWaypoint(delieverPoint.x, delieverPoint.y)
    while onContract do
        Wait(0)
        local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, delieverPoint.x, delieverPoint.y, delieverPoint.z)
        if distance < 50 then
            --DrawMarker(mk.type, delieverPoint.x, delieverPoint.y, delieverPoint.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
            if distance < 10.0 then
                DrawMarker(20, delieverPoint.x, delieverPoint.y, delieverPoint.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
                DrawText3Ds(delieverPoint.x, delieverPoint.y, delieverPoint.z, "~y~[G]~s~ Open Dashboard")
                if IsControlJustPressed(0, 47) then
                    
                end
            end
        end
    end
end)]]

Citizen.CreateThread(function()
    local mk = { enable = true, drawDist = 7.5, type = 27, scale = {x = 3.6, y = 3.6, z = 3.6}, color = {r = 255, g = 165, b = 0, a = 100}}
    local delieverPoint = Config["car"].delieveryPoint
    local Player = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(Player)
    local countOfDepositCars = 0
    local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, delieverPoint.x, delieverPoint.y, delieverPoint.z)
    while true do
        Wait(0)
        playerCoords = GetEntityCoords(Player)
        distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, delieverPoint.x, delieverPoint.y, delieverPoint.z)
        if distance < 50 then
            print("Inside 50 " .. distance)
            DrawMarker(mk.type, delieverPoint.x, delieverPoint.y, delieverPoint.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
            if distance < 10 then --and IsPedInVehicle(Player) then
                print("Inside 10")
                --DrawMarker(20, delieverPoint.x, delieverPoint.y, delieverPoint.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
                DrawText3Ds(delieverPoint.x, delieverPoint.y, delieverPoint.z+1, "~y~[G]~s~ Deposit Car (Stay In It!)")
                print("hi")
                if distance < 5 IsControlJustPressed(0, 47) then
                    countOfDepositCars = countOfDepositCars + 1
                    if countOfDepositCars == 6 then
                        TriggerServerEvent('trucking:finishContract', details)
                    end
                end
            end
        end
    end
end)

--[[RegisterNetEvent("trucking:startContract")
AddEventHandler("trucking:startContract", function(details)
    SpawnTrailer(details.type)
    print(details)
    SpawnContractItems(details)
    print("Done")
    onContract = true
    local mk = Config.DelieverMarker
    local delieverPoint = Config[details.type].delieveryPoint
    local Player = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(Player)
    SetNewWaypoint(delieverPoint.x, delieverPoint.y)
    Citizen.CreateThread(function()
        while onContract do
            Wait(10)
            local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, delieverPoint.x, delieverPoint.y, delieverPoint.z)
            if distance < 50 then
                DrawMarker(mk.type, delieverPoint.x, delieverPoint.y, delieverPoint.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
                if distance < 10 and IsPedInVehicle(Player) then
                    DrawMarker(20, delieverPoint.x, delieverPoint.y, delieverPoint.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
                    DrawText3Ds(Config.dashboard.x, Config.dashboard.y, Config.dashboard.z, "~y~[G]~s~ Open Dashboard")
                    if IsControlJustPressed(0, 47) then
                        
                    end
                end
            end
        end
    end)
end)]]