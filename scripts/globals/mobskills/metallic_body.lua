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
    local power = 25 -- ffxiclopedia claims its always 25 on the crabs page. Tested on wootzshell in mt zhayolm..

    if (mob:isNM()) then
        power = (25 + (mob:getMainLvl() / 1)) * 2
    end

    skill:setMsg(MobBuffMove(mob, tpz.effect.STONESKIN, power, 0, 300))
    return tpz.effect.STONESKIN
end
