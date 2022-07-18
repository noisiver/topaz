---------------------------------------------
--  Extremely Bad Breath
--  Description: Instant KO. ~10 yalm radius AOE.
--  Utsusemi/Blink absorb: Ignores shadows.
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobDeathMove(mob, target, skill)
    return 0
end
