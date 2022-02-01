---------------------------------------------
-- Rotten Stench
--
-- Description: Inflicts Magic Accuracy Down + Accuracy Down. Ignores shadows.
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.MAGIC_ACC_DOWN
	local typeEffectTwo = tpz.effect.ACCURACY_DOWN
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 300))
	MobStatusEffectMove(mob, target, typeEffectTwo, 25, 0, 300)
    return typeEffect
end
