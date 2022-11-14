---------------------------------------------
-- Magic Fruit
--
-- Description: Restores HP for the target party member.
-- Type: Magical (Light)
--
--
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
     return MobHealMove(target, skill, 1)
end
