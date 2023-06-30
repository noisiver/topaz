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
    updateModPerformance(pet, tpz.mod.AUTO_HEALING_THRESHOLD, 'damage_gauge_threshold', 0)
    updateModPerformance(pet, tpz.mod.AUTO_HEALING_DELAY, 'damage_gauge_delay', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_THRESHOLD, 'damage_gauge_threshold', 20, 90) -- 50%
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_DELAY, 'damage_gauge_delay', 3)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_THRESHOLD, 'damage_gauge_threshold', 35, 90) -- 75%
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_DELAY, 'damage_gauge_delay', 3)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_THRESHOLD, 'damage_gauge_threshold', 30, 90) -- 80%
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_DELAY, 'damage_gauge_delay', 3)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_THRESHOLD, 'damage_gauge_threshold', 15, 90) -- 90%
        updateModPerformance(pet, tpz.mod.AUTO_HEALING_DELAY, 'damage_gauge_delay', 3)
    end
end
