---------------------------------------------
--  Aqua Cannon 
--
--  Description: Replaces Aqua Blast - AoE Water damage that inflicts Defense Down and knockback.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
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
    local accmod = 1
    local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
	local typeEffect = tpz.effect.DEFENSE_DOWN
	
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
	MobStatusEffectMove(mob, target, typeEffect, 33, 0, 300)
    return dmg
end
