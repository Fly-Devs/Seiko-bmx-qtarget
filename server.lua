ESX.RegisterUsableItem(Config.BMXITEM, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if source == nil and xPlayer == nil then return end
    xPlayer.removeInventoryItem(Config.BMXITEM, 1)
    TriggerClientEvent("Seiko-BMX:SpawnBMX", source)
end)

RegisterNetEvent("Seiko-BMX:server")
AddEventHandler("Seiko-BMX:server", function()
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if source == nil and xPlayer == nil then return end
    xPlayer.addInventoryItem(Config.BMXITEM, 1)
end)