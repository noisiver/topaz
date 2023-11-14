---------------------------------------------
-- Glassy Nova
--
--  Description: Deals ice damage
-- Additional effect: Full dispel(including food) and all stat down
--  Type: Magical
-- Element: Ice
--  Utsusemi/Blink absorb: Ignores shadows.
--  Range: '18 AOE centered on target
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 9.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.ICE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.ICE)
    MobFullDispelMove(mob, target, skill, tpz.effectFlag.DISPELABLE, tpz.effectFlag.FOOD)
    MobAllStatDownMove(mob, target, 21, 120)
    return dmg
end
