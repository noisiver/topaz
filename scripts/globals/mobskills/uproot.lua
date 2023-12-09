---------------------------------------------
-- FUproot
--
-- Description: AoE magical damage Additional effect: Slow, hate reset and dispels all effects on self.
-- Type: Magical
-- Element: Light
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 9.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.LIGHT, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg , mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
    MobHasteOverwriteSlowMove(mob, target, 5000, 0, 90, 0, 0, 2)
    MobSelfDispelMove(mob, skill)
    mob:resetEnmity(target)
    return dmg
end