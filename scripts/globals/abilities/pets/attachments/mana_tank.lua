-----------------------------------
-- Attachment: Mana Tank
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    -- We do not have support to do a fraction of a percent so we rounded
    pet:addMod(tpz.mod.MPP, 5)
end

function onUnequip(pet)
    pet:delMod(tpz.mod.MPP, 5)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    local power = 0
    if maneuvers > 0 then
        power = math.floor(maneuvers + (pet:getMaxMP() * (0.2 * maneuvers) / 100))
    end
    updateModPerformance(pet, tpz.mod.REFRESH, 'mana_tank_mod', power)
end
