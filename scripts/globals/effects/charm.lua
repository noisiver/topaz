-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target, effect)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:uncharm()
	target:costume(0)
end
