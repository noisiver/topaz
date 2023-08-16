-----------------------------------
--
--     tpz.effect.MIGHTY_STRIKES
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local jpLevel = target:getJobPointLevel(tpz.jp.MIGHTY_STRIKES_EFFECT)

    target:addMod(tpz.mod.CRITHITRATE, 100)
    target:addMod(tpz.mod.ACC, jpLevel * 2)
    target:addMod(tpz.mod.RACC, jpLevel * 2)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpLevel = target:getJobPointLevel(tpz.jp.MIGHTY_STRIKES_EFFECT)

    target:addMod(tpz.mod.CRITHITRATE, -100)
    target:delMod(tpz.mod.ACC, jpLevel * 2)
    target:delMod(tpz.mod.RACC, jpLevel * 2)
end
