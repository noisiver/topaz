---------------------------------------------
-- Fanatic Dance
-- Family: Orc
-- Description: Charms all targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: N/A
-- Range: AoE around user
-- Notes: Dynamis NM Orcs only
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:isInDynamis() and mob:isMobType(MOBTYPE_NOTORIOUS)) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)

    MobCharmMove(mob, target, skill, 0, 60)

    return tpz.effect.CHARM_I
end
