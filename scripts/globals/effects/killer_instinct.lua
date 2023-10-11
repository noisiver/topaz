-----------------------------------
--
--  tpz.effect.KILLER_INSTINCT
-- Effects power is modID for the circle effect(+DMG%)
-- Always grants +15% of the corresponding modID
-----------------------------------

function onEffectGain(target, effect)
    local modId = effect:getPower()
    target:addMod(modId, 15)
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    local modId = effect:getPower()
    target:delMod(modId, 15)
end
