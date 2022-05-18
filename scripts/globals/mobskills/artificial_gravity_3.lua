---------------------------------------------------
-- Artifical Gravity W/ 3 gears
-- Damage plus Weight effect
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if (mob:AnimationSub() == 0) then --Needs to be tested
		return 0
	else
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local params_phys = {}
    params.multiplier = dmgmod
    params.tp150 = 1
    params.tp300 = 1
    params.str_wsc = 0.0
    params.dex_wsc = 0.0
    params.vit_wsc = 0.0
    params.agi_wsc = 0.1
    params.int_wsc = 0.1
    params.mnd_wsc = 0.0
    params.chr_wsc = 0.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, params_phys)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_WIPE_SHADOWS)
    MobStatusEffectMove(mob, target, tpz.effect.WEIGHT, 50, 0, 300)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
