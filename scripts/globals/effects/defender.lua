-----------------------------------
--
-- tpz.effect.DEFENDER
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    local defPower = 25
    if target:getMainJob() == tpz.job.WAR then
        defPower = 50
    end
    defPower = math.floor(defPower * (1 + (target:getMod(tpz.mod.DEFENDER_POTENCY) / 100)))

	target:addMod(tpz.mod.DEFP, defPower)
	target:addMod(tpz.mod.RATTP, -25)
	target:addMod(tpz.mod.ATTP, -25)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local defPower = 25
    if target:getMainJob() == tpz.job.WAR then
        defPower = 50
    end
    defPower = math.floor(defPower * (1 + (target:getMod(tpz.mod.DEFENDER_POTENCY) / 100)))

	target:delMod(tpz.mod.DEFP, defPower)
	target:delMod(tpz.mod.ATTP, -25)
	target:delMod(tpz.mod.RATTP, -25)
end
