-----------------------------------------
-- ID: 4155
-- Item: Remedy
-- Item Effect: This potion remedies status ailments.
-- Works on paralysis, silence, blindness, poison, and disease.
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)

    if (target:hasStatusEffect(tpz.effect.SILENCE) == true) then
        target:delStatusEffectSilent(tpz.effect.SILENCE)
    end
    if (target:hasStatusEffect(tpz.effect.BLINDNESS) == true) then
        target:delStatusEffectSilent(tpz.effect.BLINDNESS)
    end
    if (target:hasStatusEffect(tpz.effect.POISON) == true) then
        local effect = target:getStatusEffect(tpz.effect.POISON)
        local effectFlags = effect:getFlag()
        if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
            target:delStatusEffectSilent(tpz.effect.POISON)
        end
    end
    if (target:hasStatusEffect(tpz.effect.PARALYSIS) == true) then
        target:delStatusEffectSilent(tpz.effect.PARALYSIS)
    end

    local rDisease = math.random(1, 2) -- Disease is not garunteed to be cured, 1 means removed 2 means fail. 50% chance
    if (rDisease == 1 and target:hasStatusEffect(tpz.effect.DISEASE) == true or target:hasStatusEffect(tpz.effect.PLAGUE) == true) then
        target:delStatusEffectSilent(tpz.effect.DISEASE)
		target:delStatusEffectSilent(tpz.effect.PLAGUE)
    end
end

