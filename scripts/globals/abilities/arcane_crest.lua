-----------------------------------
-- Ability: Arcane Crest
-- Description: Lowers accuracy, evasion, magic accuracy, magic evasion and TP gain for arcana.
-- Obtained: DRK Level 87
-- Recast Time: 00:05:00
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
	local arcana = (target:getSystem() == 3)
	if not arcana then
		return tpz.msg.basic.CANNOT_ON_THAT_TARG, 0
	 else
		return 0, 0
	end
end

function onUseAbility(player, target, ability)
    local jpValue  = player:getJobPointLevel(tpz.jp.ARCANE_CREST_DURATION)
    local duration = 180 + jpValue
    target:addStatusEffect(tpz.effect.ARCANE_CREST, 8, 1, duration)
end
