---------------------------------------------
--  Triclip
--
--  Description: Deals damage in a threefold attack. Additional effect: DEX Down
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows
--  Range: Melee
--  Notes:
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 3
    local accmod = 1
    local dmgmod = 1
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)
    
	local typeEffect = tpz.effect.DEX_DOWN
    local power = (target:getStat(tpz.mod.DEX) * 0.2) + 5
	local tick = 3
	local duration = 300
		
	if (mob:getPool() == 5556) then -- Tikbalang 
		local typeEffect = tpz.effect.MAX_HP_DOWN
		local power = 50
		local tick = 0
		local duration = 300
	end

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, power, tick, duration)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
