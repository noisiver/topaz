---------------------------------------------
--  Hell Scissors
--
--  Description: Deals damage to a single target reducing their HP to 5%. Resets enmity.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Single Target
--  Notes: Reduced by PDT/DT gear
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local targetCurrentHP = target:getHP()
    local targetmaxHP = target:getMaxHP()
    local hpset=targetmaxHP*0.05

    if (targetCurrentHP > hpset) then
        dmg = targetCurrentHP - hpset
    else
        dmg = 0
    end
	
    local dmg = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
	 if (MobPhysicalHit(skill)) then
		mob:resetEnmity(target)
	end
	
    return dmg
end

