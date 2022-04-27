---------------------------------------------
-- Xenoglossia
--
-- Description: Gains Fast Cast.
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
    local typeEffect = tpz.effect.UFASTCAST
    local power = 75
    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 300)) 
    return typeEffect
end
