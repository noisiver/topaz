---------------------------------------------
-- Spring Water
--
-- Description: restores hit points and cures some status ailments.
-- Type: Magical (Water)
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
     return MobHealMove(mob, target, skill, 1)
end
