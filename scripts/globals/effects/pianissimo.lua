-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.PIANISSIMO_EFFECT) * 2

    target:addMod(tpz.mod.SONG_SPELLCASTING_TIME, jpValue)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.PIANISSIMO_EFFECT) * 2

    target:delMod(tpz.mod.SONG_SPELLCASTING_TIME, jpValue)
end
