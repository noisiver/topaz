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
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    --Grabbing variables.
    local vit = target:getStat(tpz.mod.VIT)
    local chr = player:getStat(tpz.mod.CHR)
    local SSpower = 0
    local power = 0
        
	SSpower = (vit+chr)*2+50
    -- Contradance check
    if (player:hasStatusEffect(tpz.effect.DIVINE_SEAL) == true) then
        SSpower = SSpower * 1.2
        player:delStatusEffect(tpz.effect.DIVINE_SEAL)
    end
	
	ability:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
	target:setMod(tpz.mod.RAMPART_STONESKIN, SSpower)
    target:addStatusEffect(tpz.effect.STONESKIN, power, 0, 120)
end

