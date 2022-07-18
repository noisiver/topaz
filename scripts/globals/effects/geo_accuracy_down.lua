-----------------------------------
--
-- tpz.effect.GEO_ACCURACY_DOWN
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(tpz.mod.ACC, -effect:getPower())
    target:addMod(tpz.mod.RACC, -effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local downACC_effect_size = effect:getPower()
    if (downACC_effect_size > 0) then
        target:delMod(tpz.mod.ACC, -effect:getPower())
        target:delMod(tpz.mod.RACC, -effect:getPower())
    end
end
