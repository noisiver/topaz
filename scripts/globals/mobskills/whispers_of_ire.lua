---------------------------------------------
-- Whispers of Ire
-- Randomly absorbs 1 to 7 attributes from target.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
	skill:setMsg(DrainMultipleAttributes(mob, target, 10, 3, math.random(1, 7), 120))

    return 1
end
