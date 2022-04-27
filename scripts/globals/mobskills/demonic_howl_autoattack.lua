---------------------------------------------
--  Hecatomb Wave
--
--  Description: Deals wind damage to enemies within a fan-shaped area originating from the caster. Additional effect: Blindness.
--  Type: Magical (Wind)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	local CurrentTP = mob:getTP()
	mob:setLocalVar("TP", CurrentTP)
		return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BLINDNESS
    MobStatusEffectMove(mob, target, typeEffect, 50, 0, 300)

    local dmgmod = MobBreathMove(mob, target, 0.10, 1, tpz.magic.ele.WIND, 400)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)

    if mob:isInDynamis() then 
        dmgmod = MobBreathMove(mob, target, 0.10, 1, tpz.magic.ele.WIND, 600)
    end

	local CurrentTP = mob:getLocalVar("TP")
	local AddTP = CurrentTP + 200
    if (MobPhysicalHit(skill)) then
       target:addTP(20)
       mob:addTP(AddTP)
    end

    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.WIND)
    return dmg
end
