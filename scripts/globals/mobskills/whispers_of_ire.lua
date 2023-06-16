---------------------------------------------
-- Whispers of Ire
-- Randomly absorbs 1 to 7 attributes from target.
-- Notes: When used by Blighting Brand, erases all debuffs on self.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local blightningBrand = mob:getPool() == 5730
    if blightningBrand then
        utils.FullSelfEraseNa(mob)
    end
    return DrainMultipleAttributesPhysical(mob, target, skill, 14, 60, math.random(1, 7), 300)
end
