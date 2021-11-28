---------------------------------------------
-- Whispers of Ire
-- Randomly absorbs 1 to 7 attributes from target.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:getPool() == 4105 then
		return 0
	end
	return 1
end

function onMobWeaponSkill(target, mob, skill)
    skill:setMsg(MobDrainStatusEffectMove(mob, target))

    return 1
end
