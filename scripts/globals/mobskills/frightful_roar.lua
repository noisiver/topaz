---------------------------------------------
-- Frightful Roar
--
-- Description: Weakens defense of enemies within range.
-- Type: Magical (Water)
-- 50%
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 9005) then -- Kong
		local typeEffect = tpz.effect.TERROR
		MobStatusEffectMove(mob, target, tpz.effect.DEFENSE_DOWN, 77, 0, 300)
		skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 10))
    else
		local typeEffect = tpz.effect.DEFENSE_DOWN
		skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 77, 0, 300))
   end
   
   return tpz.effect.DEFENSE_DOWN
end
