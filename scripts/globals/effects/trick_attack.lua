-----------------------------------
--
-- tpz.effect.TRICK_ATTACK
--
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.TRICK_ATTACK_EFFECT)

    target:addMod(tpz.mod.TRICK_ATK_AGI, jpValue)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.TRICK_ATTACK_EFFECT)

    target:delMod(tpz.mod.TRICK_ATK_AGI, jpValue)
end
