-----------------------------------
--
-- tpz.effect.MAGIC_DEF_BOOST
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.MDEF, effect:getPower())
end

function onEffectTick(target, effect)
effect:setPower(effect:getPower()7)
target:delMod(tpz.mod.MDEF, 7)
	if effect:getPower() <= 8 then
		effect:getPower() = 8
	end
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MDEF, effect:getPower())
end
