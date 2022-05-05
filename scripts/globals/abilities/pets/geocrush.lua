---------------------------------------------------
-- Geocrush
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    local Avatar = player:getPet()
	local CurrentTP = Avatar:getTP()
	Avatar:setLocalVar("TP", CurrentTP)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    params.multiplier = 5.3515625
    params.tp150 = 8.203125
    params.tp300 = 10.703125
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.IGNORES_SHADOWS = true
    local effect = tpz.effect.STUN
    local power = 1
    local duration = 2
    local bonus = 250
    --TODO:: Test stun and msg not overwriting dmg msg
    local damage = AvatarMagicalBP(pet, target, skill, tpz.magic.ele.EARTH, params, INT_BASED, 0)
    dmg = AvatarMagicalFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.magic.ele.EARTH, params)
    AvatarStatusEffectBP(avatar, target, effect, power, duration, params, bonus)

    return dmg
end
