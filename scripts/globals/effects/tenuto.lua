-----------------------------------
--
-- xi.effect.TENUTO
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.TENUTO_EFFECT)

    target:addMod(tpz.mod.SONG_DURATION_BONUS, jpValue * 2)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.TENUTO_EFFECT)

    target:delMod(tpz.mod.SONG_DURATION_BONUS, jpValue * 2)
end
