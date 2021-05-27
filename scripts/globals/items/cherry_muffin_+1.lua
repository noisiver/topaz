-----------------------------------------
-- ID: 5654
-- Item: Cherry Muffin
-- Food Effect: 1Hr, All Races
-----------------------------------------
-- Intelligence 2
-- MP % 10 (cap 85)
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 3600, 5654)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.FOOD_MPP, 15)
    target:addMod(tpz.mod.FOOD_MP_CAP, 110)   
	target:addMod(tpz.mod.ACC, -20)
	target:addMod(tpz.mod.RACC, -20)
	target:addMod(tpz.mod.CONSERVE_MP, 11)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.FOOD_MPP, 15)
    target:delMod(tpz.mod.FOOD_MP_CAP, 110)
	target:delMod(tpz.mod.ACC, -20)
	target:delMod(tpz.mod.RACC, -20)
	target:delMod(tpz.mod.CONSERVE_MP, 11)
end
