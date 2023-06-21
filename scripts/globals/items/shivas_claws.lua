-----------------------------------------
-- ID: 17492
-- Item: Shiva's Claws
-- Additional Effect: Paralyze
----------------------------------

require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")

-----------------------------------
function onAdditionalEffect(player, target, damage)
    local chance = CalculateAdditionalEffectChance(player, 12)
    local power = 20
    local duration = 60
    local subpower = 0
    local tier = 1
    local bonus = 0
    return TryApplyAdditionalEffect(player, target, tpz.effect.PARALYSIS, tpz.magic.ele.ICE, power, tick, duration, subpower, tier, chance, bonus)
 end
