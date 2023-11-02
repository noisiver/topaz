---------------------------------------------
-- Belly Dance
--
-- Description: Charms all targets in an area of effect, that are facing the Lamia.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 15' radial
-- Notes: Used only by Lamia NM's, particularly in Besieged.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:isNM()) then
        return 0
    end
    return 1
end


function onMobWeaponSkill(target, mob, skill)

    if (target:isFacing(mob)) then
        MobCharmMove(mob, target, skill, 0, 120)
        return tpz.effect.CHARM_I
    else
        return skill:setMsg(tpz.msg.basic.EVADES)
    end
    return 0
end
