---------------------------------------------
--  Magic Hammer
--
--  Description: Steals an amount of enemy's MP equal to damage dealt. Ineffective against undead.
--  Type: Magical (Light)
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 0.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.LIGHT, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_IGNORE_SHADOWS)
  	if dmg > 300 then dmg = 300 end 
	
	if (target:getMP() > dmg) then
		mob:addMP(dmg)
		target:delMP(dmg)
	else
		dmg = target:getMP()
		mob:addMP(dmg)
		target:delMP(dmg)
	end
	
        MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_MP, dmg)

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
    return dmg
end
