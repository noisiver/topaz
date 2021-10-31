-----------------------------------
--
-- tpz.effect.ABSORB_DAMAGE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
     target:addMod(tpz.mod.ABSORB_DMG_CHANCE, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ABSORB_DMG_CHANCE, effect:getPower())
end
