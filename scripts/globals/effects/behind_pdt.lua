-----------------------------------
--
--     tpz.effect.BEHIND_PST
--     
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.BEHIND_PDT, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.BEHIND_PDT, effect:getPower())
end
