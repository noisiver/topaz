---------------------------------------------------
-- Ruinous Omen
-- Reduces the HP of enemies within the area of effect by a random percentage.
-- Potency caps at around 10% HP against NMs.
-- Is affected by Magic Attack Bonus, Magic Defense Bonus, Resists, etc.
-- Gives Diabolos little or no enmity.
---------------------------------------------------
require("/scripts/globals/settings")
require("/scripts/globals/status")
require("/scripts/globals/monstertpmoves")
require("/scripts/globals/magic")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    getAvatarTP(player)
    return 0, 0
end

function onPetAbility(target, pet, skill, master)
    local params = {}
    params.multiplier = 1
    params.tp150 = 1
    params.tp300 = 1
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.NO_TP_CONSUMPTION = true
    params.TARGET_HP_BASED = true
    params.NO_ENMITY = true


    local damage = AvatarMagicalBP(pet, target, skill, tpz.magic.ele.DARK, params, INT_BASED, 0)
    dmg = AvatarMagicalFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.magic.ele.DARK, params)
    master:setMP(0)

    return dmg
end