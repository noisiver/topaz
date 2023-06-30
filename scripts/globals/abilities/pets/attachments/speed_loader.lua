-----------------------------------
-- Attachment: Speed Loader
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addMod(tpz.mod.SKILLCHAINDMG, 15)
end

function onUnequip(pet)
    pet:delMod(tpz.mod.SKILLCHAINDMG, 15)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(tpz.mod.SKILLCHAINDMG, 30)
    elseif maneuvers == 2 then
        pet:addMod(tpz.mod.SKILLCHAINDMG, 40)
    elseif maneuvers == 3 then
        pet:addMod(tpz.mod.SKILLCHAINDMG, 60)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(tpz.mod.SKILLCHAINDMG, 30)
    elseif maneuvers == 2 then
        pet:delMod(tpz.mod.SKILLCHAINDMG, 40)
    elseif maneuvers == 3 then
        pet:delMod(tpz.mod.SKILLCHAINDMG, 60)
    end
end
