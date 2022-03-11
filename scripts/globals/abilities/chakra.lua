-----------------------------------
-- Ability: Chakra
-- Cures certain status effects and restores a small amount of HP to user.
-- Obtained: Monk Level 35
-- Recast Time: 0:30
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

local ChakraStatusEffects =
{
    POISON       = 0, -- Removed by default
    BLINDNESS    = 0, -- Removed by default
    PARALYSIS    = 1,
    DISEASE      = 2,
    PLAGUE       = 4
}

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local chakraRemoval = player:getMod(tpz.mod.CHAKRA_REMOVAL)
    for k, v in pairs(ChakraStatusEffects) do
        if bit.band(chakraRemoval, v) == v then
            player:delStatusEffect(tpz.effect[k])
        end
    end

    --local recover = player:getStat(tpz.mod.VIT) * (2 + player:getMod(tpz.mod.CHAKRA_MULT) / 10) -- TODO: Figure out "function of level" addition (August 2017 update)
    local recover = player:getStat(tpz.mod.VIT) * (2 + player:getMod(tpz.mod.CHAKRA_MULT) / 10) * 1.5 
	if player:getMainJob() == tpz.job.MNK then  
		recover = recover
	else
		recover = recover * 0.5 -- Nerf Chakra by half if subbed
	end
    -- Apply cure potency received stat mod
    local healingReceivedMultiplier = 1 + (player:getMod(tpz.mod.CURE_POTENCY_RCVD) / 100)
    recover = recover * healingReceivedMultiplier
	
    if ((target:getMaxHP() - target:getHP()) < recover) then
        recover = (target:getMaxHP() - target:getHP())
    end
    player:setHP(player:getHP() + recover)
	ability:setMsg(tpz.msg.basic.JA_RECOVERS_HP)

    local merits = player:getMerit(tpz.merit.INVIGORATE)
    if merits > 0 then
        if player:hasStatusEffect(tpz.effect.REGEN) then
            player:delStatusEffect(tpz.effect.REGEN)
        end
        player:addStatusEffect(tpz.effect.REGEN, 10, 0, merits, 0, 0, 1)
    end

    return recover
end
