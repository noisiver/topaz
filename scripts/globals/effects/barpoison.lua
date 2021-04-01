-----------------------------------
--
-- tpz.effect.BARPOISON
--
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.POISONRES, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.POISONRES, effect:getPower())
end
