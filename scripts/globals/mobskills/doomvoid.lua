
---------------------------------------------
--  Description: Teleports all alliance members within 25' distance of itself into another zone to fight
-- 	a high level, shaworeign version, HNM for 60 mins.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, player, mob, skill, csid)
end