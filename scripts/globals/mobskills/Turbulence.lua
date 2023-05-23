---------------------------------------------------
-- Turbulence
-- Deals wind damage to enemies within range. 
-- Area of Effect is centered around caster.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.0
	
	if (mob:getFamily() == 72) then 
		dmgmod = 2
	end
    
	local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2, tpz.magic.ele.WIND, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
   
   return dmg
end
