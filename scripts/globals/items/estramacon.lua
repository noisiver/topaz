-----------------------------------------
-- ID: 19160
-- Item: Estramacon
-- Additional Effect: TP Drain
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local dmg = doAdditionalEffectDamage(player, target, 30, 25, nil, false, 0, tpz.magic.ele.DARK, 0)

    if dmg == 0 then
        return 0, 0, 0
    end

        if (dmg > target:getTP()) then
            dmg = target:getTP()
        end

        target:addTP(-dmg)
        player:addTP(dmg)

    return tpz.subEffect.TP_DRAIN, tpz.msg.basic.ADD_EFFECT_TP_DRAIN, dmg
end
