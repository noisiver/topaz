-----------------------------------------
-- ID: 17770
-- Item: Mamushito +1
-- Additional Effect: Stun
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 7)
    local power = 1
    local duration = 5
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.STUN, tpz.magic.ele.THUNDER, power, tick, duration, subpower, tier, chance, bonus)
 end


