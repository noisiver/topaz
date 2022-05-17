---------------------------------------------
--  Gusting Gouge
--  Description: Deals Wind damage in a threefold attack to targets in a fan-shaped area of effect.
--  Type: Magic
--  Utsusemi/Blink absorb: Ignores Shadows
--  Notes: Used only by Lamia equipped with a one-handed weapon. If they lost their weapon, they'll use Hysteric Barrage instead.
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:AnimationSub() == 0 and (mob:getMainJob() == tpz.job.COR or mob:getMainJob() == tpz.job.BRD or mob:getMainJob() == tpz.job.RDM) then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.7
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.WIND, info.hitslanded*math.random(2, 3))
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.WIND)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    
    return dmg
end
