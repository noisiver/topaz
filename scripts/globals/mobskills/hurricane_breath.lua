---------------------------------------------
--  Hurricane Breath
--
--  Description: Deals wind damage to enemies within a fan-shaped area originating from the caster.
-- Encumbers 1 piece of gear
-- Unusually high damage.
--  Type: Magical (Wind)
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobHPBasedMove(mob, target, 0.10, 1, tpz.magic.ele.WIND, 1400)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.WIND)
    MobEncumberMove(mob, target, 1, 90)
    return dmg
end
