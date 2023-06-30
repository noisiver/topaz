-----------------------------------
-- Attachment: Mana Channeler II
-----------------------------------
require("scripts/globals/status")
-----------------------------------
-- Increases Magic Cooldowns

function onEquip(pet)
    pet:addMod(tpz.mod.MATT, 12)
    pet:addMod(tpz.mod.AUTO_MAGIC_DELAY, -6)
end

function onUnequip(pet)
    pet:delMod(tpz.mod.MATT, 12)
    pet:delMod(tpz.mod.AUTO_MAGIC_DELAY, -6)
end

function onManeuverGain(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(tpz.mod.MATT, 13)
        pet:addMod(tpz.mod.AUTO_MAGIC_DELAY, -9)
    elseif maneuvers == 2 then
        pet:addMod(tpz.mod.MATT, 15)
        pet:addMod(tpz.mod.AUTO_MAGIC_DELAY, -9)
    elseif maneuvers == 3 then
        pet:addMod(tpz.mod.MATT, 10)
        pet:addMod(tpz.mod.AUTO_MAGIC_DELAY, -9)
    end
end

function onManeuverLose(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(tpz.mod.MATT, 13)
        pet:delMod(tpz.mod.AUTO_MAGIC_DELAY, -9)
    elseif maneuvers == 2 then
        pet:delMod(tpz.mod.MATT, 15)
        pet:delMod(tpz.mod.AUTO_MAGIC_DELAY, -9)
    elseif maneuvers == 3 then
        pet:delMod(tpz.mod.MATT, 10)
        pet:delMod(tpz.mod.AUTO_MAGIC_DELAY, -9)
    end
end
