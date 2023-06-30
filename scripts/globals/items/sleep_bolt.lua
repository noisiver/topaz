-----------------------------------------
-- ID: 18158
-- Item: Sleep Bolt
-- Additional Effect: Sleep
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 100)
    local power = 1
    local duration = 60
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.SLEEP_I, tpz.magic.ele.DARK, power, tick, duration, subpower, tier, chance, bonus)
 end
