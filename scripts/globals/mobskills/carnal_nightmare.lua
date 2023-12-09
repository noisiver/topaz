---------------------------------------------
-- Cernal Nightmare
--
-- Description: TP reset
-- Only -50% for pets
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local reset = 0
    local targetTP = target:getTP()
    if target:isPet() then
        reset = math.floor(target:getTP() / 2)
        targetTP = reset
    end
    if (target:getTP() == 0) then
        skill:setMsg(tpz.msg.basic.SKILL_MISS) -- no effect
    else
        target:setTP(reset)
        skill:setMsg(tpz.msg.basic.TP_REDUCED)
    end
    return targetTP
end
