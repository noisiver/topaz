---------------------------------------------
--  Viscid Nectar
--
--  Description: Sprays a sticky nectar in a fan-shaped area, inflicting slow.
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Unknown cone
--  Notes: Slow is equivalent to Slow II.
-- Closed mouth only (Aimation Sub 4)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:AnimationSub() == 4 then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SLOW
    local params = {}
    params.overwriteHaste = true

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 10000, 0, 300, params))

    return typeEffect
end
