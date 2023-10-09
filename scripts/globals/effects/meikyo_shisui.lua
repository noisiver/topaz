-----------------------------------
--
--     tpz.effect.MEIKYO_SHISUI
--
-----------------------------------

function onEffectGain(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.MEIKYO_SHISUI_EFFECT) * 200 -- Base 10000 mod

    target:addMod(tpz.mod.SKILLCHAINDMG, jpValue) 
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local jpValue = target:getJobPointLevel(tpz.jp.MEIKYO_SHISUI_EFFECT) * 200 -- Base 10000 mod

    target:delMod(tpz.mod.SKILLCHAINDMG, jpValue)
end
