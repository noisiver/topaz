-----------------------------------
-- Blink
--No need for addMod since blinks never stack.
-- tpz.effect.BLINK
-- 40% base proc chance, use subpower to edit chance. (i.e. 75 subpower = 75%)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:setMod(tpz.mod.BLINK, effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:setMod(tpz.mod.BLINK, 0)
end
