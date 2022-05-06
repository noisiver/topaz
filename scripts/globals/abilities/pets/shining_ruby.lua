---------------------------------------------
-- Shining Ruby
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
    params.DOT = true
    local effect = tpz.effect.FLASH
    local power = 300
    local duration = 12
    local bonus = 200
    local tp = pet:getLocalVar("TP")


    AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus)
    pet:setTP(tp)
    return effect
end