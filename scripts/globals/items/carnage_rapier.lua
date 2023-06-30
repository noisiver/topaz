-----------------------------------------
-- ID: 16824
-- Item: Carnage Rapier
-- Additional Effect: Drains MP
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local dmg = doAdditionalEffectDamage(player, target, 12, 25, nil, false, 0, tpz.magic.ele.DARK, 0)

    if dmg == 0 or target:isUndead() then
        return 0, 0, 0
    end

    dmg = math.min(dmg, target:getMP())
    player:addMP(dmg)
    target:delMP(dmg)

    local message = tpz.msg.basic.ADD_EFFECT_MP_DRAIN

    return tpz.subEffect.MP_DRAIN, message, dmg
end

