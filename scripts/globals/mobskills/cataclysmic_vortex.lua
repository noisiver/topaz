---------------------------------------------------
--  Cataclysmic Vortex
--
--  Description:  Reduces all targets HP to 1 of its maximum value in a '15 radius. Ignores Utsusemi and resets hate.
--  Type: Magical
--  Notes: Very long charge up time, easy to stun or outrun.
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    target:setHP(1)
    mob:resetEnmity(target)

    return 0
end