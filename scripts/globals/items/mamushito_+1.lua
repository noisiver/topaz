-----------------------------------------
-- ID: 17770
-- Item: Mamushito +1
-- Additional Effect: Stun
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 7
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.STUN, tpz.magic.ele.THUNDER, 0)
    local duration = math.floor(3 * resist)

    if math.random(0, 99) >= chance or resist < 0.5 then
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.STUN, 1, 0, 3)
        return tpz.subEffect.STUN, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.STUN
    end
end

