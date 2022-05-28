-----------------------------------------
-- ID: 18150
-- Item: Blind Bolt
-- Additional Effect: Blindness
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.BLINDNESS, tpz.magic.ele.DARK, 0)
    local duration = math.floor(60 * resist)

    if resist < 0.5 then
        return 0, 0, 0
    else
        target:delStatusEffectSilent(tpz.effect.BLINDNESS)
        if (not target:hasStatusEffect(tpz.effect.BLINDNESS)) then
            target:addStatusEffect(tpz.effect.BLINDNESS, 20, 0, duration)
        end
        return tpz.subEffect.BLIND, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.BLINDNESS
    end
end
