-----------------------------------
-- Ability: Chocobo jig ii
-- Increases Grants Reraise II effect to the Dancer
-- Obtained: Dancer Level 70
-- TP Required: 0
-- Recast Time: 1:00
-- Duration: 2:00
-----------------------------------
 require("scripts/globals/settings")
require("scripts/globals/status")

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local baseDuration = 1800 -- 30 minutes
	local gear = player:getMod(tpz.mod.JIG_DURATION)
	local gearBonus =  baseDuration * (gear / 100)
    local finalDuration = baseDuration + gearBonus
        printf("duration %s", finalDuration)
    player:addStatusEffect(tpz.effect.RERAISE, 1, 0, 1800)
end
