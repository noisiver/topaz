---------------------------------------------------
-- Predator Claws M=10 subsequent hits M=2
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onPetAbility(target, pet, skill)
    local numhits = 3
    local ftp = 3.898437
    local params = {}
    params.str_wsc = 0.0
    params.dex_wsc = 0.3
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.multiHitFtp = true

    local damage = AvatarPhysicalBP(pet, target, skill, numhits, ftp, TP_CRIT_VARIES, params)
    dmg = AvatarPhysicalFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, damage.hitslanded, params)

    return dmg
end