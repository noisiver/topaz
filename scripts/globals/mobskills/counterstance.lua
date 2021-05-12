---------------------------------------------
--  Counterstance
-- 
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
    local power = 90
    local duration = 10
    local typeEffect = tpz.effect.COUNTERSTANCE

    -- if ( Conquerer Bakgodek ) then
        -- power = 50? He's not implemented yet anyway :P
    -- end
    MobBuffMove(mob, tpz.effect.ACCURACY_BOOST, 100, 0, 10)
    MobBuffMove(mob, tpz.effect.DEFENSE_DOWN, 100, 0, 10)

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration))

    return typeEffect
end
