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
    local chance = CalculateAdditionalEffectChance(player, 100)
    local power = 15
    local duration = 180
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.PARALYSIS, tpz.magic.ele.ICE, power, tick, duration, subpower, tier, chance, bonus)
 end
