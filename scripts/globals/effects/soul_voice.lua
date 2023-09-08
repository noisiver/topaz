-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.SOUL_VOICE_EFFECT)

    target:addMod(tpz.mod.SONG_SPELLCASTING_TIME, 2 * jpValue)
    target:addMod(tpz.mod.MACC, 100) 
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.SOUL_VOICE_EFFECT)

    target:delMod(tpz.mod.SONG_SPELLCASTING_TIME, 2 * jpValue)
    target:delMod(tpz.mod.MACC, 100) 
end
