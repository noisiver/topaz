---------------------------------------------
-- Crimson Howl
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    local Avatar = player:getPet()
	local CurrentTP = Avatar:getTP()
	Avatar:setLocalVar("TP", CurrentTP)
    return 0, 0
end

function onPetAbility(target, pet, skill, summoner)
    local bonus = 0
    local effect = tpz.effect.BOOST
    local power = 100
    local duration = 30

    AvatarBuffBP(pet, pet, skill, effect, power, tick, duration, params, bonus)

    return effect
end