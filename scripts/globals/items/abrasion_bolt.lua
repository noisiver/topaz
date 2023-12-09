-----------------------------------------
-- ID: 21314
-- Item: Abrasion Bolt
-- Additional Effect: Weakens Defense
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 100)
    local power = 18
    local duration = 180
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.DEFENSE_DOWN, tpz.magic.ele.WIND, power, tick, duration, subpower, tier, chance, bonus)
 end
