-----------------------------------------
-- ID: 5356
-- Item: Remedy Ointment
-- Item Effect: This potion remedies status ailments.
-- Works on paralysis, silence, blindness, poison, and plague.
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(tpz.effect.SILENCE) or target:hasStatusEffect(tpz.effect.BLINDNESS) or target:hasStatusEffect(tpz.effect.POISON) or target:hasStatusEffect(tpz.effect.PARALYSIS)) then
        local effectRemoved = 0
        while effectRemoved == 0 do
            num = math.random(1, 4)
            if (num == 1 and target:hasStatusEffect(tpz.effect.SILENCE)) then
                effectRemoved = effectRemoved + 1
                target:delStatusEffectSilent(tpz.effect.SILENCE)

            elseif (num == 2 and target:hasStatusEffect(tpz.effect.BLINDNESS)) then
                effectRemoved = effectRemoved + 1
                target:delStatusEffectSilent(tpz.effect.BLINDNESS)

            elseif (num == 3 and target:hasStatusEffect(tpz.effect.POISON)) then
                effectRemoved = effectRemoved + 1
                target:delStatusEffectSilent(tpz.effect.POISON)

            elseif (num == 4 and target:hasStatusEffect(tpz.effect.PARALYSIS)) then
                effectRemoved = effectRemoved + 1
                target:delStatusEffectSilent(tpz.effect.PARALYSIS)
            end
        end
    end
end

