RegisterNetEvent('wuski-scratchserial:scratchserial', function(data)
    local src = source

    if not data or not data.weapon or not data.slot then return end

    local weapon = exports.ox_inventory:GetSlot(src, data.slot)
    if not weapon or weapon.name ~= data.weapon then return end

    local hasItem = exports.ox_inventory:Search(src, 'count', 'steelfile') > 0
    if hasItem then
        if weapon.metadata and weapon.metadata.serial ~= 'Scratched' then
            weapon.metadata.serial = 'Scratched'
            exports.ox_inventory:SetMetadata(src, weapon.slot, weapon.metadata)
        end
    end
end)