---------------------------------------------
-- Aerial Armor
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

function onPetAbility(target, pet, skill, summoner)
    local params = {}
    local effect = tpz.effect.BLINK
    local power = 4
    local duration = 900
    local effect2 = tpz.effect.PAX
    local power2 = math.floor(pet:getMainLvl() / 5)
    local duration2 = 180
    local bonus = 0

    AvatarBuffBP(pet, target, skill, effect2, power2, tick, duration2, params, bonus)
    AvatarBuffBP(pet, target, skill, effect, power, tick, duration, params, bonus)
    return effect
end
