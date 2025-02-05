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

    local numhits = 1
    local accmod = 1
    local dmgmod = 1.0
    local params_phys = {}
    params_phys.multiplier = dmgmod
    params_phys.tp150 = 1
    params_phys.tp300 = 1
    params_phys.str_wsc = 0.2
    params_phys.dex_wsc = 0.0
    params_phys.vit_wsc = 0.2
    params_phys.agi_wsc = 0.0
    params_phys.int_wsc = 0.0
    params_phys.mnd_wsc = 0.0
    params_phys.chr_wsc = 0.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, params_phys)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded*math.random(2, 3))

    local typeEffect = tpz.effect.BIND
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 5)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
