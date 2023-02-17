-----------------------------------
--
-- tpz.effect.DEFENDER
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.DEFP, effect:getPower())
	target:addMod(tpz.mod.RATTP, -25)
	target:addMod(tpz.mod.ATTP, -25)
    target:addMod(tpz.mod.DMGTP, -effect:getSubPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.DEFP, effect:getPower())
	target:delMod(tpz.mod.ATTP, -25)
	target:delMod(tpz.mod.RATTP, -25)
    target:delMod(tpz.mod.DMGTP, -effect:getSubPower())
end
