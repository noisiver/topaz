---------------------------------------------
-- Healing Breeze
--
-- Description: Restores HP for party members within area of effect.
-- Type: Magical (Wind)
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
     return MobPercentHealMove(mob, target, skill, 0.16)
end
