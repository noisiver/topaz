---------------------------------------------
-- Momento Mori
--
-- Description: Boosts magic attack(Stacks)
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
    local power = 30
    local duration = 90 -- buffed from 60

    local typeEffect = tpz.effect.MAGIC_ATK_BOOST  

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))
    return typeEffect
end
