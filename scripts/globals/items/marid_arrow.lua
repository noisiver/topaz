-----------------------------------------
-- ID: 18697
-- Item: Marid Arrow
-- Additional Effect: Slow
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 100)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.SLOW, tpz.magic.ele.EARTH, 0)
    local duration = math.floor(60 * resist)

    if resist < 0.5 then
        return 0, 0, 0
    else
        if (not target:hasStatusEffect(tpz.effect.SLOW)) then
            target:addStatusEffect(tpz.effect.SLOW, 1550, 3, duration)
        end
        return tpz.subEffect.SLOW, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.SLOW
    end
end
