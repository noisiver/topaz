---------------------------------------------
-- Frozen Mist
--
-- Description: Additional Effect: Terror 
-- Grants the user 1k damage physical Stoneskin and Absorbs Ice damage buff.
-- Type: Enhancing
--
-- Range: AOE
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/world")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:AnimationSub() == 1 then
		return 1
	end
	return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.TERROR
    local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.ICE, dmgmod, TP_MAB_BONUS)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ICE, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.ICE)
    -- Apply stoneskin to self
    local buffTypeEffect = tpz.effect.STONESKIN
    mob:addStatusEffect(buffTypeEffect, 1000, 0, 300)
    local buffEffect = mob:getStatusEffect(buffTypeEffect)
    buffEffect:unsetFlag(tpz.effectFlag.DISPELABLE)
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 10)
    -- Ice absorb
	mob:AnimationSub(1)
	mob:setLocalVar("icyMist", os.time() + 180)
    return dmg
end
