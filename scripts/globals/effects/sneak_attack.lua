-----------------------------------
--
--     tpz.effect.SNEAK_ATTACK
--
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.SNEAK_ATTACK_EFFECT)

    target:addMod(tpz.mod.SNEAK_ATK_DEX, jpValue)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.SNEAK_ATTACK_EFFECT)

    target:delMod(tpz.mod.SNEAK_ATK_DEX, jpValue)
end
