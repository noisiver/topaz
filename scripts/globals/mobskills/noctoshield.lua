---------------------------------------------
-- Noctoshield
--
-- Description: Gives the effect of "Phalanx."
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
    local power = 2 + math.floor((mob:getMainLvl() / 10))
    skill:setMsg(MobBuffMove(mob, tpz.effect.PHALANX, power, 0, 300))
    return tpz.effect.PHALANX
end