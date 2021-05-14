---------------------------------------------
-- Parry
-- Enhances defense.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.DEFENSE_BOOST
    local power = 25

    if (mob:getPool() == 4072) then -- Tzee Xicu the Manifest 
        power = 100
    end

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, 300)) -- buffed from 15%
    return typeEffect
end
