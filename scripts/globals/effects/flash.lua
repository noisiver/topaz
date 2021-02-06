-----------------------------------
--
-- tpz.effect.FLASH
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ACC, -effect:getPower())
end

function onEffectTick(target, effect)
effect:setPower(effect:getPower()-100)
target:delMod(tpz.mod.ACC, -100)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ACC, -effect:getPower())
end
