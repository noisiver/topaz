-----------------------------------
--
--     tpz.effect.SNEAK_ATTACK
--
-----------------------------------

function onEffectGain(target, effect)
target:addMod(tpz.mod.ALL_WSDMG_FIRST_HIT , 50)
target:addMod(tpz.mod.MATT , -50)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
target:addMod(tpz.mod.ALL_WSDMG_FIRST_HIT , -50)
target:addMod(tpz.mod.MATT , 50)
end
