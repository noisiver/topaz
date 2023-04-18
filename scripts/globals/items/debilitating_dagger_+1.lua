-----------------------------------------
-- ID: 16741
-- Item: Debilitating Dagger +1
-- Additional Effect: Attack Down
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 12)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.ATTACK_DOWN, tpz.magic.ele.WATER, 0)
    local duration = math.floor(60 * resist)
    if math.random(0, 99) >= chance or resist < 0.5 then
        return 0, 0, 0
    else
        target:delStatusEffectSilent(tpz.effect.ATTACK_BOOST)
        target:addStatusEffect(tpz.effect.ATTACK_DOWN, 13, 0, duration)
        return tpz.subEffect.ATTACK_DOWN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.ATTACK_DOWN
    end
end
