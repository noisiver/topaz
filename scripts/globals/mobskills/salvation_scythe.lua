---------------------------------------------------
-- Sheep Charge Autoattack
-- Deals damage to a single target. Additional effect: Knockback
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
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
	
	local CurrentTP = mob:getLocalVar("TP")
	local AddTP = CurrentTP + 200
    if (MobPhysicalHit(skill)) then
       target:addTP(20)
       mob:addTP(AddTP)
    end
	
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.PARALYSIS, 15, 0, 30)
	MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.SLOW, 1250, 0, 30)
	MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.WEIGHT, 25, 0, 30)
	MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.BLINDNESS, 25, 0, 30)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
