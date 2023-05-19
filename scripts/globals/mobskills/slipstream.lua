---------------------------------------------
--  Slipstream
--
--  Description: AoE Accuracy Down
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 15' radial
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.ACCURACY_DOWN
	skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 300))
	
	return typeEffect
end
