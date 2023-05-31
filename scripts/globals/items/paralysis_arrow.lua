-----------------------------------------
-- ID: 18696
-- Item: Paralysis Arrow
-- Additional Effect: Paralysis (20 power)
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player, target, damage)
    local chance = 95
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.PARALYSIS, tpz.magic.ele.ICE, 0)
    local duration = math.floor(60 * resist)

    if resist < 0.5 then
        return 0, 0, 0
    else
        if (not target:hasStatusEffect(tpz.effect.PARALYSIS)) then
            target:addStatusEffect(tpz.effect.PARALYSIS, 20, 0, duration)
        end
        return tpz.subEffect.PARALYSIS, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.PARALYSIS
    end
end
