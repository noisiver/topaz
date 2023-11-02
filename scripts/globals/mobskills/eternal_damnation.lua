---------------------------------------------
-- Eternal Damnation
-- Description: Inflicts Doom upon an enemy. Gaze attack.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()
	if mob:getPool() == 3069 or mob:getPool() == 9098 then -- Oupire / Alucard(Vampyr)
		return 0
	end

    if (mobhp < 50) then
        result = 0
    end

    return result
end

function onMobWeaponSkill(target, mob, skill)
local typeEffect = tpz.effect.DOOM
    if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS)
    else
        skill:setMsg(MobGazeMove(mob, target, typeEffect, 10, 3, 30))
    end

    return tpz.effect.DOOM
end
