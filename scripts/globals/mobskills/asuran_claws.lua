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
        dmgmod = 0.9
    elseif moon > 60 then
        dmgmod = 0.8
    elseif moon > 40 then
        dmgmod = 0.7
    elseif moon > 25 then
        dmgmod = 0.6
    elseif moon > 10 then
        dmgmod = 0.5
    else
        dmgmod = 0.4
    end	

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
