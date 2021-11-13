---------------------------------------------
--  Memory Of FIRE
--
--  Description: Deals FIRE damage.
--  Type: Magical (FIRE)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	if mob:getMod(tpz.mod.SDT_FIRE) < 10 and mob:getMod(tpz.mod.SDT_ICE) < 10 then
		return 0
	end
	return 1
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 1.5
    local accmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    return dmg
end
