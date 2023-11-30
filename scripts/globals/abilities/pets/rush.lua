---------------------------------------------------
-- Rush - Custom non-ele magic dmg
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local params = {}
    params.multiplier = 8
    params.tp150 = 8
    params.tp300 = 8
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.3
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.NO_TP_CONSUMPTION = true

    local damage = AvatarMagicalBP(pet, target, skill, tpz.magic.ele.NONE, params, INT_BASED, 0)
    dmg = AvatarMagicalFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.magic.ele.NONE, params)

    return dmg
end
