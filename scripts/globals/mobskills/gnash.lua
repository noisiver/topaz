---------------------------------------------
--  Gnash
--  Description: Inflicts damage equal to 50% of target's HP. Ignores shadows.
--  Type: Physical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local currentHP = target:getHP()
    local damage = currentHP * .50
    local dmg = MobFinalAdjustments(damage,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.NONE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.NONE)
	target:addStatusEffect(tpz.effect.STUN, 1, 0, 1)

    return dmg
end
