-----------------------------------------
-- ID: 5691
-- Item: plate_of_shrimp_sushi
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Health 30
-- +10 Evasion
-- Mind -1
-- Accuracy % 15
-- Ranged ACC % 15
-- Sleep Resist 1
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 5691)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.HP, 30)
    target:addMod(tpz.mod.EVA, 10)
    target:addMod(tpz.mod.MND, -1)
    target:addMod(tpz.mod.FOOD_ACCP, 15)
    target:addMod(tpz.mod.FOOD_ACC_CAP, 72)
    target:addMod(tpz.mod.FOOD_RACCP, 15)
    target:addMod(tpz.mod.FOOD_RACC_CAP, 72)
    target:addMod(tpz.mod.SLEEPRESTRAIT, 1)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HP, 30)
    target:delMod(tpz.mod.EVA, 10)
    target:delMod(tpz.mod.MND, -1)
    target:delMod(tpz.mod.FOOD_ACCP, 15)
    target:delMod(tpz.mod.FOOD_ACC_CAP, 72)
    target:delMod(tpz.mod.FOOD_RACCP, 15)
    target:delMod(tpz.mod.FOOD_RACC_CAP, 72)
    target:delMod(tpz.mod.SLEEPRESTRAIT, 1)
end
