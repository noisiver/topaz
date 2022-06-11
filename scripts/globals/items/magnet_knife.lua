-----------------------------------------
-- ID: 18026
-- Item: Magnet Knife
-- Additional Effect: Gravity
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.WEIGHT, tpz.magic.ele.WIND, 0)
    local duration = math.floor(60 * resist)

    if math.random(0, 99) >= chance or resist < 0.5 then
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.WEIGHT, 25, 0, duration)
        return tpz.subEffect.GRAVITY, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.WEIGHT
    end
end
