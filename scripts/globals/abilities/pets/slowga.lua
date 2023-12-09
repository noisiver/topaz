---------------------------------------------
-- Slowga
-- Gradually petrifies enemies within range.
---------------------------------------------
require("scripts/globals/summon")
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
    local effect = tpz.effect.GRADUAL_PETRIFICATION
    local power = 10
    local duration = 30
    local bonus = 0
    params.DOT = true

    skill:setMsg(AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus))
    giveAvatarTP(pet)
    return effect
end