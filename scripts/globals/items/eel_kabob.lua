-----------------------------------------
-- ID: 4457
-- Item: eel_kabob
-- Food Effect: 30Min, All Races
-----------------------------------------
-- Dexterity 4
-- Mind -3
-- Evasion 5
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 1800, 4457)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.FOOD_ATTP, 12)
    target:addMod(tpz.mod.FOOD_ATT_CAP, 50)
    target:addMod(tpz.mod.FOOD_RATTP, 12)
    target:addMod(tpz.mod.FOOD_RATT_CAP, 50)
    target:addMod(tpz.mod.CRITHITRATE, 7)
    target:addMod(tpz.mod.DEX, 7)
    target:addMod(tpz.mod.AGI, 7)
    target:addMod(tpz.mod.MND, -3)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.FOOD_ATTP, 12)
    target:delMod(tpz.mod.FOOD_ATT_CAP, 50)
    target:delMod(tpz.mod.FOOD_RATTP, 12)
    target:delMod(tpz.mod.FOOD_RATT_CAP, 50)
    target:delMod(tpz.mod.CRITHITRATE, 7)
    target:delMod(tpz.mod.DEX, 7)
	target:delMod(tpz.mod.AGI, 7)
    target:delMod(tpz.mod.MND, -3)
end
