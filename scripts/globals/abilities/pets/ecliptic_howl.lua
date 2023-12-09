---------------------------------------------
-- Ecliptic Howl
---------------------------------------------
require("scripts/globals/summon")
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
    local effect = tpz.effect.ACCURACY_BOOST
    local power = 10
    local duration = 180
    local effect2 = tpz.effect.EVASION_BOOST
    local power2 = 10
    local bonus = 0

    AvatarBuffBP(pet, target, skill, effect2, power2, tick, duration, params, bonus)
    AvatarBuffBP(pet, target, skill, effect, power, tick, duration, params, bonus)
    return effect
end
