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

    local duration = 30
    duration = duration + player:getMod(tpz.mod.WARCRY_DURATION)

    target:addStatusEffect(tpz.effect.BLOOD_RAGE, 10, 0, duration, 0, 25)
end
