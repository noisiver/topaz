-----------------------------------------
-- ID: 16905
-- Item: Bokuto
-- Additional Effect: Paralyze
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 10)
    local resist = getAdditionalEffectStatusResist(player, target, tpz.effect.PARALYSIS, tpz.magic.ele.ICE, 0)
    local duration = math.floor(60 * resist)

    if (math.random(0, 95) >= chance or resist < 0.5) then 
        return 0, 0, 0
    else
        target:addStatusEffect(tpz.effect.PARALYSIS, 10, 0, duration) 
        return tpz.subEffect.PARALYSIS, tpz.msg.basic.ADD_EFFECT_STATUS, tpz.effect.PARALYSIS
    end
end
