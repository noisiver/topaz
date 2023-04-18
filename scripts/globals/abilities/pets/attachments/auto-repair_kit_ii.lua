-----------------------------------
-- Attachment: Auto-repair Kit II
-----------------------------------
require("scripts/globals/automaton")
require("scripts/globals/status")
-----------------------------------
function onEquip(pet)
    pet:addMod(tpz.mod.HPP, 10)
end

function onUnequip(pet)
    pet:delMod(tpz.mod.HPP, 10)
end

function onManeuverGain(pet, maneuvers)
    onUpdate(pet, maneuvers)
end

function onManeuverLose(pet, maneuvers)
    onUpdate(pet, maneuvers - 1)
end

function onUpdate(pet, maneuvers)
    local power = 0
    if maneuvers == 1 then
        power = math.floor(3 + (pet:getMaxHP() * 0.06 / 100))
    elseif maneuvers == 2 then
        power = math.floor(6 + (pet:getMaxHP() * 1.2 / 100))
    elseif maneuvers == 3 then
        power = math.floor(9 + (pet:getMaxHP() * 1.8 / 100))
    end
    updateModPerformance(pet, tpz.mod.REGEN, 'autorepair_kit_ii_mod', power)
end
