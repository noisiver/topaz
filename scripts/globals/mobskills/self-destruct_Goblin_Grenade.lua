---------------------------------------------------
-- self_destruct_Goblin_Grenade
-- Weapon skill for Goblin Grenades
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local amount = 9999 * skill:getTotalTargets()
    local dmg = MobFinalAdjustments(amount, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.FIRE)
    return dmg
end
