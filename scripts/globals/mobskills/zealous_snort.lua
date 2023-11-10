---------------------------------------------
-- Zealous Snort
-- 25% Haste, +25 MDB, and increases the likelihood of both countering and guarding.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.HASTE
    local power = 25
    local tick = 0
    local duration = 60


    MobBuffMoveSub(target, tpz.effect.MAGIC_DEF_BOOST, power, tick, duration)
    MobBuffMoveSub(target, tpz.effect.COUNTER_BOOST, power, tick, duration)
    MobBuffMoveSub(target, tpz.effect.GUARD_BOOST, power, tick, duration)
    skill:setMsg(MobBuffMove(target, typeEffect, power, tick, duration))

    return typeEffect
end
