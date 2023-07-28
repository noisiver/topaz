---------------------------------------------
-- Hastega
-- Grants 30% haste and 25% quickening effect to allies in range.
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
    local power = 3007
    local duration = 600
    local bonus = 0
    local effect2 = tpz.effect.QUICKENING
    local power2 = 25

    AvatarBuffBP(pet, target, skill, effect, power, tick, duration, params, bonus)
    AvatarBuffBP(pet, target, skill, effect2, power2, tick, duration, params, bonus)
    return effect
end