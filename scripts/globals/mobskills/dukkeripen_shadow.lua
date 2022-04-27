---------------------------------------------
-- Dukkeripen
-- adds 10 shadows
-- Type: Magical
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getPool() == 1272 then -- Experimental Lamia
        return 0
    end
    if mob:getMainJob() == tpz.job.COR then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)

    skill:setMsg(MobBuffMove(mob, tpz.effect.BLINK, 10, 0, 300))

    return tpz.effect.BLINK
end
