---------------------------------------------
-- Hastega
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
    local effect = tpz.effect.HASTE
    local power = 1530
    local duration = 180
    local bonus = 0

    AvatarBuffBP(pet, target, skill, effect, power, tick, duration, params, bonus)
    return effect
end