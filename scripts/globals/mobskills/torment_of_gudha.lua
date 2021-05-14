---------------------------------------------
--  Torment of Gu'Dha
--
--  Description: Deals physical damage to enemies within area of effect. Additonal Efect: Knockback and petrification.
--  Type: Physical
--  Utsusemi/Blink absorb:3 shadows
--  Range: 15' radial
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
    local numhits = 1
    local accmod = 1
    local dmgmod = 3
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.PETRIFICATION
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if dmg > 0 then target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
