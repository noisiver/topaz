-----------------------------------
-- Ability: Enmity Douse
-- Description: Reduces the target's enmity towards you.
-- Obtained: BLM Level 50
-- Recast Time: 0:10:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability)
    if target:isMob() then
        local enmityShed = 100
        target:lowerEnmity(player, enmityShed)
    end
end
