-----------------------------------------
-- ID: 16489
-- Item: Poison Kukri +1
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 10)
    local power = 10
    local duration = 60
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.POISON, tpz.magic.ele.WATER, power, tick, duration, subpower, tier, chance, bonus)
 end
