-----------------------------------
-- Attachment: Damage Gauge
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------
function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.AUTO_HEALING_THRESHOLD, 'damage_gauge_threshold_II', 0)
    updateModPerformance(pet, tpz.mod.AUTO_HEALING_DELAY, 'damage_gauge_delay_II', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_THRESHOLD, 'damage_gauge_threshold_II', 25, 90)
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_DELAY, 'damage_gauge_delay_II', 3)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_THRESHOLD, 'damage_gauge_threshold_II', 40, 90)
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_DELAY, 'damage_gauge_delay_II', 3)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_THRESHOLD, 'damage_gauge_threshold_II', 35, 90)
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_DELAY, 'damage_gauge_delay_II', 3)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_THRESHOLD, 'damage_gauge_threshold_II', 90, 90)
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_DELAY, 'damage_gauge_delay_II', 3)
    end
end
