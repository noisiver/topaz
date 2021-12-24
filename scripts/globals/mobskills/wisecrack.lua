---------------------------------------------
-- Wisecrack
-- Description: Inflicts AOE charm
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    MobCharmMove(mob, target, skill, 0, 60)

    return tpz.effect.CHARM_I
end
