---------------------------------------------------
-- Earth Shatter
-- Deals Earth elemental damage to enemies within area of effect. Additional effect: Slow, Gravity, Rasp, Accuracy Down, and Evasion Down.
-- Very long cast time, easy to stun or run away from.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()
	
	if mob:getPool() == 504 then --Boompadu
		if mobhp <= 25 then
		result = 1
		end
	end

    if (mobhp <= 25) then
        result = 0
    end

    return result
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 178) then -- Antican Legatus
		MobStatusEffectMove(mob, target, tpz.effect.SLOW, 50, 0, 30)
		MobStatusEffectMove(mob, target, tpz.effect.WEIGHT, 50, 0, 30)
		MobStatusEffectMove(mob, target, tpz.effect.ACCURACY_DOWN, 50, 0, 30)
		MobStatusEffectMove(mob, target, tpz.effect.EVASION_DOWN, 50, 0, 30)
		MobStatusEffectMove(mob, target, tpz.effect.RASP, 25, 3, 30)


		local dmgmod = 1.5
        local params_phys = {}
        params.multiplier = dmgmod
        params.tp150 = 1
        params.tp300 = 1
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.3
        params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
		local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT, params_phys)
		local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
		target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
		return dmg
	end
	
		local numhits = 1
		local accmod = 1
		local dmgmod = 2
        local params_phys = {}
        params.multiplier = dmgmod
        params.tp150 = 1
        params.tp300 = 1
        params.str_wsc = 0.2
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.2
        params.mnd_wsc = 0.0
        params.chr_wsc = 0.0
		local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, params_phys)
		local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)

		local typeEffect = tpz.effect.STUN

		MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 8)

		target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
		if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
	
    return dmg
end
