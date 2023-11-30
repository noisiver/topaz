---------------------------------------------
-- Crimson Howl
-- Attack Boost = floor( (Summoner Level ÷ 4) + 4.75 ) ÷ 256
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
    local bonus = 0
    local effect = tpz.effect.WARCRY
    local power = math.floor((summoner:getMainLvl() / 2) + 4.75 / 256)
    local duration = 180

    AvatarBuffBP(pet, target, skill, effect, power, tick, duration, params, bonus)

    return effect
end