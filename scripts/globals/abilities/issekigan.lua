-----------------------------------
-- Ability: Issekigan
-- Increases Chance of parrying and gives an enmity bonus upon a successful parry attempt.
-- Adds 50% to your parry rate.
-- Obtained: Ninja Level 50
-- Recast Time: 5:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    target:addStatusEffect(tpz.effect.ISSEKIGAN, 50, 0, 60) -- changed from 25
end
