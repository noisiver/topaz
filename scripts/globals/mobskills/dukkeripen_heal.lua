---------------------------------------------
-- Dukkeripen
-- Self healing move
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

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return MobHealMove(mob, math.random(400, 700))
end
