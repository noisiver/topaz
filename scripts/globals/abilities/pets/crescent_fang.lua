---------------------------------------------------
-- Moonlit Charge M=6
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local numhits = 1
    local ftp = 1.5
    local params = {}
    params.str_wsc = 0.3
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    local effect = tpz.effect.PARALYSIS
    local power = 25
    local duration = 60
    local bonus = 0

    local damage = AvatarPhysicalBP(pet, target, skill, tpz.attackType.PHYSICAL, numhits, ftp, TP_DMG_BONUS, params)
    dmg = AvatarPhysicalFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, damage.hitslanded, params)
    AvatarPhysicalStatusEffectBP(pet, target, skill, effect, power, duration, params, bonus)

    return dmg
end