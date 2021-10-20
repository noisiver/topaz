-----------------------------------
--
-- tpz.effect.BARFIRE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.FIRERES, effect:getPower())
	target:addMod(tpz.mod.MDEF, effect:getSubPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.FIRERES, effect:getPower())
	target:delMod(tpz.mod.MDEF, effect:getSubPower())
end
