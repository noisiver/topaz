---------------------------------------------
-- Spring Water
--
-- Description: restores hit points and cures some status ailments.
-- Type: Magical (Water)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onMobWeaponSkill(target, mob, skill)
     return MobHealMove(target, skill, 1)
end
