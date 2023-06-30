---------------------------------------------
-- Sonic Wave (Nightmare)
-- Reduces defense of enemies in an area of effect.
-- -100% Defense Down
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_DOWN
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 80, 0, 300))

    return typeEffect
end
