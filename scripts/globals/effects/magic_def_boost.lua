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
   local power = effect:getPower()
effect:setPower(effect:getPower()-1)
target:delMod(tpz.mod.MDEF, 4)
	if  power <= 7 then
		power = 7
	end
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.MDEF, effect:getPower())
end
