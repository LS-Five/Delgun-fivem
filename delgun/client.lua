local toggle = false
RegisterCommand("delgun", function()
    delugun()
    toggle = true
end)
RegisterCommand("delgunoff", function()
    delugun()
    toggle = false
end)

function delugun()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if toggle then
                if IsPlayerFreeAiming(PlayerId()) then
                    local entity = getEntity(PlayerId())
                    if IsPedShooting(GetPlayerPed(-1)) then
                        SetEntityAsMissionEntity(entity, true, true)
                        DeleteEntity(entity)
                    end
                end
            else
                break
            end
        end
    end)
end
function getEntity(player)
    local result, entity = GetEntityPlayerIsFreeAimingAt(player)
    return entity
end
