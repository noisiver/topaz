---------------------------------------------
-- Ultimate Terror
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    local numberdrained = math.random(1, 7)
    skill:setMsg(AvatarDrainMultipleAttributes(pet, target, 21, numberdrained, 90, params, 0))
    return numberdrained
end