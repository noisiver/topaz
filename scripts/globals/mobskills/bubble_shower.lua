---------------------------------------------------
-- Bubble Shower
-- Deals Water damage in an area of effect. Additional effect: STR Down
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.STR_DOWN
    local power = (target:getStat(tpz.mod.STR) * 0.2) +5

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 300)

    local dmgmod = MobBreathMove(mob, target, 0.10, 1, tpz.magic.ele.WATER, 200)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.WATER)
    return dmg
end
