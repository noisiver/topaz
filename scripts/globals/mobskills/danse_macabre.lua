---------------------------------------------
-- Danse Macabre
-- Family: Corse
-- Description: Charms a single target.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: N/A
-- Range: Single target
-- Notes:
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

    MobCharmMove(mob, target, skill, 0, 120)

    return tpz.effect.CHARM_I
end