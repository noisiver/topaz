-----------------------------------------
-- ID: 5773
-- Item: mushroom_crepe
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Mind 2
-- MP % 10 (cap 30)
-- Magic Accuracy +10
-- Magic Def. Bonus +5
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 5773)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.STR, -3)
    target:addMod(tpz.mod.DEX, -2)
    target:addMod(tpz.mod.VIT, -1)
    target:addMod(tpz.mod.MND, 3)
    target:addMod(tpz.mod.CURE_POTENCY, 7)
    target:addMod(tpz.mod.ENMITY, -1)
    target:addMod(tpz.mod.MPHEAL, 2)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.STR, -3)
    target:delMod(tpz.mod.DEX, -2)
    target:delMod(tpz.mod.VIT, -1)
    target:delMod(tpz.mod.MND, 3)
    target:delMod(tpz.mod.CURE_POTENCY, 7)
    target:delMod(tpz.mod.ENMITY, -1)
    target:delMod(tpz.mod.MPHEAL, 2)
end
