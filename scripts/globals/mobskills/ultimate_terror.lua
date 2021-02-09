---------------------------------------------
-- Ultimate Terror
--
-- Description: AoE Absorb All with randomness
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    
    if math.random() < 3/7 then
        skill:setMsg(MobDrainAttribute(mob, target, 136, 21, 3, 60))
    end
    
    if math.random() < 3/7 then
        skill:setMsg(MobDrainAttribute(mob, target, 137, 21, 3, 60))
    end

    if math.random() < 3/7 then
        skill:setMsg(MobDrainAttribute(mob, target, 138, 21, 3, 60))
    end

    if math.random() < 3/7 then
        skill:setMsg(MobDrainAttribute(mob, target, 139, 21, 3, 60))
    end

    if math.random() < 3/7 then
        skill:setMsg(MobDrainAttribute(mob, target, 140, 21, 3, 60))
    end

    if math.random() < 3/7 then
        skill:setMsg(MobDrainAttribute(mob, target, 141, 21, 3, 60))
    end

    if math.random() < 3/7 then
        skill:setMsg(MobDrainAttribute(mob, target, 142, 21, 3, 60))
    end
end