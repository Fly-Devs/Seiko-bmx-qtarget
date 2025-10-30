local isBMX = false

local function BMX()
    if not isBMX then
        isBMX = true
        if not IsPedInAnyVehicle(PlayerPedId()) then
            local playerid = PlayerPedId()
            local hash = GetHashKey('bmx')
            RequestModel()
            while not HasModelLoaded(hash) do
                RequestModel(hash)
                Wait(100)
            end
            bike = CreateVehicle(hash, GetEntityCoords(playerid), GetEntityHeading(playerid), true, true)
            SetVehicleOnGroundProperly(bike)
        end
    else
        DeleteEntity(bike)
        isBMX = false
        TriggerServerEvent("Seiko-BMX:server")
    end
end

RegisterNetEvent('Seiko-BMX:SpawnBMX', function ()
    BMX()
end)

CreateThread(function()
    exports.qtarget:AddTargetModel(Config.BMXITEM, {
        options = {
            {
                icon = "fas fa-bicycle",
                label = "Prendre le bmx",
                onSelect = function ()
                    BMX()
                end
            },
        },
        distance = 1.5
    })
end)

print("BMX Item By Seiko | Fly Dev's") -- Si vous retiré le print merci de ne pas vous approprier le script