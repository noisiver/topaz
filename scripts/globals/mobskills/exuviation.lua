---------------------------------------------
-- Exuviation
-- Family: Wamoura
-- Type: Healing and Full status effect cure.
-- Range: Self
-- Notes: Cures all negative effects on the mob and heals an amount for each removed.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if utils.hasDispellableEffect(target) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local effectCount = MobSelfDispelMove(mob, skill)

    return MobHealMove(target, skill, effectCount +1)
end
