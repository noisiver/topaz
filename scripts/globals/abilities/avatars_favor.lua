-----------------------------------
-- Ability: Avatar's Favor
-- Description: Increases the power of your currently summoned avatar.
-- Obtained: SMN Level 60
-- Recast Time: 00:05:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if not player:getPet() then
        return tpz.msg.basic.REQUIRES_A_PET, 0
    elseif not player:getPetID() or not (player:getPetID() > 7 and player:getPetID() < 21) then
        return tpz.msg.basic.NO_EFFECT_ON_PET, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)
    local pet = player:getPet()
    player:addStatusEffect(tpz.effect.AVATAR_S_FAVOR, 0, 0, 60)
    pet:addStatusEffect(tpz.effect.AVATAR_S_FAVOR, 0, 0, 60)
    return tpz.effect.AVATAR_S_FAVOR
end
