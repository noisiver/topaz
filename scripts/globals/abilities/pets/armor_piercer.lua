---------------------------------------------------
-- Armor Piercer
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    getAutoTP(master)
    return master:countEffect(tpz.effect.DARK_MANEUVER)
end

function onPetAbility(target, pet, skill)
    local numhits = 1
    local params = {}
    params.ftp100 = 4.0
    params.ftp200 = 4.5
    params.ftp300 = 5.0
    params.str_wsc = 0.0
    params.dex_wsc = 0.6
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.ignoreDefMod = 50

    local damage = AutoPhysicalWeaponSkill(pet, target, skill, tpz.attackType.RANGED, numhits, TP_DMG_BONUS, params)
    dmg = AutoPhysicalFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.RANGED, tpz.damageType.RANGED, damage.hitslanded, params)

    return dmg
end
