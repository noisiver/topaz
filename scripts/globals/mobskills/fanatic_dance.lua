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
    local falsespinner = mob:getPool() == 1293

    if falsespinner then
        return 0
    end
    if (mob:isInDynamis() and mob:isNM()) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)

    MobCharmMove(mob, target, skill, 0, 60)

    return tpz.effect.CHARM_I
end
