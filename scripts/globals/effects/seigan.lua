-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.SEIGAN_EFFECT) * 3

    target:addMod(tpz.mod.DEF, jpValue)

    if (target:getMainJob() == tpz.job.SAM) then
        target:addMod(tpz.mod.COUNTER, (target:getMod(tpz.mod.ZANSHIN)/4))
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.SEIGAN_EFFECT) * 3

    target:delMod(tpz.mod.DEF, jpValue)
    if (target:getMainJob() == tpz.job.SAM) then
        target:delMod(tpz.mod.COUNTER, (target:getMod(tpz.mod.ZANSHIN)/4))
    end
end
