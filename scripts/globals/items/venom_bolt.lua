-----------------------------------------
-- ID: 18152
-- Item: Venom Bolt
-- Additional Effect: Poison
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 100)
    local power = 15
    local duration = 60
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.PARALYSIS, tpz.magic.ele.ICE, power, tick, duration, subpower, tier, chance, bonus)
 end
