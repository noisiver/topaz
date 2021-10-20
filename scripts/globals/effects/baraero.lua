-----------------------------------
--
-- tpz.effect.BARAERO
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.WINDRES, effect:getPower())
	target:addMod(tpz.mod.MDEF, effect:getSubPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.WINDRES, effect:getPower())
	target:delMod(tpz.mod.MDEF, effect:getSubPower())
end
