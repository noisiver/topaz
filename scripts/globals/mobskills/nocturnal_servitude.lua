---------------------------------------------
-- Nocturnal Servitude 
-- Description: Conal gaze charm.
-- Notes: Medium charge up time.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()
	if mob:getPool() == 3069 then -- Oupire
		return 1
	end
    if (mobhp <= 25) then
        result = 0
    end

    return result
end

function onMobWeaponSkill(target, mob, skill)

    MobCharmMove(mob, target, skill, 257, 60)
    return 0
end
