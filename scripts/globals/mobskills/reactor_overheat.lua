---------------------------------------------
--  Reactor Overheat
--  Zedi, while in Animation form 3 (Rings)
--  Fire damage, ignores shadows. Addtional effect Plague on hit.
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:AnimationSub() ~= 3) then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
  local typeEffect = tpz.effect.PLAGUE
  local dmgmod = 2.0
  local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
  local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
  target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
  MobStatusEffectMove(mob, target, typeEffect, 5, 3, 90)

  return dmg
end
