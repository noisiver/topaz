-----------------------------------
--
--     tpz.effect.HAGAKURE
--
-----------------------------------

require("scripts/globals/status")

function onEffectGain(target, effect)
    target:addMod(tpz.mod.SAVETP, 400)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.SAVETP, 400)
end
