---------------------------------------------
-- Particle Shield
--
-- Description: Enhances defense.
-- Type: Magical
-- Notes: Ultima only.
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local mobhp = mob:getHPP()
	if mob:hasStatusEffect(tpz.effect.DEFENSE_BOOST) and mobhp > 20 then
		return 1
	end

	if mob:getPool() == 4083 then -- Ultima COP Mission
		if mobhp > 70 or mobhp <= 40 then
			return 0
		else
			return 1
		end
	end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_BOOST

    skill:setMsg(MobBuffMove(mob, typeEffect, 50, 0, 300))
    return typeEffect
end
