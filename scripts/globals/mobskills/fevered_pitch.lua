---------------------------------------------
--  Fevered Pitch
--  Deals damage to a single target. Additional effect: Stun and Defense Down
--  Utsusemi/Blink absorb: 1 shadow
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
    local dmgmod = 0
	local defdownpower = 0
	local stunpower = 0
	
    local moon = VanadielMoonPhase()
    if moon > 90 then -- Full Moon
        dmgmod = 4
		defdownpower = 50
		stunpower = 7
    elseif moon > 75 then
        dmgmod = 3.9
		defdownpower = 45
		stunpower = 6
    elseif moon > 60 then
        dmgmod = 3.8
		defdownpower = 40
		stunpower = 5
    elseif moon > 40 then
        dmgmod = 3.5
		defdownpower = 30
		stunpower = 4
    elseif moon > 25 then
        dmgmod = 3.3
		defdownpower = 20
		stunpower = 3
    elseif moon > 10 then
        dmgmod = 3.1
		defdownpower = 10
		stunpower = 2
    else
        dmgmod = 3.1
		defdownpower = 5
		stunpower = 2
    end	
	
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.DEFENSE_DOWN, defdownpower, 0, 300)
	MobPhysicalStatusEffectMove(mob, target, skill, tpz.effect.STUN, 1, 0, stunpower)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
