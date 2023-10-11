-----------------------------------
--
-- tpz.effect.MARCATO
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.MARCATO_EFFECT)

    target:addMod(tpz.mod.SONG_DURATION_BONUS, jpValue)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.MARCATO_EFFECT)

    target:delMod(tpz.mod.SONG_DURATION_BONUS, jpValue)
end
