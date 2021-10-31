---------------------------------------------
-- Frozen Mist
--
-- Description: Additional Effect: Dispel + Terror + Grants the user Physical Shield.
-- Type: Enhancing
--
-- Range: AOE
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
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
    local typeEffect = tpz.effect.TERROR
    -- addEx to pervent dispel
    mob:addStatusEffectEx(tpz.effect.PHYSICAL_SHIELD, 0, 1, 0, 60)
    skill:setMsg(tpz.msg.basic.SKILL_GAIN_EFFECT)
	MobStatusEffectMove(mob, target, typeEffect, 1, 0, 10)
	MobEncumberMove(target, math.random(1, 3), 60)
	target:dispelStatusEffect()
	if (mob:getPool() == 6737) then --Scylla
	    local typeEffect = tpz.effect.PROWESS
		local power = 10
		mob:addStatusEffectEx(tpz.effect.COLURE_ACTIVE, tpz.effect.COLURE_ACTIVE, 13, 3, 60, tpz.effect.PARALYSIS, 1, tpz.auraTarget.ENEMIES, tpz.effectFlag.AURA)
		mob:addStatusEffectEx(tpz.effect.HUMANOID_KILLER, 0, 10, 0, 30)	
	end

    return tpz.effect.PHYSICAL_SHIELD
end
