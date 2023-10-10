-----------------------------------
--
--     tpz.effect.UNBRIDLED_WISDOM
--     
-----------------------------------
function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.UNBRIDLED_WISDOM_EFFECT) * 3

    target:addMod(tpz.mod.CONSERVE_MP, jpValue)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.UNBRIDLED_WISDOM_EFFECT) * 3

    target:delMod(tpz.mod.CONSERVE_MP, jpValue)
end
