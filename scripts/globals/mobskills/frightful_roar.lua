---------------------------------------------
-- Frightful Roar
--
-- Description: Weakens defense of enemies within range.
-- Type: Magical (Water)
-- 25%
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 6169) then -- Kong
		local typeEffectThree = tpz.effect.TERROR
		MobStatusEffectMove(mob, target, typeEffect, 1, 0, 10)
    else
    local typeEffect = tpz.effect.DEFENSE_DOWN
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 180))
    end
    return tpz.effect.DEFENSE_DOWN
end
