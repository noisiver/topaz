---------------------------------------------
--  Hoof Volley
--  Family: Hippogryph
--  Description: Deals critical damage to a single target. Resets hate and causes knockback.
--  Type: Physical
--  Utsusemi/Blink absorb: One shadow
--  Range: Melee
--  Notes: Easily stunnable
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	 if mob:isMobType(MOBTYPE_NOTORIOUS) or zone == 89 then
		return 0
	end
	return 1
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_CRIT_VARIES, 1.5, 1.75, 2)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    if (MobPhysicalHit(skill)) then
        mob:resetEnmity(target)
    end
    return dmg
end
