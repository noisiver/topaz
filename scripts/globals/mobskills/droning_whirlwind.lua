---------------------------------------------------
-- Droning Whirlwind
--
-- Magical (Wind)
-- Conal
-- Additional effect: multiple Dispel.
-- Mob gains 50 Magic Defense
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 9.0
	local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2, tpz.magic.ele.WIND, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    MobDispelMove(mob, target, skill, tpz.magic.ele.WIND, tpz.effectFlag.DISPELABLE)
    MobDispelMove(mob, target, skill, tpz.magic.ele.WIND, tpz.effectFlag.DISPELABLE)
    MobDispelMove(mob, target, skill, tpz.magic.ele.WIND, tpz.effectFlag.DISPELABLE)
    MobBuffMove(mob, tpz.effect.MAGIC_DEF_BOOST, 50, 0, 90)
   return dmg
end