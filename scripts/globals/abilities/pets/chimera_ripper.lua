---------------------------------------------------
-- Chimera Ripper
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    getAutoTP(master)
    return master:countEffect(tpz.effect.FIRE_MANEUVER)
end

function onPetAbility(target, pet, skill)
    local numhits = 1
    local params = {}
    params.ftp100 = 2.5 -- 6.0
    params.ftp200 = 3.0 --8.5
    params.ftp300 = 3.5 -- 11.0
    params.str_wsc = 0.5
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0 
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0

    local damage = AutoPhysicalWeaponSkill(pet, target, skill, tpz.attackType.PHYSICAL, numhits, TP_DMG_BONUS, params)
    dmg = AutoPhysicalFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, damage.hitslanded, params)

    return dmg
end
