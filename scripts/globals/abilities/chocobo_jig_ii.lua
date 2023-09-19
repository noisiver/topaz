-----------------------------------
-- Ability: Chocobo jig ii
-- Increases Grants nearby allies haste.
-- Obtained: Dancer Level 70
-- TP Required: 0
-- Recast Time: 1:00
-- Duration: 3:00
-----------------------------------
 require("scripts/globals/settings")
require("scripts/globals/status")

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local effect = tpz.effect.HASTE
    local power = 2998 -- 307/1024 ~29.98%
    local baseDuration = 180 + player:getJobPointLevel(tpz.jp.JIG_DURATION) -- 3m base
	local gear = player:getMod(tpz.mod.JIG_DURATION)
	local gearBonus =  baseDuration * (gear / 100)
    local finalDuration = baseDuration + gearBonus

    player:addStatusEffect(effect, power, 0, finalDuration)
    return effect -- TODO: Change spell msg
end
