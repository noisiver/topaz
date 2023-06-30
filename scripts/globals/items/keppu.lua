-----------------------------------------
-- ID: 16621
-- Item: Kyofu
-- Additional effect with battery equipped: Wind damage
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CheckAdditionalEffeectAmmo(player, tpz.items.WIND_FAN, 45)
    local dmg = 60
    local dmg = doAdditionalEffectDamage(player, target, chance, dmg, nil, false, 0, tpz.magic.ele.WIND, 0)

    if dmg == 0 then
        return 0, 0, 0
    end

    local message = tpz.msg.basic.ADD_EFFECT_DMG
    if (dmg < 0) then
        message = tpz.msg.basic.ADD_EFFECT_HEAL
        dmg = target:addHP(-dmg)
    end

    DeleteAmmoAdditionalEffect(player, dmg)
    return tpz.subEffect.WIND_DAMAGE, message, dmg
end

