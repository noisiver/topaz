---------------------------------------------
-- Lunar Cry
---------------------------------------------
require("scripts/globals/summon")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    local effect = tpz.effect.EVASION_DOWN
    local power = 10
    local duration = 180
    local bonus = 0
    local effect2 = tpz.effect.ACCURACY_DOWN
    local power2 = 10


    AvatarStatusEffectBP(pet, target, effect2, power2, duration, params, bonus)
    skill:setMsg(AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus))
    giveAvatarTP(pet)
    return effect
end