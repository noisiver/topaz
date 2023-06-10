---------------------------------------------
-- Catharsis
-- Description: Restores HP.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/zone")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (target:getCurrentRegion() == tpz.region.TAVNAZIANARCH) then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
     return MobPercentHealMove(mob, target, skill, 0.125)
end
