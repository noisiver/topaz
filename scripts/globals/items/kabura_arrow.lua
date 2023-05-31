-----------------------------------------
-- ID: 17325
-- Item: Kabura Arrow
-- Additional Effect: Silence
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 95
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.SILENCE, tpz.magic.ele.WIND, 0)
    local duration = math.floor(60 * resist)

    if resist < 0.5 then
        return 0, 0, 0
    else
        if (not target:hasStatusEffect(tpz.effect.SILENCE)) then
            target:addStatusEffect(tpz.effect.SILENCE, 1, 0, duration)
        end
        return tpz.subEffect.SILENCE, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.SILENCE
    end
end
