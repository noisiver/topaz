---------------------------------------------
-- Rage
--
-- Description: The Ram goes berserk
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: 45% Attack UP, -59% defense DOWN
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
    local typeEffect = tpz.effect.BERSERK
    local duration = 180
    local power = 45
    local tick = 0
    local duration = 120
    local subpower = 59

    skill:setMsg(MobBuffMoveSub(mob, typeEffect, power, tick, duration, 0, subpower, 0))
    tpz.pet.handleJugBuffs(target, mob, skill, typeEffect, power, tick, duration, subid, subpower, tier)

    if mob:getPool() == 6850 then -- Tammuz
        MobBuffMove(mob, tpz.effect.HASTE, 5000, 0, 180)
    end

    return typeEffect
end
