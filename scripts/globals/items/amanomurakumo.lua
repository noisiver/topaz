-----------------------------------------
-- ID: 18318, 18319, 18646, 18660, 18674, 19755, 19848, 21015, 21016, 21954
-- Item: Amanomurakumo
-- Additional Effect: 10% Attack Down
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")

function onAdditionalEffect(player, target, damage)
    local chance = 10
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.ATTACK_DOWN, tpz.magic.ele.WATER, 0)
    local duration = math.floor(60 * resist)

    if math.random(0, 95) <= chance or resist > 0.5 then
        target:delStatusEffectSilent(tpz.effect.ATTACK_BOOST)
        target:addStatusEffect(tpz.effect.ATTACK_DOWN, 20, 0, duration) 
        return tpz.subEffect.ATTACK_DOWN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.ATTACK_DOWN
    end

    return 0, 0, 0
end
