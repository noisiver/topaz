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
    local effect2 = tpz.effect.PHALANX
    local power2 = math.floor(pet:getMainLvl() /3)
    local duration = 900
    local bonus = 0

    -- Add phalanx recieved gear mod
    power2 = power2 + target:getMod(tpz.mod.PHALANX_RECIEVED)

    AvatarBuffBP(pet, target, skill, effect, power, tick, duration, params, bonus)
    AvatarBuffBP(pet, target, skill, effect2, power2, tick, duration, params, bonus)
    return effect
end
