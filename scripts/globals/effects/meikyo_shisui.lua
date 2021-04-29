-----------------------------------
--
--     tpz.effect.MEIKYO_SHISUI
--
-----------------------------------

function onEffectGain(target, effect)
end

function onEffectTick(target, effect)
	local tp = target:getTP()
	if tp >= 2001 and <= 2999 then
		target:setTP(2000)
	elseif tp >= 1001 and <= 1999 then
		target:setTP(1000)
	end
end

function onEffectLose(target, effect)
end
