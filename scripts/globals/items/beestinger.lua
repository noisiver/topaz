-----------------------------------------
-- ID: 16472
-- Item: Beestinger
-- Additional Effect: Slow
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 10)
    local power = 1465
    local duration = 60
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.SLOW, tpz.magic.ele.EARTH, power, tick, duration, subpower, tier, chance, bonus)
 end

