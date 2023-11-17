---------------------------------------------------
-- Yggdreant Auto one
--
-- Breath damage. Additional effect: HP Drain
-- Single Target
-- Element: Dark 
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobHPBasedMove(mob, target, 0.10, 1, tpz.magic.ele.DARK, 250)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
    MobDrainMove(mob, target, skill, MOBDRAIN_HP, dmg, tpz.attackType.BREATH, tpz.damageType.DARK)
    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.DARK)
    skill:setMsg(tpz.msg.basic.HIT_DMG) 
    return dmg
end