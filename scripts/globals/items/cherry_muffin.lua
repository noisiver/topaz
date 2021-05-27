-----------------------------------------
-- ID: 5653
-- Item: Cherry Muffin
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Intelligence 1
-- Magic % 10
-- Magic Cap 80
-- Agility -1
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(tpz.effect.FOOD)) then
        result = tpz.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 5653)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.FOOD_MPP, 15)
    target:addMod(tpz.mod.FOOD_MP_CAP, 100)   
	target:addMod(tpz.mod.ACC, -20)
	target:addMod(tpz.mod.RACC, -20)
	target:addMod(tpz.mod.CONSERVE_MP, 10)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.FOOD_MPP, 15)
    target:delMod(tpz.mod.FOOD_MP_CAP, 100)
	target:delMod(tpz.mod.ACC, -20)
	target:delMod(tpz.mod.RACC, -20)
	target:delMod(tpz.mod.CONSERVE_MP, 10)
end
