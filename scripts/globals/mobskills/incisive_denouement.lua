---------------------------------------------------
-- Incisive Denouement
--
-- Magical (Wind)
-- Single target
-- Additional effect: Enmity reset, all stats down.
-- Sets target HP to 5%.
-- Only used below 50% HP.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() < 50) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local hpp = 0.95
    local dmg = MobThroatStabMove(mob, target, skill, hpp, tpz.attackType.MAGICAL, tpz.damageType.WIND ,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    MobAllStatDownMove(mob, target, 21, 120)
    mob:resetEnmity(target)
    return dmg
end