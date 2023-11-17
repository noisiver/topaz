---------------------------------------------
-- Cackle
--
-- Description: Inflicts Magic Attack Down + Magic Defense Down + Magic Accuracy Down.
-- Type: Enfeebling
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- Normal Dvegr for learning  Bilgestorm
    if (mob:getPool() == 9124) then
        return 0
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.MAGIC_ATK_DOWN

    MobStatusEffectMove(mob, target, tpz.effect.MAGIC_ATK_DOWN, 50, 0, 300)
	MobStatusEffectMove(mob, target, tpz.effect.MAGIC_DEF_DOWN, 50, 0, 300)
	skill:setMsg(MobStatusEffectMove(mob, target, tpz.effect.MAGIC_ACC_DOWN, 50, 0, 300))

	return typeEffect
end
