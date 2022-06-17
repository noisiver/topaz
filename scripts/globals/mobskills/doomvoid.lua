
---------------------------------------------
--  Description: Teleports all alliance members within 25' distance of itself into another zone to fight
-- 	a high level, shaworeign version, HNM for 60 mins.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getPool() ~= 3448) then -- Sandworm only
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, player, mob, skill, csid)
end