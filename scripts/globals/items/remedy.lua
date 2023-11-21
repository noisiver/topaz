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
        local effect = target:getStatusEffect(tpz.effect.SILENCE)
        local effectFlags = effect:getFlag()
        if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
            target:delStatusEffect(tpz.effect.SILENCE)
        end
    end

    if (target:hasStatusEffect(tpz.effect.BLINDNESS) == true) then
        local effect = target:getStatusEffect(tpz.effect.BLINDNESS)
        local effectFlags = effect:getFlag()
        if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
            target:delStatusEffect(tpz.effect.BLINDNESS)
        end
    end

    if (target:hasStatusEffect(tpz.effect.POISON) == true) then
        local effect = target:getStatusEffect(tpz.effect.POISON)
        local effectFlags = effect:getFlag()
        if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
            target:delStatusEffect(tpz.effect.POISON)
        end
    end

    if (target:hasStatusEffect(tpz.effect.PARALYSIS) == true) then
        local effect = target:getStatusEffect(tpz.effect.PARALYSIS)
        local effectFlags = effect:getFlag()
        if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
            target:delStatusEffect(tpz.effect.PARALYSIS)
        end
    end

    local rDisease = math.random(1, 2) -- Disease is not garunteed to be cured, 1 means removed 2 means fail. 50% chance
    if (rDisease == 1) then
        if (target:hasStatusEffect(tpz.effect.DISEASE) == true) then
            local effect = target:getStatusEffect(tpz.effect.DISEASE)
            local effectFlags = effect:getFlag()
            if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
                target:delStatusEffect(tpz.effect.DISEASE)
            end
        end

        if (target:hasStatusEffect(tpz.effect.PLAGUE) == true) then
            local effect = target:getStatusEffect(tpz.effect.PLAGUE)
            local effectFlags = effect:getFlag()
            if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
                target:delStatusEffect(tpz.effect.PLAGUE)
            end
        end
    end
end

