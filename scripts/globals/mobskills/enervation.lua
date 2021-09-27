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
	if mob:getMainJob() == tpz.job.MNK or mob:getMainJob() == tpz.job.RDM or mob:getMainJob() == tpz.job.RNG or mob:getMainJob() == tpz.job.PUP then
		return 0
	end
    
	return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_DOWN

    local silenced = false
    local blinded = false

    silenced = MobStatusEffectMove(mob, target, tpz.effect.DEFENSE_DOWN, 50, 0, 120)

    blinded = MobStatusEffectMove(mob, target, tpz.effect.MAGIC_DEF_DOWN, 50, 0, 120)

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
