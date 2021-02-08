-----------------------------------
--
-- tpz.effect.TRICK_ATTACK
--
-----------------------------------

function onEffectGain(target, effect)
    if (player:getMainJob() == tpz.job.THF) then
        target:addMod(tpz.mod.MATT , -50)
        target:addMod(tpz.mod.ALL_WSDMG_FIRST_HIT , 50)
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    if (player:getMainJob() == tpz.job.THF) then
        target:addMod(tpz.mod.MATT , 50)
        target:addMod(tpz.mod.ALL_WSDMG_FIRST_HIT , -50)
    end
end
