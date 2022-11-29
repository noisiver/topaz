---------------------------------------------------
-- Snort Autoattack
-- Used by Geush Urvan
-- Deals wind damage. Ignores shadows and cause a slight knockback, which temporarily stuns the target.
-- Can do more than 1,000 damage per melee hit.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.10, 1, tpz.magic.ele.WIND, 1000)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.WIND)
    return dmg
end
