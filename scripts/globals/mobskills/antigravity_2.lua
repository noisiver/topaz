---------------------------------------------------
-- Antigravity w / 2 Gears
-- Knockback and damage, knockback varies with gear count
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------
-- todo The potency of the knockback effect varies with
--  the number of gears in the enemy formation. A single gear produces only a
--  slight knockback, whereas triple gears produce a very strong knockback.

function onMobSkillCheck(target, mob, skill)
	if(mob:getFamily() == 120) then
		if (mob:AnimationSub() == 1) then --Needs to be tested
			return 0
		else
			return 1
		end
	end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
