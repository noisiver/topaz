---------------------------------------------
--  Feral Peck
--
--  Description: Reduces targets' HP within a frontal cone by 90% and resets enmity of those hit.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Frontal Cone
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()
    if mob:isMobType(MOBTYPE_NOTORIOUS) then
		if (mobhp <= 50) then
			result = 0
		end
    end
    return result
end


function onMobWeaponSkill(target, mob, skill)
    local targetCurrentHP = target:getHP()
    local targetmaxHP = target:getMaxHP()
    local hpset=targetmaxHP*0.10

    if (targetCurrentHP > hpset) then
        dmg = targetCurrentHP - hpset
    else
        dmg = 0
    end
	
    local dmg = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.NONE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    mob:resetEnmity(target)
    return dmg
end

