---------------------------------------------
-- Dominion Slash
--
-- Description: Performs an area of effect slashing weaponskill. Additional effect: Silence
-- Type: Physical
-- 2-3 Shadows
-- Range: Unknown radial

-- One source also mentions that it "can dispel important buffs."
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local params_phys = {}
    params_phys.multiplier = dmgmod
    params_phys.tp150 = 1
    params_phys.tp300 = 1
    params_phys.str_wsc = 0.2
    params_phys.dex_wsc = 0.0
    params_phys.vit_wsc = 0.0
    params_phys.agi_wsc = 0.0
    params_phys.int_wsc = 0.0
    params_phys.mnd_wsc = 0.2
    params_phys.chr_wsc = 0.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, params_phys)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_2_SHADOW)


    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.SILENCE, 1, 0, 300)
	if (MobPhysicalHit(mob, skill)) then
		MobDispelMove(mob, target, skill, tpz.magic.ele.DARK, tpz.effectFlag.DISPELABLE)
	end
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
