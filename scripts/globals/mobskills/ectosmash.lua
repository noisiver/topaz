---------------------------------------------
--  Ectosmash
--
--  Description: Teleports in to smack a single target
--  Type: Ranged
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Unknown
--  Notes: Mob is still set to same spot for attacks and abilities that deal with monster position, such as Sneak Attack and Cover. Monster will always return to this starting position after.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.BLUNT, info.hitslanded)
    if (mob:getPool() == 9004) then -- The Big One
        dmgmod = 0.1
		local typeEffect = tpz.effect.WEAKNESS
		MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30)
        local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.BLUNT, MOBPARAM_IGNORE_SHADOWS)
     end
    target:takeDamage(dmg, mob, tpz.attackType.RANGED, tpz.damageType.BLUNT)
	 if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, 1) end
    return dmg
end
