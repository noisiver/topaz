-----------------------------------------
-- ID: 18117
-- Item: gimlet_spear
-- Item Effect: Attack +3
-- Duration: 30 Minutes
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    local effect = target:getStatusEffect(tpz.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 18117 then
        target:delStatusEffectSilent(tpz.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(tpz.effect.ENCHANTMENT, 0, 0, 1800, 18117)
end

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ATT, 3)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ATT, 3)
end
