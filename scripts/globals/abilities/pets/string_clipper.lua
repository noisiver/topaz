---------------------------------------------------
-- String Clipper
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    local master = automaton:getMaster()
    getAutoTP(master)
    return master:countEffect(tpz.effect.THUNDER_MANEUVER)
end

function onPetAbility(target, pet, skill)
    local numhits = 2
    local params = {}
    params.ftp100 = 2.0 -- 3.5
    params.ftp200 = 2.0 -- 3.5
    params.ftp300 = 2.0 -- 3.5
    params.str_wsc = 0.3
    params.dex_wsc = 0.3
    params.vit_wsc = 0.0
    params.agi_wsc = 0.0
    params.int_wsc = 0.0 
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    params.attkMod = 1.25

    local damage = AutoPhysicalWeaponSkill(pet, target, skill, tpz.attackType.PHYSICAL, numhits, TP_ACC_BONUS, params)
    dmg = AutoPhysicalFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, damage.hitslanded, params)

    return dmg
end