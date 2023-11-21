-----------------------------------------
-- ID: 4148
-- Item: Antidote
-- Item Effect: This potion remedies poison.
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)

    if (target:hasStatusEffect(tpz.effect.POISON) == true) then
        local effect = target:getStatusEffect(tpz.effect.POISON)
        local effectFlags = effect:getFlag()
        if (bit.band(effectFlags, tpz.effectFlag.WALTZABLE) ~= 0) then
            target:delStatusEffect(tpz.effect.POISON)
        else
            target:messageBasic(tpz.msg.basic.NO_EFFECT)
        end
    end
end

