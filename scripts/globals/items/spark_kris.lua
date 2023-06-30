-----------------------------------------
-- ID: 16621
-- Item: Spark Kris
-- Additional effect with battery equipped: Lightning damage
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = CheckAdditionalEffeectAmmo(player, tpz.items.BATTERY, 45)
    local dmg = 20
    local dmg = doAdditionalEffectDamage(player, target, chance, dmg, nil, false, 0, tpz.magic.ele.THUNDER, 0)

    if dmg == 0 then
        return 0, 0, 0
    end

    local message = tpz.msg.basic.ADD_EFFECT_DMG
    if (dmg < 0) then
        message = tpz.msg.basic.ADD_EFFECT_HEAL
        dmg = target:addHP(-dmg)
    end

    DeleteAmmoAdditionalEffect(player, dmg)
    return tpz.subEffect.LIGHTNING_DAMAGE, message, dmg
end

