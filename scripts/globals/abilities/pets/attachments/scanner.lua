-----------------------------------
-- Attachment: Scanner
-- Custom effect since retail's apparently did nothing
-- Causes the Automaton to always use an elemental nuke that the target is weak to, or the strongest, and ignore maneuvers
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------
function onEquip(pet)
    onUpdate(pet, 0)
end

function onUnequip(pet)
    updateModPerformance(pet, tpz.mod.AUTO_SCAN_RESISTS, 'scanner_autoscan_resists', 0)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    if maneuvers == 0 then
        updateModPerformance(pet, tpz.mod.AUTO_SCAN_RESISTS, 'scanner_autoscan_resists', 29)
    elseif maneuvers == 1 then
        updateModPerformance(pet, tpz.mod.AUTO_SCAN_RESISTS, 'scanner_autoscan_resists', 49)
    elseif maneuvers == 2 then
        updateModPerformance(pet, tpz.mod.AUTO_SCAN_RESISTS, 'scanner_autoscan_resists', 59)
    elseif maneuvers == 3 then
        updateModPerformance(pet, tpz.mod.AUTO_SCAN_RESISTS, 'scanner_autoscan_resists', 69)
    end
end
