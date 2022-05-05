---------------------------------------------------
-- Nightmare
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
    local Avatar = player:getPet()
	local CurrentTP = Avatar:getTP()
	Avatar:setLocalVar("TP", CurrentTP)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    local effect = tpz.effect.SLEEP_I
    local power = 1
    local duration = 90
    local bonus = 0
    local effect2 = tpz.effect.BIO
    local power2 = 100

    target:addStatusEffectEx(tpz.effect.DEEPSLEEP,0,1,3,90)
    AvatarStatusEffectBP(pet, target, effect2, power2, duration, params, bonus)
    skill:setMsg(AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus))

    return effect
end