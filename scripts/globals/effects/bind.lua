-----------------------------------
--
-- tpz.effect.BIND
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    if not target:hasStatusEffect(tpz.effect.PALISADE) then
        effect:setPower(target:speed())
        target:speed(0)
    end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    if not target:hasStatusEffect(tpz.effect.PALISADE) then
        target:speed(effect:getPower())
    end
end
