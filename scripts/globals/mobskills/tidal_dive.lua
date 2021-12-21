---------------------------------------------
--  Tidal Dive
--
--  Description: Dives at nearby targets. Additional effect: Weight and/or Bind (Status Effect)
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadows
--  Range: Unknown radial
--  Notes: Only used over deep water.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, MOBPARAM_WIPE_SHADOWS)
        
	local typeEffect = tpz.effect.BIND
    local typeEffectTwo = tpz.effect.WEIGHT
	
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30)
	MobPhysicalStatusEffectMove(mob, target, skill, typeEffectTwo, 75, 0, 60)

    return dmg
end
