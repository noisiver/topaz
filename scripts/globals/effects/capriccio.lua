-----------------------------------
--
-- tpz.effect.CAPRICCIO
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.PETRIFYRESTRAIT, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.PETRIFYRESTRAIT, effect:getPower())
end
