-----------------------------------
-- Ability: Dragon Breaker
-- Description: Lowers accuracy, evasion, magic accuracy, magic evasion and TP gain for dragons.
-- Obtained: DRG Level 87
-- Recast Time: 00:01:00
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
	local dragon = target:getSystem() == 10
	if not dragon then
		return tpz.msg.basic.CANNOT_ON_THAT_TARG, 0
	 else
		return 0, 0
	end
end

function onUseAbility(player, target, ability)
    local dragon = target:getSystem() == 10
	if dragon then
        target:addStatusEffect(tpz.effect.DRAGON_BREAKER, 14, 0, 180)
    end
end
