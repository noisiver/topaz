---------------------------------------------------
-- Terror Touch
-- Additional effect: Weakens attacks. Accuracy varies with TP.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.BLUNT, MOBPARAM_IGNORE_SHADOWS)
    if (mob:getPool() == 9004) then -- The Big One
        dmgmod = 3
		local typeEffect = tpz.effect.ATTACK_DOWN
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 75, 0, 30)
		local typeEffectTwo = tpz.effect.ACCURACY_DOWN
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 100, 0, 30)
		local typeEffectFour = tpz.effect.STR_DOWN
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20, 0, 30)
		local typeEffectFive = tpz.effect.DEX_DOWN
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20, 0, 30)
        target:setTP(0)
    else
        local typeEffect = tpz.effect.ATTACK_DOWN

        MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 75, 0, 30)
    end

    target:takeDamage(dmg, mob, tpz.attackType.RANGED, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
