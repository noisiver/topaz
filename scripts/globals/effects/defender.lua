-----------------------------------
--
-- tpz.effect.DEFENDER
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	if target:getMainJob() == tpz.job.WAR then
		target:addMod(tpz.mod.DEFP, 50)
		target:addMod(tpz.mod.RATTP, -25)
		target:addMod(tpz.mod.ATTP, -25)
	else
		target:addMod(tpz.mod.DEFP, 25)
		target:addMod(tpz.mod.RATTP, -25)
		target:addMod(tpz.mod.ATTP, -25)
	end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	if target:getMainJob() == tpz.job.WAR then
		target:delMod(tpz.mod.DEFP, 50)
		target:delMod(tpz.mod.ATTP, -25)
		target:delMod(tpz.mod.RATTP, -25)
	else
		target:delMod(tpz.mod.DEFP, 25)
		target:delMod(tpz.mod.ATTP, -25)
		target:delMod(tpz.mod.RATTP, -25)
	end
end
