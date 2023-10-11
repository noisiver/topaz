-----------------------------------
-- Ability: Ancient Circle
-- Grants resistance, defense, and attack against dragons to party members within the area of effect.
-- Obtained: Dragoon Level 5
-- Recast Time: 5:00
-- Duration: 03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local power = 15
    local duration = 180 + player:getMod(tpz.mod.ANCIENT_CIRCLE_DURATION)
    local jpValue  = player:getJobPointLevel(tpz.jp.ANCIENT_CIRCLE_EFFECT)

    power = power + jpvalue

    target:addStatusEffect(tpz.effect.ANCIENT_CIRCLE, power, 0, duration)
end
