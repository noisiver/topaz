---------------------------------------------
-- Metalid Body
--
-- Gives the effect of "Stoneskin."
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
    local power = 25 

    if (mob:isNM()) then
        power = math.floor((25 + (mob:getMainLvl() / 1)) * 2)
    elseif mob:isPet() then
        power = math.floor(mob:getMaxHP() * 0.10)
    end

    skill:setMsg(MobBuffMove(mob, tpz.effect.STONESKIN, power, 0, 300))
    return tpz.effect.STONESKIN
end
