---------------------------------------------------
-- Venom Shower
-- Deals Water damage to enemies within an area of effect. Additional effect: Poison
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.POISON
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 3, tpz.magic.ele.WATER, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
    target:delStatusEffect(tpz.effect.POISON)
    MobStatusEffectMove(mob, target, typeEffect, 35, 3, 60)
    local effect1 = target:getStatusEffect(typeEffect)
    if (effect1 ~= nil) then
        effect1:unsetFlag(tpz.effectFlag.WALTZABLE)
    end
    return dmg
end
