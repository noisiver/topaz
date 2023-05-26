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
    if AnimationSub > 0 and (math.random(1,100) <= 20) then -- 20% chance to use
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
        if (math.random(1,100) <= 10) then -- ~10% chance to restore a gear on use
            mob:AnimationSub(1)
            skill:setMsg(tpz.msg.basic.SELF_HEAL)
            mob:setLocalVar("GearNumber", 2)
        end
        return MobHealMove(mob, target, skill, 0.75) -- 1 Gears
    end
    if AnimationSub == 1 then
        if (math.random(1,100) <= 10) then -- ~10% chance to restore a gear on use
            mob:AnimationSub(0)
            skill:setMsg(tpz.msg.basic.SELF_HEAL)
            mob:setLocalVar("GearNumber", 3)
        end
        return MobHealMove(mob, target, skill, 1)
    end
    skill:setMsg(tpz.msg.basic.SELF_HEAL)
    mob:setLocalVar("GearNumber", 3)
    return MobHealMove(mob, target, skill, 1)
end
