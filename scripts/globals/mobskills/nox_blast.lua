---------------------------------------------
-- Nox Blast
--
-- Description: Darkness Damage and Knockback + TP reduction. Removes shadows.
-- Type: Magical (Dark)
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- animsub 1= standing, animsub 0 = all fours
    if (mob:AnimationSub() == 0) then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 0

    local moon = VanadielMoonPhase()
	local moonpower = 0
    if moon > 90 then -- Full Moon
        dmgmod = 1.5
		moonpower = 300
    elseif moon > 75 then
        dmgmod = 1.4
		moonpower = 250
    elseif moon > 60 then
        dmgmod = 1.2
		moonpower = 200
    elseif moon > 40 then
        dmgmod = 1.0
		moonpower = 150
    elseif moon > 25 then
        dmgmod = 0.7
		moonpower = 125
    elseif moon > 10 then
        dmgmod = 0.6
		moonpower = 100
    else
        dmgmod = 0.5
		moonpower = 75
    end
	
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
	target:delTP(moonpower)
    
	return dmg
end
