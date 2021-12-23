---------------------------------------------------
-- Snort Autoattack
-- Used by Geush Urvan
-- Deals wind damage. UgnoreS shadows and cause a slight knockback, which temporarily stuns the target.
-- Can do more than 1,000 damage per melee hit.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
	local CurrentTP = mob:getTP()
	mob:setLocalVar("TP", CurrentTP)
		return 0
end

function onMobWeaponSkill(target, mob, skill)
    local accmod = 1
    local dmgmod = 2.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)

    local typeEffect = tpz.effect.STUN

	local CurrentTP = mob:getLocalVar("TP")
	local AddTP = CurrentTP + 100

    target:addTP(20)
    mob:addTP(AddTP)

	
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 3)
    return dmg
end
