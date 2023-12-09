---------------------------------------------
--  Foxfire
--
--  Description: Damage varies with TP. Additional effect: "Stun."
--  Type: Physical (Blunt)
-- Only used by Fomors that wield a one-handed weapon 
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    -- Only used by 1 handed fomors
    if (mob:isWeaponTwoHanded() or mob:getWeaponSkillType(tpz.slot.MAIN) == tpz.skill.HAND_TO_HAND) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.STUN
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.0
    local params_phys = {}
    params_phys.multiplier = dmgmod
    params_phys.tp150 = 1
    params_phys.tp300 = 1
    params_phys.str_wsc = 0.2
    params_phys.dex_wsc = 0.0
    params_phys.vit_wsc = 0.0
    params_phys.agi_wsc = 0.0
    params_phys.int_wsc = 0.2
    params_phys.mnd_wsc = 0.0
    params_phys.chr_wsc = 0.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, params_phys, 1.05, 1.10)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 8)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
