---------------------------------------------
--  Vorticose Sands
--
--  Description: Deals severe Wind damage to enemies within an area of effect. Additional effect: Silence and equipment strip.
--  Type:  Magical
--
--  Notes: Long charge up time, easily stunnable.
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 30' radial
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()

    if (mobhp <= 25) then
        result = 0
    end

    return result
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SILENCE

    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 300)

	MobEncumberMove(target, 5, 60)
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*6, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    return dmg
end
