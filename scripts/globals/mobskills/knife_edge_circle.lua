---------------------------------------------------
-- Knife Edge Circle
-- Delivers an area attack that stuns enemies. Damage varies with TP.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if (mob:AnimationSub() == 3) then
		return 0
	end
	return 1
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 2 
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded*math.random(2, 3))

    local typeEffect = tpz.effect.STUN
	local typeEffectTwo = tpz.effect.POISON


    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 5)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffectTwo, 20, 3, 300)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
