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
    local dmgmod = 3.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    if dmg > 0 then
	    target:setTP(0)
    end
    
	return dmg
end
