-----------------------------------
--
-- tpz.effect.AVOIDANCE_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
	target:addMod(tpz.mod.SHIELDBLOCKRATE, -100)
	target:addMod(tpz.mod.INQUARTATA, -100)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
	target:delMod(tpz.mod.SHIELDBLOCKRATE, -100)
	target:delMod(tpz.mod.INQUARTATA, -100)
end
