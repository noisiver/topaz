---------------------------------------------
-- Synergism
--
-- Description:
-- Devours a nearby Pudding to recover 25% of max HP.
-- Used by Dextrose.
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
    return MobPercentHealMove(mob, target, skill, 0.25)
end
