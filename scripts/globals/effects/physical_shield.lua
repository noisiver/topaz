-----------------------------------
-- Physical Shield
-- Blocks all physical attacks
-- If power is 4, 100% PDT from BEHIND
-- If power is 3, 100% PDT in FRONT
-- If Power is 2, 100% physical absorb
-- If power is < 2 , 100% PDT and Ranged PDT
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    if (effect:getPower() < 2) then
        target:addMod(tpz.mod.UDMGPHYS, -100)
        target:addMod(tpz.mod.UDMGRANGE, -100)
    elseif (effect:getPower() == 2)
        target:addMod(tpz.mod.PHYS_ABSORB, 100)
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    if (effect:getPower() < 2) then
        target:delMod(tpz.mod.UDMGPHYS, -100)
        target:delMod(tpz.mod.UDMGRANGE, -100)
     elseif (effect:getPower() == 2)
        target:delMod(tpz.mod.PHYS_ABSORB, 100)
    end
end
