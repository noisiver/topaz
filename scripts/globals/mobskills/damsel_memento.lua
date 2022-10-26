---------------------------------------------
-- Benediction
---------------------------------------------
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local maxHeal = target:getMaxHP() * 0.05

    MobSelfDispelMove(mob, skill)
    target:addHP(maxHeal)
    target:wakeUp()

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return maxHeal
end
