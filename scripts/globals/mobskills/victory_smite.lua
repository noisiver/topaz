---------------------------------------------
-- Victory Smite
-- Description: Delivers a fourfold attack. Chance of params_phys.critical hit varies with TP.
-- Type: Physical
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 4
    local accmod = 1
    local dmgmod = 0.5
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES, 1.45, 1.55, 1.75)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.H2H, MOBPARAM_3_SHADOW)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.H2H)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
