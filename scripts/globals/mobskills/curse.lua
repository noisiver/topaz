---------------------------------------------
-- Curse
--
-- Description: Inflicts a curse on all targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: 15' radial
-- Notes: Curse has a very long duration.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 9004) then -- The Big One
        if target:hasStatusEffect(tpz.effect.FEALTY) then
            skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
        else
            local typeEffect = tpz.effect.CURSE_II -- Zombie

            skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 20))
        end
    elseif (mob:getPool() == 160) or (mob:getPool() == 3612) or (mob:getPool() == 3227) or (mob:getPool() == 2588) then -- Celery BCNM Ghosts
        local typeEffect = tpz.effect.CURSE_I

        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 7200))
	else
		local typeEffect = tpz.effect.CURSE_I

        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 600))
    end

    return tpz.effect.CURSE_I
end
