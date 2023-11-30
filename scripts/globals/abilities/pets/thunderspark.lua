---------------------------------------------------
-- Thunderspark M=whatever
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/magic")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    params.multiplier = 2.5
    params.tp150 = 3
    params.tp300 = 3.24609375
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.AVATAR_WIPE_SHADOWS = true

    local effect = tpz.effect.PARALYSIS
    local power = 25
    local duration = 60
    local bonus = 0

    local damage = AvatarMagicalBP(pet, target, skill, tpz.magic.ele.THUNDER, params, INT_BASED, 0)
    dmg = AvatarMagicalFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.magic.ele.THUNDER, params)
    AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus)

    return dmg
end
