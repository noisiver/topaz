-----------------------------------
-- Physical Shield
-- Blocks all physical attacks
-- if power is > 19 then PDT % = power
-- If power is 8, 50% PDT from BEHIND
-- If power is 7, 75% PDT from BEHIND
-- If power is 6, 50% PDT in FRONT
-- If power is 5, 75% PDT in FRONT
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
    elseif (effect:getPower() == 2) then
        target:addMod(tpz.mod.PHYS_ABSORB, 100)
    elseif (effect:getPower() > 19) then
        target:addMod(tpz.mod.UDMGPHYS, -effect:getPower())
        target:addMod(tpz.mod.UDMGRANGE, -effect:getPower())
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    if (effect:getPower() < 2) then
        target:delMod(tpz.mod.UDMGPHYS, -100)
        target:delMod(tpz.mod.UDMGRANGE, -100)
     elseif (effect:getPower() == 2) then
        target:delMod(tpz.mod.PHYS_ABSORB, 100)
    elseif (effect:getPower() > 19) then
        target:delMod(tpz.mod.UDMGPHYS, -effect:getPower())
        target:delMod(tpz.mod.UDMGRANGE, -effect:getPower())
    end
end
