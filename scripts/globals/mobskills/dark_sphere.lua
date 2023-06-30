---------------------------------------------------
-- Dark Sphere
-- Deals Dark damage to targets in a fan-shaped area of effect. Additional effect: Blind
-- Range: 15' cone
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 9004) then -- The Big One
        dmgmod = 3
		local typeEffectTwo = tpz.effect.MAGIC_ATK_DOWN
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffectTwo, 24, 0, 30)
		local typeEffectTwo = tpz.effect.MAGIC_ACC_DOWN
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffectThree, 20, 0, 30)
		local typeEffectFour = tpz.effect.INT_DOWN
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffectFour, 20, 0, 30)
		local typeEffectFive = tpz.effect.MND_DOWN
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffectFive, 20, 0, 30)
        target:setTP(0)
    else
    local typeEffect = tpz.effect.BLINDNESS

    MobStatusEffectMove(mob, target, typeEffect, 20, 0, 300)
    end

    local dmgmod = 3.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_1_SHADOW)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    return dmg
end
