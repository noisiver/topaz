---------------------------------------------
-- Enervation
--
-- Description: Lowers the defense and magical defense of enemies within range.
-- Type: Magical (Dark)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_DOWN

    local silenced = false
    local blinded = false

    silenced = MobStatusEffectMove(mob, target, tpz.effect.DEFENSE_DOWN, 40, 0, 300)

    blinded = MobStatusEffectMove(mob, target, tpz.effect.MAGIC_DEF_DOWN, 40, 0, 300)

    skill:setMsg(tpz.msg.basic.SKILL_ENFEEB_IS)

    -- display silenced first, else blind
    if (silenced == tpz.msg.basic.SKILL_ENFEEB_IS) then
        typeEffect = tpz.effect.DEFENSE_DOWN
    elseif (blinded == tpz.msg.basic.SKILL_ENFEEB_IS) then
        typeEffect = tpz.effect.MAGIC_DEF_DOWN
    else
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
    end

    return typeEffect
end
