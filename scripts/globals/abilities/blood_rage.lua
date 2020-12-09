-----------------------------------
-- Ability: Blood Rage
-- Description: Enhances critical hit rate for party members within area of effect.
-- Obtained: WAR Level 87
-- Recast Time: 00:05:00
-- Duration: 0:00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.CURE_POTENCY_RCVD, 1, 10, 60) -- 10% 60s duration
end
