-----------------------------------------
-- ID: 18026
-- Item: Magnet Knife
-- Additional Effect: Gravity
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 10)
    local power = 33
    local duration = 60
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.WEIGHT, tpz.magic.ele.WIND, power, tick, duration, subpower, tier, chance, bonus)
 end
