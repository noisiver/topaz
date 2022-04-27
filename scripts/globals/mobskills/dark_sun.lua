---------------------------------------------------
-- Dark Sun
-- Deals light elemental damage to enemies within area of effect. Additional effect: Attack, Defense, Accuracy, Evasion down.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 1.5

    if mob:getPool() == 5763 then -- Marquis Sabnock
        dmgmod = 0.5
    end

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.LIGHT, dmgmod, TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)

    if mob:getPool() == 5763 then -- Marquis Sabnock
        MobStatusEffectMove(mob, target, tpz.effect.ATTACK_DOWN, 50, 0, 300)
        MobStatusEffectMove(mob, target, tpz.effect.DEFENSE_DOWN, 50, 0, 300)
        MobStatusEffectMove(mob, target, tpz.effect.ACCURACY_DOWN, 50, 0, 300)
        MobStatusEffectMove(mob, target, tpz.effect.EVASION_DOWN, 50, 0, 300)
    end

    return dmg
end
