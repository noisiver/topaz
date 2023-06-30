-----------------------------------------
-- ID: 16861
-- Item: Ice Lance
-- Additional Effect: Ice Damage
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 10)
    local power = math.random(45, 55)
    local dmg = doAdditionalEffectDamage(player, target, chance, power, nil, false, 0, tpz.magic.ele.ICE, 0)

    if dmg == 0 then
        return 0, 0, 0
    end

    local message = tpz.msg.basic.ADD_EFFECT_DMG
    if (dmg < 0) then
        message = tpz.msg.basic.ADD_EFFECT_HEAL
        dmg = target:addHP(-dmg)
    end

    return tpz.subEffect.ICE_DAMAGE, message, dmg
end