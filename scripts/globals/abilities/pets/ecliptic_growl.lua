---------------------------------------------
-- Ecliptic Growl
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
    local count = 7
    local power = 5
    local duration = 180
    local bonus = 0

    AvatarBuffMultipleEffects(pet, target, skill, power, count, tick, duration, params, bonus)
    return tpz.effect.STR_BOOST
end