-----------------------------------------
-- ID: 18157
-- Item: Poison Arrow
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 100)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.POISON, tpz.magic.ele.WATER, 0)
    local duration = math.floor(60 * resist)

    if resist < 0.5 then
        return 0, 0, 0
    else
        if (not target:hasStatusEffect(tpz.effect.POISON)) then
            target:addStatusEffect(tpz.effect.POISON, 10, 3, duration)
        end
        return tpz.subEffect.POISON, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.POISON
    end
end
