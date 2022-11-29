---------------------------------------------
-- Snort
--
-- Deals Wind damage to targets in a fan-shaped area of effect. Additional effect: Hate reset
-- Type: Magical (Wind)
-- Notes: Only used by Apis, Chichevache and Audumbla, Audumbla's version increases in damage as it's HP decreases.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getPool() == 196 or mob:getPool() == 284 then -- Chichevache NYI
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.10, 1, tpz.magic.ele.WIND, 500)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.WIND)
    mob:resetEnmity(target)
    return dmg
end
