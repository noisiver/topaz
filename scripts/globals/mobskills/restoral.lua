---------------------------------------------
-- Restoral
-- Description: Restores HP.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getFamily() == 119 then -- Single Gear
        return 0
    end
    local AnimationSub = mob:AnimationSub()
    if AnimationSub > 0 then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    -- Regrows a gear on use
    -- Each remaining gear doubles the amount healed when used.
    local AnimationSub = mob:AnimationSub()
    if AnimationSub == 2 then
        mob:AnimationSub(1)
        skill:setMsg(tpz.msg.basic.SELF_HEAL)
        mob:setLocalVar("GearNumber", 2)
        return MobHealMove(mob, math.floor(mob:getMaxHP()/26)) -- 1 Gears
    end
    if AnimationSub == 1 then
        mob:AnimationSub(0)
        skill:setMsg(tpz.msg.basic.SELF_HEAL)
        mob:setLocalVar("GearNumber", 3)
        return MobHealMove(mob, math.floor(mob:getMaxHP()/13)) -- 2 Gears
    end
    skill:setMsg(tpz.msg.basic.SELF_HEAL)
    mob:setLocalVar("GearNumber", 3)
    return MobHealMove(mob, math.floor(mob:getMaxHP()/13)) -- Single Gear
end
