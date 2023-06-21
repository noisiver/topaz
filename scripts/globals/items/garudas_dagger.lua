-----------------------------------------
-- ID: 17627
-- Item: Garuda's Dagger
-- Additional Effect: Silence
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 12)
    local power = 1
    local duration = 30
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.SILENCE, tpz.magic.ele.WIND, power, tick, duration, subpower, tier, chance, bonus)
 end
