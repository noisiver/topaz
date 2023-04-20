-----------------------------------------
-- ID: 15505
-- Item: dhalmel_whistle
-- Item Effect: Attack +10%
-- Duration: 3 minutes
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local effect = target:getStatusEffect(tpz.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 15505 then
        target:delStatusEffectSilent(tpz.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.ENCHANTMENT, 0, 0, 180, 15505)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ATTP, 10)
    target:addMod(tpz.mod.RATTP, 10)
    target:addMod(tpz.mod.DEFP, -10)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ATTP, 10)
    target:delMod(tpz.mod.RATTP, 10)
    target:delMod(tpz.mod.DEFP, -10)
end
