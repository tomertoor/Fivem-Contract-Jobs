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

RegisterNetEvent("trucking:startContract")
AddEventHandler("trucking:startContract", function(details)
    SpawnTrailer(details.type)
    SpawnContractItems(details)
    onContract = true
    local mk = Config.DelieverMarker
    local delieverPoint = Config[jobType].delieveryPoint
    local Player = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(Player)
    Citizen.CreateThread(function()
        while onContract do
            local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, delieverPoint.x, delieverPoint.y, delieverPoint.z)
            if distance < 50 then
                DrawMarker(mk.type, delieverPoint.x, delieverPoint.y, delieverPoint.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
                if distance < 10 then
                    DrawMarker(20, delieverPoint.x, delieverPoint.y, delieverPoint.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
                    DrawText3Ds(Config.dashboard.x, Config.dashboard.y, Config.dashboard.z, "~y~[G]~s~ Open Dashboard")
                    if IsControlJustPressed(0, 47) then
                        
                    end
                end
            end
        end
    end)
end)