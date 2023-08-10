-----------------------------------------
-- ID: 16938
-- Item: Glorious Sword
-- Additional Effect: Flash
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 25)
    local power = 200
    local duration = 12
    local subpower = 0
    local tier = 1
    local bonus = 256
    return TryApplyAdditionalEffect(player, target, tpz.effect.FLASH, tpz.magic.ele.LIGHT, power, tick, duration, subpower, tier, chance, bonus)
 end