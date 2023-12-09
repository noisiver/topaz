---------------------------------------------------
-- Nightmare
---------------------------------------------------
require("scripts/globals/summon")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    params.DOT = true
    local effect = tpz.effect.SLEEP_II
    local power = 1
    local duration = 90
    local bonus = 0
    local effect2 = tpz.effect.BIO
    local power2 = 2

    target:addStatusEffectEx(tpz.effect.DEEPSLEEP,0,1,3,90)
    AvatarStatusEffectBP(pet, target, effect2, power2, duration, params, bonus)
    skill:setMsg(AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus))
    giveAvatarTP(pet)

    return effect
end