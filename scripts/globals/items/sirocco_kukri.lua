-----------------------------------------
-- ID: 18018
-- Item: Sirocco Kukri
-- Additional Effect: Wind Damage
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local dmg = doAdditionalEffectDamage(player, target, 95, 10, nil, false, 0, tpz.magic.ele.WIND, 0)

    if dmg == 0 then
        return 0, 0, 0
    end

    local message = tpz.msg.basic.ADD_EFFECT_DMG
    if (dmg < 0) then
        message = tpz.msg.basic.ADD_EFFECT_HEAL
        dmg = target:addHP(-dmg)
    end

	return tpz.subEffect.WIND_DAMAGE, message, dmg
end
