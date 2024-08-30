-- This Function Loads ESX
if (GetResourceState("es_extended") == "started") then
    if (exports["es_extended"] and exports["es_extended"].getSharedObject) then
        ESX = exports["es_extended"]:getSharedObject()
    else
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
end

function BlackoutOn()
    SetArtificialLightsState(true)
    PlaySoundFrontend(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
    SetArtificialLightsStateAffectsVehicles(false)
end

function BlackoutOff()
    SetArtificialLightsState(false)
    PlaySoundFrontend(-1, "police_notification", "DLC_AS_VNT_Sounds", 1)
    SetArtificialLightsStateAffectsVehicles(true)
end

function countTime(timeInHours)
    time = timeInHours
end

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if time >= 0 then
            time = time - 1
        else
            BlackoutOff()
        end
    end
end)

time = 0

Citizen.CreateThread(function()
    while true do
        Wait(0)
        DrawMarker(Config.Marker.Type, Config.Marker.Pos.x, Config.Marker.Pos.y, Config.Marker.Pos.z, 0.0, 0.0, 0.0, 0.0,
            0.0, 0.0, Config.Marker.Scale.x, Config.Marker.Scale.y, Config.Marker.Scale.z, Config.Marker.RGB.r,
            Config.Marker.RGB.g, Config.Marker.RGB.b, Config.Marker.Alpha, Config.Marker.Bobbing,
            Config.Marker.FaceCamera, 2, nil, nil)
        Distance = #(GetEntityCoords(PlayerPedId()) - Config.Marker.Pos)
        if Distance <= 5 then
            exports['okokTextUI']:Open('[E] zum Hacken', 'darkblue', 'left', false)
            if IsControlJustPressed(0, Config.Input) then
                if time <= 0 then
                    local success = lib.skillCheck({ 'easy', 'easy', 'easy' }, { 'w', 'a', 's', 'd' })
                    if success == true and time <= 0 then
                        NetworkOverrideClockTime(00, 00, 00)
                        BlackoutOn()
                        countTime(Config.Time * 60000)
                    end
                else
                    exports['okokNotify']:Alert('Blackout', 'Du musst' .. time .. ' Sekunden warten', 2599, 'darkblue', false)
                end
            end
        else
            exports['okokTextUI']:Close()
        end
    end
end)
