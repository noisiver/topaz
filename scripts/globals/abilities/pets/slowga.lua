---------------------------------------------
-- Slowga
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    local Avatar = player:getPet()
	local CurrentTP = Avatar:getTP()
	Avatar:setLocalVar("TP", CurrentTP)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    local effect = tpz.effect.SLOW
    local power = 3000
    local duration = 180
    local bonus = 0


    skill:setMsg(AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus))
    giveAvatarTP(pet)
    return effect
end