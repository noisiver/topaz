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
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill, summoner)
    local bonus = 0
    local effect = tpz.effect.ATTACK_BOOST
    local power = 50
    local duration = 180

    AvatarBuffBP(pet, pet, skill, effect, power, tick, duration, params, bonus)

    return effect
end