-----------------------------------
-- Attachment: Smoke Screen
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addMod(tpz.mod.EVA, 10)
    pet:addMod(tpz.mod.ACC, -10)
    pet:addMod(tpz.mod.RACC, -10)
end

function onUnequip(pet)
    pet:delMod(tpz.mod.EVA, 10)
    pet:delMod(tpz.mod.ACC, -10)
    pet:delMod(tpz.mod.RACC, -10)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(tpz.mod.EVA, 10)
        pet:addMod(tpz.mod.ACC, -10)
        pet:addMod(tpz.mod.RACC, -10)
    elseif maneuvers == 2 then
        pet:addMod(tpz.mod.EVA, 10)
        pet:addMod(tpz.mod.ACC, -10)
        pet:addMod(tpz.mod.RACC, -10)
    elseif maneuvers == 3 then
        pet:addMod(tpz.mod.EVA, 15)
        pet:addMod(tpz.mod.ACC, -15)
        pet:addMod(tpz.mod.RACC, -15)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(tpz.mod.EVA, 10)
        pet:delMod(tpz.mod.ACC, -10)
        pet:delMod(tpz.mod.RACC, -10)
    elseif maneuvers == 2 then
        pet:delMod(tpz.mod.EVA, 10)
        pet:delMod(tpz.mod.ACC, -10)
        pet:delMod(tpz.mod.RACC, -10)
    elseif maneuvers == 3 then
        pet:delMod(tpz.mod.EVA, 15)
        pet:delMod(tpz.mod.ACC, -15)
        pet:delMod(tpz.mod.RACC, -15)
    end
end
