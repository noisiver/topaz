-----------------------------------------
-- ID: 5696
-- Item: Dragon Soup
-- Food Effect: 4 hours, all Races
-----------------------------------------
-- HP +35
-- Accuracy +10% (cap 9)
-- Attack +10% (cap 11)
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 4549)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.HP, 35)
    target:addMod(tpz.mod.STR, 4)
    target:addMod(tpz.mod.DEX, 3)
    target:addMod(tpz.mod.AGI, 2)
    target:addMod(tpz.mod.DEMON_KILLER, 25)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HP, 35)
    target:delMod(tpz.mod.STR, 4)
    target:delMod(tpz.mod.DEX, 3)
    target:delMod(tpz.mod.AGI, 2)
    target:delMod(tpz.mod.DEMON_KILLER, 25)
end
