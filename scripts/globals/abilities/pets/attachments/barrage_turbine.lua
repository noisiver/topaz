-----------------------------------
-- Attachment: Barrage Turbine
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.BARRAGE_SHOT_COUNT, 'turbine_barrage', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.BARRAGE_SHOT_COUNT, 'turbine_barrage', 0)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.BARRAGE_SHOT_COUNT, 'turbine_barrage', 3)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.BARRAGE_SHOT_COUNT, 'turbine_barrage', 4)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.BARRAGE_SHOT_COUNT, 'turbine_barrage', 5)
    end
end
