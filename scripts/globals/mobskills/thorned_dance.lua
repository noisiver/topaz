---------------------------------------------
-- thorned_dance
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SABER_DANCE
    local power = 50
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 300)) 
    
	return typeEffect
end
