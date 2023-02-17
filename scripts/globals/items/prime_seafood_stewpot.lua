-----------------------------------------
-- ID: 5239
-- Item: Prime Seafood Stewpot
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP +10% Cap 50
-- MP +10% Cap 50
-- Accuracy +15% Cap 100
-- Ranged Accuracy +15% Cap 100
-- Evasion 10
-- hHP 5
-- hMP 20
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 14400, 5238)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.FOOD_HPP, 10)
    target:addMod(tpz.mod.FOOD_HP_CAP, 50)
    target:addMod(tpz.mod.FOOD_MPP, 10)
    target:addMod(tpz.mod.FOOD_MP_CAP, 50)   
    target:addMod(tpz.mod.FOOD_ACCP, 15)
    target:addMod(tpz.mod.FOOD_ACC_CAP, 100)
    target:addMod(tpz.mod.FOOD_RACCP, 15)
    target:addMod(tpz.mod.FOOD_RACC_CAP, 100)
    target:addMod(tpz.mod.EVA, 10)
    target:addMod(tpz.mod.HPHEAL, 20)
    target:addMod(tpz.mod.MPHEAL, 5)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.FOOD_HPP, 10)
    target:delMod(tpz.mod.FOOD_HP_CAP, 50)
    target:delMod(tpz.mod.FOOD_ACCP, 15)
    target:delMod(tpz.mod.FOOD_ACC_CAP, 100)
    target:delMod(tpz.mod.FOOD_RACCP, 15)
    target:delMod(tpz.mod.FOOD_RACC_CAP, 100)
    target:delMod(tpz.mod.EVA, 10)
    target:delMod(tpz.mod.HPHEAL, 20)
    target:delMod(tpz.mod.MPHEAL, 5)
end
