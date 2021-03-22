-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target, effect)
target:addMod(tpz.mod.ALL_WSDMG_ALL_HITS, 25)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
target:delMod(tpz.mod.ALL_WSDMG_ALL_HITS, 25)
end
