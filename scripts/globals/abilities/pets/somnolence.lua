---------------------------------------------------
-- Somnolence
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/magic")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    params.multiplier = 2
    params.tp150 = 2
    params.tp300 = 2
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.NO_TP_CONSUMPTION = true
    local effect = tpz.effect.WEIGHT
    local power = 25
    local duration = 45
    local bonus = 0

    local damage = AvatarMagicalBP(pet, target, skill, tpz.magic.ele.DARK, params, NONE, 0)
    dmg = AvatarMagicalFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.magic.ele.DARK, params)
    AvatarStatusEffectBP(pet, target, effect, power, duration, params, bonus)

    return dmg
end
