-----------------------------------
-- Ability: Subtle Sorcery
-- Description: Greatly increases your magic damage.
-- Obtained: BLM Level 60
-- Recast Time: 00:05:00
-- Duration: 00:03:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    player:addStatusEffect(tpz.effect.SUBTLE_SORCERY, 1, 0, 180)
end
