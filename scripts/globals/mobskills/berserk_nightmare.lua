---------------------------------------------
-- Berserk (Nightmare)
-- Berserk Ability.
-- 100%
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BERSERK
    skill:setMsg(MobBuffMoveSub(mob, typeEffect, 100, 0, 120, 0, 25, 0))
    local effect = mob:getStatusEffect(typeEffect)
    effect:unsetFlag(tpz.effectFlag.DISPELABLE)

    return typeEffect
end
