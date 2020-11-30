-----------------------------------
-- Ability: Dodge
-- Enhances user's evasion.(+50)
-- Obtained: Monk Level 15
-- Recast Time: 2:00
-- Duration: 0:20
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    local power = 50 + player:getMod(tpz.mod.DODGE_EFFECT)
    player:addStatusEffect(tpz.effect.DODGE, power, 0, 50)
end
