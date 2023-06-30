-----------------------------------------
-- ID: 17080
-- Item: Holy Maul
-- Additional Effect: Light Damage
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 10
    local damage = 20
    local dmg = doAdditionalEffectDamage(player, target, chance, damage, nil, false, 0, tpz.magic.ele.LIGHT, 0)

    if dmg == 0 then
        return 0, 0, 0
    end

    local message = tpz.msg.basic.ADD_EFFECT_DMG
    if (dmg < 0) then
        message = tpz.msg.basic.ADD_EFFECT_HEAL
        dmg = target:addHP(-dmg)
    end

    return tpz.subEffect.LIGHT_DAMAGE, message, dmg
end