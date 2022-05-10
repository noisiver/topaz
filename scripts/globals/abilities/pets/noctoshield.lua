---------------------------------------------
--Noctoshield
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
    local effect = tpz.effect.MAGIC_SHIELD
    local power = math.floor(pet:getMainLvl() * 2) + 50
    local duration = 900
    local bonus = 0
    local nearbyPlayers = pet:getPlayersInRange(18)
    if nearbyPlayers == nil then return end
    for _,v in ipairs(nearbyPlayers) do
        v:delStatusEffectSilent(effect)
        v:addStatusEffect(effect, power, 0, duration)
    end

    AvatarBuffBP(pet, target, skill, effect, power, tick, duration, params, bonus)
    return effect
end
