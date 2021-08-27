-----------------------------------
-- Ability: Counterstance
-- Increases chance to counter but lowers defense.
-- Obtained: Monk Level 45
-- Recast Time: 5:00
-- Duration: 0:15
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local power = 100 

	--player:addStatusEffect(tpz.effect.SENTINEL, power, 3, 30)
   target:addStatusEffect(tpz.effect.COUNTERSTANCE, power, 0, 15)
end
