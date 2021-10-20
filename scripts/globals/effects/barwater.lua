-----------------------------------
--
-- tpz.effect.BARWATER
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.WATERRES, effect:getPower())
	target:addMod(tpz.mod.MDEF, effect:getSubPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.WATERRES, effect:getPower())
	target:delMod(tpz.mod.MDEF, effect:getSubPower())
end
