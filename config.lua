Config = {}

Config.dashboard = vector3(-79.8, 6501.9, 31.5)

-- Trucker should already have his own truck
-- Trailers

Config["car"] = 
{
    trailerSpawn = vector4(-97.44, 6495.43, 31.49, 230.36), -- trailer for 
    spawnPoint = vector4(-36.7, 6495.1, 31.4, 230.36), -- trailer for cars
    vehicle = "tr2",
    supplyPoint = vector4(-64.79, 6498.07, 31.49, 129.93),
    delieveryPoint = vector4(-15.0, -1096.75, 25.7, 161.35),
}
Config["gun"] = 
{
    trailerSpawn = vector4(-97.44, 6495.43, 31.49, 230.36), -- trailer for 
    vehicle = "tr2",
    delieveryPoint = vector4(-8.13, -1110.64, 26.7, 159.49),
}
Config["clothing"] = 
{
    trailerSpawn = vector4(-97.44, 6495.43, 31.49, 230.36), -- trailer for 
    vehicle = "tr2",
    delieveryPoint = vector4(-8.13, -1110.64, 28.64, 159.49),
}

Config["food"] = 
{
    trailerSpawn = vector4(-97.44, 6495.43, 31.49, 230.36), -- trailer for 
    vehicle = "tr2",
    delieveryPoint = vector4(-8.13, -1110.64, 28.64, 159.49),
}
Config["food"] = 
{
    trailerSpawn = vector4(-97.44, 6495.43, 31.49, 230.36), -- trailer for 
    vehicle = "tr2",
    delieveryPoint = vector4(-8.13, -1110.64, 28.64, 159.49),
}
-- Vehicles
--Config.CarTrailer = vector4(-64.79, 6498.07, 31.49, 129.93) -- 1 spawn to avoid people stealing



Config.Marker = { enable = true, drawDist = 7.5, type = 20, scale = {x = 0.6, y = 0.6, z = 0.6}, color = {r = 255, g = 165, b = 0, a = 100}}

Config.DeliverMarker = { enable = true, drawDist = 7.5, type = 27, scale = {x = 2.6, y = 2.6, z = 2.6}, color = {r = 255, g = 165, b = 0, a = 100}}