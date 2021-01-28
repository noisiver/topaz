-----------------------------------
--
--     tpz.effect.HUNDRED_FISTS
--
-----------------------------------

--function onEffectGain(target, effect)
--end

--function onEffectTick(target, effect)
--end

--function onEffectLose(target, effect)
--end


function onEffectGain(target, effect)
    if target:isMob() then
        target:SetMobAbilityEnabled(false) 
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    if target:isMob() then
        target:SetMobAbilityEnabled(true) 
    end
end