---------------------------------------------
--  Decussate
--
--  Description: Performs a cross attack on nearby targets(AOE).
--  Type: Physical
--  Utsusemi/Blink absorb: 2 shadows.
--  Range: Less than or equal to 10.0
--  Notes: Only used by Gulool Ja Ja when below 35% health.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local mobhp = mob:getHPP()
    if (mob:getPool() == 1846 and mobhp <= 30 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.H2H, MOBPARAM_2_SHADOW)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.H2H)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
