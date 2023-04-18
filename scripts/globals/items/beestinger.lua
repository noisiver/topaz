-----------------------------------------
-- ID: 16472
-- Item: Beestinger
-- Additional Effect: Slow
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 1465) -- 14.65%
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.SLOW, tpz.magic.ele.EARTH, 0)
    local duration = math.floor(60 * resist)

    if math.random(0, 99) >= chance or resist < 0.5 then
        return 0, 0, 0
    else
        target:delStatusEffectSilent(tpz.effect.HASTE)
        target:addStatusEffect(tpz.effect.SLOW, 12, 3, duration)
        return tpz.subEffect.SLOW, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.SLOW
    end
end
