---------------------------------------------
--  Detonating Grip
--
--  Description: Deals physical damage, removes an arm.
--  Type: Physical
--  Utsusemi/Blink absorb: Wipes shadows.
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if  mob:AnimationSub() == 0 or mob:AnimationSub() == 1 then --Needs testing for proper animation sub
		return 0
	else
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 3
	if  mob:AnimationSub() == 0 then --Needs testing for proper animation sub
		mob:AnimationSub(1) --Needs testing for proper animation sub
	elseif
		mob:AnimationSub() == 1 then --Needs testing for proper animation sub
		mob:AnimationSub(2)  --Needs testing for proper animation sub
	end
		 
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
