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

    local jpLevel = target:getJobPointLevel(tpz.jp.HUNDRED_FISTS_EFFECT)
    target:addMod(tpz.mod.ACC, jpLevel * 2)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    if target:isMob() then
        target:SetMobAbilityEnabled(true) 
    end

    local jpLevel = target:getJobPointLevel(tpz.jp.HUNDRED_FISTS_EFFECT)
    target:delMod(tpz.mod.ACC, jpLevel * 2)
end