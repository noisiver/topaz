-----------------------------------
--
-- tpz.effect.BOOST
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	local boost = target:getLocalVar("boost")
	target:setLocalVar("boost", boost)
	boost = boost + 1
    target:addMod(tpz.mod.ATTP, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ATTP, effect:getPower())
end
