RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
    if ESX.PlayerData.job == "truckerm" then
        local Player = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(Player)
        local distance = GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, Config.dashboard.x, Config.dashboard.y, Config.dashboard.z)
        
        local mk = Config.Marker
        if distance > 2.0 then
            DrawMarker(mk.type, Config.dashboard.x, Config.dashboard.y, Config.dashboard.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
        elseif distance <= 2.0 then
            DrawText3Ds(Config.dashboard.x, Config.dashboard.y, Config.dashboard.z, "~y~[G]~s~ Open Dashboard")
            if IsControlJustPressed(0, 47) then
                QuickRepairVehicle()
            end
        end
    end
end)