-----------------------------------
-- Ability: Leave
-- Sets your pet free.
-- Obtained: Beastmaster Level 35
-- Recast Time: 10 seconds
-- Duration: N/A
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if player:getPet() == nil then
        return tpz.msg.basic.REQUIRES_A_PET, 0
    end
    return 0, 0
end

function onUseAbility(player, target, ability)
    target:despawnPet()
end
