---------------------------------------------
--  Hydro Wave
--
--  Description: Inflicts damage. Additional Effect: Removes one piece of equipment.
-- -- Grants the user 1.5k damage magical Stoneskin and Absorbs Water damage buff.
--  Type:  Magical
--
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 10' radial
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/world")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
	if mob:AnimationSub() == 2 then
		return 1
	end
	return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 3
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)

  	target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
	MobEncumberMove(mob, target, 1, 60)
	mob:setMod(tpz.mod.RAMPART_STONESKIN, 1500)
    -- Water absorb
	mob:AnimationSub(2)
	mob:setLocalVar("bubbles", os.time() + 180)
    return dmg
end
