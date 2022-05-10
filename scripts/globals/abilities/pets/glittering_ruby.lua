---------------------------------------------
-- Glittering Ruby
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill, summoner)
    local bonus = 0
    local effect = tpz.effect.REGEN
    local power = 12
    local duration = 60
    local tick = 3

    AvatarBuffBP(pet, target, skill, effect, power, tick, duration, params, bonus)

    return effect
end
