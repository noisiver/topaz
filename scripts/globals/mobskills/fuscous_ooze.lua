---------------------------------------------------
--  Fuscous Ooze
--  Family: Slugs
--  Description: A dusky slime inflicts encumberance and weight.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Cone
--  Notes:
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.WEIGHT
    local duration = 45

    MobStatusEffectMove(mob, target, typeEffect, 50, 0, duration)

    local dmgmod = 1.5
    local baseDamage = mob:getWeaponDmg()*3
    local info = MobMagicalMove(mob, target, skill, baseDamage, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
	
    for i = tpz.slot.MAIN, tpz.slot.BACK do
        target:unequipItem(i)
    end
    target:addStatusEffectEx(tpz.effect.ENCUMBRANCE_I, tpz.effect.ENCUMBRANCE_I, 0xFFFF, 0, 30)
	
    return dmg
end
