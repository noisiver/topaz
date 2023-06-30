---------------------------------------------
-- Nosferatus' Kiss
-- Steals an enemy's HP and TP. Ineffective against undead.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = mob:getMainLvl()
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
	MobDrainMove(mob, target, skill, MOBDRAIN_MP, dmg, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    MobDrainMove(mob, target, skill, MOBDRAIN_TP, dmg, tpz.attackType.MAGICAL, tpz.damageType.DARK)
	skill:setMsg(MobDrainMove(mob, target, skill, MOBDRAIN_HP, dmg, tpz.attackType.MAGICAL, tpz.damageType.DARK))

    return dmg
end
