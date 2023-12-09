-----------------------------------
-- Ability: Cascade
-- Description: Grants a damage bonus to the next elemental magic spell cast based on TP consumed.
-- Obtained: BLM Level 	5
-- Recast Time: 00:01:00
-- Duration: 0:01:00 or the next spell cast
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local power = 0
    power = math.floor(player:getTP() * 0.10) -- https://www.bg-wiki.com/ffxi/Cascade
    power = power + player:getMod(tpz.mod.CASCADE_TP_BONUS)

    player:setTP(0)
    player:addStatusEffect(tpz.effect.CASCADE, power, 0, 60)
end
