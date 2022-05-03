---------------------------------------------
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onPetAbility(target, pet, skill, summoner)
    local bonus = 0
    local effect = tpz.effect.POTENCY
    local power = math.floor(pet:getMainLvl() / 5)
    local duration = 60

    AvatarBuffBP(pet, target, skill, effect, power, tick, duration, params, bonus)

    return effect
end
