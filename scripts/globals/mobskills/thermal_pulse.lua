---------------------------------------------
--  Thermal Pulse
--  Family: Wamouracampa
--  Description: Deals Fire damage to enemies within area of effect. Additional effect: Blindness
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadow
--  Range: 12.5
--  Notes: Open form only.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:AnimationSub() ~=0) then
        return 1
    else
        return 0
    end
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BLINDNESS
    local dmgmod = 4.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    MobStatusEffectMove(mob, target, typeEffect, 100, 0, 300)
    return dmg
end
