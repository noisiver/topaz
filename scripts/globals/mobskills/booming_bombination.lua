---------------------------------------------
-- Booming Bombination
--
-- Description: Large AoE damage + plague + defense down + magic defense down
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if (mob:getPool() == 6737) then -- Mellonia / Mastop
		return 0
	end
	return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() *3, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    local typeEffect = tpz.effect.PLAGUE
	MobStatusEffectMove(mob, target, tpz.effect.DEFENSE_DOWN, 50, 0, 300)
	MobStatusEffectMove(mob, target, tpz.effect.MAGIC_DEF_DOWN, 50, 0, 300)
    MobStatusEffectMove(mob, target, typeEffect, 3, 3, 300)

    return dmg
end
