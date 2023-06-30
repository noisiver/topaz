-----------------------------------------
-- ID: 18330, 18331, 18648, 18662, 18676, 19757, 19850, 21135, 21136, 22060
-- Item: Claustrum
-- Additional Effect: Dispel
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 15)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.NONE, tpz.magic.ele.DARK, 175)

    if (math.random(0, 95) >= chance or resist < 0.5) then 
        return 0, 0, 0
    else
        local effect = target:dispelStatusEffect()
        if (effect ~= tpz.effect.NONE) then
            return tpz.subEffect.DISPEL, tpz.msg.basic.ADD_EFFECT_DISPEL, effect
        end
    end
end
