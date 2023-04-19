-----------------------------------
-- Ability: Mana Wall
-- Description: Become impervious to damage and unable to act for a short time.
-- Obtained: BLM Level 70
-- Recast Time: 00:10:00
-- Duration: 00:00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.STUN, 1, 0, 30)
    player:addStatusEffect(tpz.effect.MANA_WALL, 1, 0, 30)
end
