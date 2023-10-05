---------------------------------------------
-- Activate
-- Call automaton.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:hasPet() or mob:getPet() == nil) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local pet = GetMobByID(mob:getID() +1)
    local mobX = mob:getXPos()
    local mobY = mob:getYPos()
    local mobZ = mob:getZPos()
    pet:spawn()
    pet:setPos(mob:getXPos() + math.random(1, 3), mob:getYPos(), mob:getZPos() + math.random(1, 3))
    skill:setMsg(tpz.msg.basic.NONE)

    return 0
end
