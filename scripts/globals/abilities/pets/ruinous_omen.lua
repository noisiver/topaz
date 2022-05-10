---------------------------------------------------
-- Ruinous Omen
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
    params.multiplier = 9
    params.tp150 = 9
    params.tp300 = 9
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.NO_TP_CONSUMPTION = true


    local damage = AvatarMagicalBP(pet, target, skill, tpz.magic.ele.DARK, params, INT_BASED, 0)
    dmg = AvatarMagicalFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.magic.ele.DARK, params)
    master:setMP(0)

    return dmg
end