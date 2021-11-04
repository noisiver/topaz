---------------------------------------------
--  Guided_Missile
--
--  Description: Targeted 10'(?) AoE ~400-750 physical damage, absorbed by Utsusemi
--  Type: Physical
--  Wipes Shadows
--  Range: 5 yalms
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    local mobhp = mob:getHPP()
	if mob:getPool() == 2973 then
		if mobhp > 25 then
			return 0
		else
			return 1
		end
	end
    if (mob:AnimationSub() <= 1) then -- omega four leg form
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_2_SHADOW)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
