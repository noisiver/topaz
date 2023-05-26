---------------------------------------------
-- Proboscis Shower
-- Description: Restores HP.
-- https://ffxiclopedia.fandom.com/wiki/Iriz_Ima
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
     return MobHealMove(mob, target, skill, 0.33)
end
