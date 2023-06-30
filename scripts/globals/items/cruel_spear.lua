-----------------------------------------
-- ID: 16863
-- Item: Cruel Spear
-- Additional Effect: Impairs evasion
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 25)
    local power = 25
    local duration = 60
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.EVASION_DOWN, tpz.magic.ele.ICE, power, tick, duration, subpower, tier, chance, bonus)
 end
