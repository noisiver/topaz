---------------------------------------------
-- Orcish Counterstance
-- Used only by Orcs in Wings of the Goddess Areas.
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
    local power = 75
    local duration = 60
    local typeEffect = tpz.effect.COUNTERSTANCE

    if (mob:getPool() == 3075) then -- Overlord Bakgodek
        power = 40
        duration = 30
    end

    skill:setMsg(MobBuffMove(mob, typeEffect, 75, 0, 60))

    return typeEffect
end
