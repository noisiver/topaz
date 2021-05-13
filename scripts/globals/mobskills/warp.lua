---------------------------------------------
-- Test Your Mite(ENM)
-- Pasuk teleport behind target
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
    local battletarget = mob:getTarget()
    local t = battletarget:getPos()
    t.rot = battletarget:getRotPos()
    local angle = math.random() * math.pi
    local pos = Behind()
    mob:teleport(pos, battletarget)
    skill:setMsg(tpz.msg.basic.NONE)
    mob:setTP(3000)
    return 0
end
