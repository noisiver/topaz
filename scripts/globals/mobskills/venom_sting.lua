---------------------------------------------------
-- Venom Sting
-- Deals physical damage to a single target. Additional effect: Poison
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	local CurrentTP = mob:getTP()
	mob:setLocalVar("TP", CurrentTP)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local CurrentTP = mob:getLocalVar("TP")
    if CurrentTP == 2000 then
        dmgmod = 2
    end
    if CurrentTP == 3000 then
        dmgmod = 3
    end
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, TP_CRIT_VARIES, 1.45, 1.55, 1.75)

    local typeEffect = tpz.effect.POISON
    local power = 100
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, 3, 300)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
