---------------------------------------------
--  Blink of Peril
--
--  Description: Unleashes a devastating gaze attack on a single target that sharply reduces HP and resets enmity.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Single Target
--  Notes: Very short range, easily evaded by walking away from it.
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

	if  (target:isFacing(mob)) then
		if (targetCurrentHP > hpset) then
			dmg = targetCurrentHP - hpset
		else
			dmg = 0
		end
	else
		dmg = 0
	end
	
    local dmg = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.NONE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.NONE)
	if  (target:isFacing(mob)) then
		mob:resetEnmity(target)
	end
    return dmg
end

function onMobWeaponSkill(target, mob, skill)
    local currentHP = target:getHP()
    local damage = currentHP * 0.95
    if  target:isFacing(mob) then
        damage = currentHP * 0.95
    else
        damage = 0
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
    end
    local dmg = MobFinalAdjustments(damage,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.NONE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.NONE)
    if  target:isFacing(mob) then
	    target:addStatusEffect(tpz.effect.STUN, 1, 0, 1)
        mob:resetEnmity(target)
    end

    return dmg
end