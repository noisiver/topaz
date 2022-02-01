---------------------------------------------
-- Boiling Point
--
-- Description: Reduces magic defense in a fan-shaped area of effect.
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
    local typeEffect = tpz.effect.MAGIC_DEF_DOWN
     MobStatusEffectMove(mob, target, typeEffect, 50, 0, 300)
	skill:setMsg(tpz.msg.basic.SKILL_ENFEEB)
    return typeEffect
end
