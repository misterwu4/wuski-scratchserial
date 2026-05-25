local function ShowWeapons()
    if IsPedDeadOrDying(cache.ped, true) then 
        lib.notify({
            title = 'Cannot do that',
            description = 'You cannot scratch a weapon right now.',
            type = 'error'
        })
        return 
    end

    if IsPedArmed(cache.ped, 7) then
        SetCurrentPedWeapon(cache.ped, `WEAPON_UNARMED`, true)
    end

    local options = {}
    local playerItems = exports.ox_inventory:GetPlayerItems()
    local items = exports.ox_inventory:Items()

    for _, v in pairs(playerItems) do
        if items[v.name] and items[v.name].weapon and v.metadata and v.metadata.serial ~= 'Scratched' then
            options[#options + 1] = {
                title = items[v.name].label,
                description = 'Scratch Weapon Serial',
                metadata = {
                    {label = 'Serial', value = v.metadata.serial},
                    {label = 'Slot', value = v.slot},
                },
                onSelect = function()
                    local passed = lib.skillCheck({'medium', 'easy', 'medium', 'medium'}, {'w', 'a', 's', 'd'})

                    if passed then 
                        lib.notify({
                            title = 'Serial Scratch',
                            description = 'You have successfully scratched the serial number',
                            type = 'success',
                            duration = 2500
                        })                            
                        TriggerServerEvent('wuski-scratchserial:scratchserial', {
                            weapon = v.name,
                            slot = v.slot
                        })
                    else
                        lib.notify({
                            title = 'Serial Scratch',
                            description = 'You failed to scratch the serial number, try again.',
                            type = 'error',
                            duration = 2500
                        })
                    end
                end
            }
        end
    end

    lib.registerContext({
        id = 'wuski-scratchserial',
        title = 'Available Weapons',
        options = options
    })
    
    lib.showContext('wuski-scratchserial')
end

RegisterNetEvent('wuski-scratchserial:useSteelfile', function()
    ShowWeapons()
end)