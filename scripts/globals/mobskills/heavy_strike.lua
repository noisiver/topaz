---------------------------------------------------
-- Heavy Strike
-- Damage varies with TP.
-- 0% TP: 2.25 / 150% TP: 3.50 / 300% TP: 4.75
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.25
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_CRIT_VARIES, 1.25, 1.5, 2)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    local typeEffect = tpz.effect.SLOW

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1250, 0, 120)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    return dmg
end
