---------------------------------------------
--  Rushing Drub
--
--  Description: Delivers a fourfold attack on a single target.
--  Type: Physical
--  Utsusemi/Blink absorb: 4 shadows
--  Range: Melee
--  Notes: Only used by Mamool Ja with staves.
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if (mob:getFamily() == 176 or mob:getFamily() == 177 or or mob:getFamily() == 285) and mob:getPool() ~= 2526 or mob:getPool() ~= 2533 or mob:getPool() ~= 2534
	or mob:getPool() ~= 2516 or mob:getPool() ~= 2507 or mob:getPool() ~= 2528 then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 4
    local accmod = 1
    local dmgmod = 1
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
