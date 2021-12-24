---------------------------------------------
-- Frog Song
--
-- Description: AOE Charm
-- Type: Enhancing
-- Utsusemi/Blink absorb: Ignore
-- Range: Melee
-- Notes: 
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)

    MobCharmMove(mob, target, skill, 2239, 60)

    return tpz.effect.CHARM_I
end
