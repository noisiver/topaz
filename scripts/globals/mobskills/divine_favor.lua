---------------------------------------------
--  Divine Favor
--
--  Description: Dispels all negative status effects off self.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if utils.hasDispellableEffect(target) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    return MobSelfDispelMove(mob, skill)
end
