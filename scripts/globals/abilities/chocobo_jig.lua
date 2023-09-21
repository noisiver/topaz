-----------------------------------
-- Ability: Chocobo jig
-- Increases Movement Speed.
-- Obtained: Dancer Level 55
-- TP Required: 0
-- Recast Time: 1:00
-- Duration: 2:00
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local duration = 120 + player:getJobPointLevel(tpz.jp.JIG_DURATION)
	local gear = player:getMod(tpz.mod.JIG_DURATION)
	local gearbonus =  duration * (gear / 100)
	local finalduration = duration + gearbonus


	player:addStatusEffect(tpz.effect.QUICKENING, 20, 0, finalduration)
end

