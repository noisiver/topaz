---------------------------------------------
--  Memory Of WIND
--
--  Description: Deals WIND damage.
--  Type: Magical (WIND)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	if mob:getMod(tpz.mod.SDT_WIND) < 10 and mob:getMod(tpz.mod.SDT_EARTH) < 10 then
		return 0
	end
	return 1
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 3.0
    local accmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    return dmg
end
