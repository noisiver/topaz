---------------------------------------------
-- sensual_dance
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.REGAIN
    local power = 25
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 3, 300)) 
    
	return typeEffect
end
