-----------------------------------------
-- ID: 4581
-- Item: Blackened Newt
-- Food Effect: 180Min, All Races
-----------------------------------------
-- +2 STR
-- +3 AGI
--- 2 INT
-- +12% ranged attack(Cap: 50)
-- -10 enmity
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 4581)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.STR, 2)
    target:addMod(tpz.mod.AGI, 3)
    target:addMod(tpz.mod.INT, -2)
    target:addMod(tpz.mod.FOOD_RATTP, 12)
    target:addMod(tpz.mod.FOOD_RATT_CAP, 50)
    target:addMod(tpz.mod.ENMITY, -10)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.STR, 2)
    target:delMod(tpz.mod.AGI, 3)
    target:delMod(tpz.mod.INT, -2)
    target:delMod(tpz.mod.FOOD_RATTP, 12)
    target:delMod(tpz.mod.FOOD_RATT_CAP, 50)
    target:delMod(tpz.mod.ENMITY, -10)
end
