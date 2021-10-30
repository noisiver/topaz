-----------------------------------
--
-- tpz.effect.HUMANOID_KILLER : "Killer" effects bonus
--
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.HUMANOID_KILLER, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.HUMANOID_KILLER, effect:getPower())
end
