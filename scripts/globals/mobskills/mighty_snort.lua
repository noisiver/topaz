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
    local dmgmod = 4
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    return dmg
end

