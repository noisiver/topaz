---------------------------------------------------
-- Asuran Claws
-- Gnole Mobs, only used when standing
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- animsub 1= standing, animsub 0 = all fours
    if (mob:AnimationSub() == 0) then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 8
    local accmod = 1
    local dmgmod = 0

    local moon = VanadielMoonPhase()
    if moon > 90 then -- Full Moon
        dmgmod = 1
    elseif moon > 75 then
        dmgmod = 0.95
    elseif moon > 60 then
        dmgmod = 0.9
    elseif moon > 40 then
        dmgmod = 0.85
    elseif moon > 25 then
        dmgmod = 0.75
    elseif moon > 10 then
        dmgmod = 0.65
    else
        dmgmod = 0.65
    end

    local params_phys = {}
    params_phys.multiplier = dmgmod
    params_phys.tp150 = 1
    params_phys.tp300 = 1
    params_phys.str_wsc = 0.1
    params_phys.dex_wsc = 0.1
    params_phys.vit_wsc = 0.0
    params_phys.agi_wsc = 0.0
    params_phys.int_wsc = 0.0
    params_phys.mnd_wsc = 0.0
    params_phys.chr_wsc = 0.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, params_phys)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
