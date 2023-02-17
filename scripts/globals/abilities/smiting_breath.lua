-----------------------------------
-- Ability: Smiting Breath
-- Commands your wyvern to use an offensive breath.
-- Obtained: Dragoon Level 40
-- Recast Time: 01:00
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/pets/wyvern")
-----------------------------------

function onAbilityCheck(player, target, ability)
    -- The wyvern must be present in order to use Restoring Breath
    if (player:getPet() == nil) then
        return tpz.msg.basic.REQUIRES_A_PET, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    doOffensiveBreath(player, target)
end
