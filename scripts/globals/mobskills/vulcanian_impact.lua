---------------------------------------------
--  Vulcanian Impact
--
--  Description: Single-target magic attack. Ignores shadows
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores Shadows
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if (mob:getPool() == 3339) then -- Reacton
        return 0
    end
	if (mob:getPool() == 1426) or (mob:getPool() == 416) or (mob:getPool() == 6587) and mob:AnimationSub() >= 2
    or (mob:getPool() == 9057) and mob:AnimationSub() >= 2 then 
		return 0
	else
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    return dmg
end
