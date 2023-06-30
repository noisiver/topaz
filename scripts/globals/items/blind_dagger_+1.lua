-----------------------------------------
-- ID: 16493
-- Item: Blind Dagger +1
-- Additional Effect: Blindness
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 10)
    local power = 9
    local duration = 60
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.BLINDNESS, tpz.magic.ele.DARK, power, tick, duration, subpower, tier, chance, bonus)
 end