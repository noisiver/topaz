---------------------------------------------
--  Veil of Chaos
--
--  Description: Deals severe Light damage to enemies within an area of effect. Additional effect: Huge knockback and Amnesia.
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
    local brradhodTheBloodBathedCrown = mob:getPool() == 456

    if (mobhp <= 25) then
        result = 0
    end

    if brradhodTheBloodBathedCrown then
        result = 0
    end

    return result
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.AMNESIA

    local dmgmod = 7
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*6, tpz.magic.ele.LIGHT, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 60)
    return dmg
end
