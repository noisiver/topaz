---------------------------------------------
-- Fighter's Roll
--
-- Description: Enhances double attack rate.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.FIGHTERS_ROLL
    local power =  math.random(1,15)
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 300)) 
    return typeEffect
end
