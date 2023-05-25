---------------------------------------------
-- Exuviation
-- Family: Wamoura
-- Type: Healing and Full status effect cure.
-- Range: Self
-- Notes: Cures all negative effects on the mob and heals an amount for each removed.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if utils.hasDispellableEffect(target) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    --(699 + (Level - 70) * 10) * # of debuffs removed
    local mobHP = target:getHP()
    local mobMaxHP = target:getMaxHP()
    local healAmount = math.floor(699 + (target:getMainLvl() - 70) * 10)
    local weather = getMobWeatherDayBonus(target, 7)
    local effectCount = MobSelfDispelMove(mob, skill)
    -- add number of effects removed
    healAmount = healAmount * effectCount
    -- check for weather procs
    healAmount = healAmount * weather

    if (mobHP+healAmount > mobMaxHP) then
        healAmount = mobMaxHP - mobHP
    end

    target:wakeUp()
    target:addHP(healAmount)
    skill:setMsg(tpz.msg.basic.SKILL_RECOVERS_HP)
end
