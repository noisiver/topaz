-----------------------------------------
-- ID: 5695
-- Item: margherita_pizza
-- Food Effect: 3 hours, all Races
-----------------------------------------
-- HP +30
-- Accuracy +10% (cap 8)
-- Attack +10% (cap 10)
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
    target:addStatusEffect(tpz.effect.FOOD, 0, 0, 10800, 5695)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.HP, 30)
    target:addMod(tpz.mod.STR, 3)
    target:addMod(tpz.mod.DEX, 2)
    target:addMod(tpz.mod.AGI, 2)
    target:addMod(tpz.mod.UNDEAD_KILLER, 20)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HP, 30)
    target:delMod(tpz.mod.STR, 3)
    target:delMod(tpz.mod.DEX, 2)
    target:delMod(tpz.mod.AGI, 2)
    target:delMod(tpz.mod.UNDEAD_KILLER, 20)
end
