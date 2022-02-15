-----------------------------------
--
-- tpz.effect.PAX
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    if (effect:getPower()>50) then
        effect:setPower(50)
    end
    target:addMod(tpz.mod.ENMITY, -effect:getPower())
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(tpz.mod.ENMITY, -effect:getPower())
end
