---------------------------------------------
-- Ecliptic Growl
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
    local effect = tpz.effect.TERROR
    local power = 1
    local duration = 6
    local bonus = 0
    local tp = pet:getLocalVar("TP")


    AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus)
    pet:setTP(tp)
    return effect
end