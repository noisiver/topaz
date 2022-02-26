-----------------------------------
--
--     tpz.effect.SENGIKORI
--
-----------------------------------
function onEffectGain(target, effect)
    if target:isPC() then
        target:addMod(tpz.mod.SKILLCHAINDMG, 25)
        target:addMod(tpz.mod.MAG_BURST_BONUS, 25)
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    if target:isPC() then
        target:delMod(tpz.mod.SKILLCHAINDMG, 25)
        target:delMod(tpz.mod.MAG_BURST_BONUS, 25)
    end
end
