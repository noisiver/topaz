---------------------------------------------------
-- Shock Strike M=3.5
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local numhits = 1
    local ftp = 2
    local params = {}
    params.str_wsc = 0.2
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.2
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    local effect = tpz.effect.STUN
    local power = 1
    local duration = 12
    local bonus = 0

    local damage = AvatarPhysicalBP(pet, target, skill, tpz.attackType.PHYSICAL, numhits, ftp, TP_CRIT_VARIES, params)
    dmg = AvatarPhysicalFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, damage.hitslanded, params)
    AvatarPhysicalStatusEffectBP(pet, target, skill, effect, power, duration, params, bonus)

    return dmg
end