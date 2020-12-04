-----------------------------------------
-- ID: 4421
-- Item: melon_pie
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Magic 25
-- Agility -1
-- Intelligence 4
-- Macc +21% (Cap: 10)
-- Mattk +10
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(tpz.effect.FOOD) or target:hasStatusEffect(tpz.effect.FIELD_SUPPORT_FOOD) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 4421)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.MP, 25)
    target:addMod(tpz.mod.AGI, -1)
    target:addMod(tpz.mod.INT, 4)
    target:addMod(tpz.mod.FOOD_MACCP, 21)
    target:addMod(tpz.mod.FOOD_MACC_CAP, 10)
    target:addMod(tpz.mod.MATT, 10)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MP, 25)
    target:delMod(tpz.mod.AGI, -1)
    target:delMod(tpz.mod.INT, 4)
    target:delMod(tpz.mod.FOOD_MACCP, 21)
    target:delMod(tpz.mod.FOOD_MACC_CAP, 10)
    target:delMod(tpz.mod.MATT, 10)
end
