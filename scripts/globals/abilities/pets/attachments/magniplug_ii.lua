-----------------------------------
-- Attachment: Magniplug II
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEquip(pet)
    pet:addMod(tpz.mod.MAIN_DMG_RATING, 10)
    pet:addMod(tpz.mod.RANGED_DMG_RATING, 10)
end

function onUnequip(pet)
    pet:delMod(tpz.mod.MAIN_DMG_RATING, 10)
    pet:delMod(tpz.mod.RANGED_DMG_RATING, 10)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(tpz.mod.MAIN_DMG_RATING, 5)
        pet:addMod(tpz.mod.RANGED_DMG_RATING, 5)
    elseif maneuvers == 2 then
        pet:addMod(tpz.mod.MAIN_DMG_RATING, 5)
        pet:addMod(tpz.mod.RANGED_DMG_RATING, 5)
    elseif maneuvers == 3 then
        pet:addMod(tpz.mod.MAIN_DMG_RATING, 5)
        pet:addMod(tpz.mod.RANGED_DMG_RATING, 5)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(tpz.mod.MAIN_DMG_RATING, 5)
        pet:delMod(tpz.mod.RANGED_DMG_RATING, 5)
    elseif maneuvers == 2 then
        pet:delMod(tpz.mod.MAIN_DMG_RATING, 5)
        pet:delMod(tpz.mod.RANGED_DMG_RATING, 5)
    elseif maneuvers == 3 then
        pet:delMod(tpz.mod.MAIN_DMG_RATING, 5)
        pet:delMod(tpz.mod.RANGED_DMG_RATING, 5)
    end
end
