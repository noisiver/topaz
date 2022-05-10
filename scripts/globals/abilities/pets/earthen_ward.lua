---------------------------------------------
-- Earthen Ward
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
    local effect = tpz.effect.STONESKIN
    local power =  math.floor(pet:getMainLvl() * 2) + 50
    local duration = 900
    local effect2 = tpz.effect.DEFENSE_BOOST
    local power2 = 25
    local duration2 = 60
    local bonus = 0

    AvatarBuffBP(pet, target, skill, effect2, power2, tick, duration2, params, bonus)
    skill:setMsg(AvatarBuffBP(pet, target, skill, effect, power, tick, duration, params, bonus))
    return effect
end
