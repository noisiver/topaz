---------------------------------------------
-- Bionic Boost
-- Bugbear
-- Gain counterstance
-- Certain NMs may have a higher power version of the tpz.effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/zone")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local power = 50
    local duration = 60
    local typeEffect = tpz.effect.COUNTERSTANCE

    -- if ( Conquerer Bakgodek ) then
        -- power = 50? He's not implemented yet anyway :P
    -- end

    skill:setMsg(MobBuffMove(mob, typeEffect, 50, 0, 60))

    return typeEffect
end
