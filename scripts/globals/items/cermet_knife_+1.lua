-----------------------------------------
-- ID: 17609
-- Item: Cermet Knife +1
-- Additional Effect: Weakens Attacks
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 10)
    local power = 13
    local duration = 60
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.ATTACK_DOWN, tpz.magic.ele.WATER, power, tick, duration, subpower, tier, chance, bonus)
 end
