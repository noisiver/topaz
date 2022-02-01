---------------------------------------------
-- Ululation
-- Paralyzes all enemies in an area of effect.
--
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PARALYSIS

   skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 50, 0, 300))

    return typeEffect
end
