-----------------------------------
-- Attachment: Power Cooler
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.BLACK_MAGIC_COST, 'power_cooler_blm_cost', 0)
    updateModPerformance(pet, tpz.mod.WHITE_MAGIC_COST, 'power_cooler_whm_cost', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.BLACK_MAGIC_COST, 'power_cooler_blm_cost', -10)
        updateModPerformance(pet, tpz.mod.WHITE_MAGIC_COST, 'power_cooler_whm_cost', -10)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.BLACK_MAGIC_COST, 'power_cooler_blm_cost', -20)
        updateModPerformance(pet, tpz.mod.WHITE_MAGIC_COST, 'power_cooler_whm_cost', -20)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.BLACK_MAGIC_COST, 'power_cooler_blm_cost', -35)
        updateModPerformance(pet, tpz.mod.WHITE_MAGIC_COST, 'power_cooler_whm_cost', -35)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.BLACK_MAGIC_COST, 'power_cooler_blm_cost', -50)
        updateModPerformance(pet, tpz.mod.WHITE_MAGIC_COST, 'power_cooler_whm_cost', -50)
    end
end
