---------------------------------------------
-- Bai Wing
--
-- Description: A dust storm deals Earth damage to enemies within a very wide area of effect. Additional effect: Slow
-- Type: Magical
-- Utsusemi/Blink absorb: Wipes shadows
-- Range: 30' radial.
-- Notes: Used only by Ouryu and Cuelebre while flying.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:AnimationSub() ~= 1 then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local params = {}
    params.overwriteSlow = true

    local dmgmod = 4.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
    MobStatusEffectMove(mob, target, tpz.effect.SLOW, 9000, 0, 300, params)
    return dmg
end
