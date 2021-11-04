---------------------------------------------------
--  Hyper_Pulse
--
--  Description:  300 magic damage, Gravity and short Bind, wipes Utsusemi
--  Type: Physical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobhp = mob:getHPP()
    local currentForm = mob:getLocalVar("form")
    local skillList = mob:getMobMod(tpz.mobMod.SKILL_LIST)
	if mob:getPool() == 2973 then
		if mobhp > 25 then
			return 0
		else
			return 1
		end
	end

    if (mob:AnimationSub() == 2 and currentForm == 1) or skillList == 54 then -- proto-omega bipedform
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.5
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,tpz.magic.ele.EARTH,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.EARTH,MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    MobStatusEffectMove(mob, target, tpz.effect.BIND, 1, 0, 4)
    MobStatusEffectMove(mob, target, tpz.effect.WEIGHT, 50, 0, 30)
    return dmg
end