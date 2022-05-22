---------------------------------------------------
-- Jump
-- Jumping Attack, only used by dragoon orcs.
-- 100% TP: ??? / 200% TP: ??? / 300% TP: ???
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
    local dmgmod = 1.5
    local params_phys = {}
    params_phys.multiplier = dmgmod
    params_phys.tp150 = 1
    params_phys.tp300 = 1
    params_phys.str_wsc = 0.0
    params_phys.dex_wsc = 0.0
    params_phys.vit_wsc = 0.3
    params_phys.agi_wsc = 0.0
    params_phys.int_wsc = 0.0
    params_phys.mnd_wsc = 0.0
    params_phys.chr_wsc = 0.0
    if mob:getPool() == 9064 then -- Imperial Agent Rescue(Assault)
        dmgmod = 1
        local params_phys = {}
        params_phys.multiplier = dmgmod
        params_phys.tp150 = 1
        params_phys.tp300 = 1
        params_phys.str_wsc = 0.0
        params_phys.dex_wsc = 0.0
        params_phys.vit_wsc = 0.3
        params_phys.agi_wsc = 0.0
        params_phys.int_wsc = 0.0
        params_phys.mnd_wsc = 0.0
        params_phys.chr_wsc = 0.0
    end

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_DMG_VARIES, params_phys, 2, 3)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
