---------------------------------------------
--  Hydro Wave
--
--  Description: Inflicts damage. Additional Effect: Removes one piece of equipment + Grants the user Absorb Element: Water shield.
--  Type:  Magical
--
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 10' radial
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/world")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	if (mob:getPool() == 6737) then
		return 0
	end
	if mob:getWeather() == tpz.weather.SNOW or mob:getWeather() == tpz.weather.BLIZZARDS then
		return 0
	end
	return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)
	local SSpower = 1000
	
  	target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
	MobEncumberMove(target, 1, 60)
	target:setMod(tpz.mod.RAMPART_STONESKIN, SSpower)
	if (mob:getPool() == 6737) then --Scylla
	    local typeEffect = tpz.effect.PROWESS
		local power = 10
		mob:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 60, tpz.effect.SILENCE, 1, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
		mob:addStatusEffectEx(tpz.effect.HUMANOID_KILLER, 0, 10, 0, 30)	
	end
    return dmg
end
