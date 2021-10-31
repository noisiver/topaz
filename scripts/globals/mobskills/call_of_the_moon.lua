---------------------------------------------
-- Call of the Moon
--
-- Description: The enemy gains a high rate of Intimidation.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.PROWESS_KILLER
 
 local moon = VanadielMoonPhase()
    local power = 0
    if moon > 90 then -- Full Moon
        power = 50
    elseif moon > 75 then
        power = 45
    elseif moon > 60 then
        power = 40
    elseif moon > 40 then
        power = 30
    elseif moon > 25 then
        power = 20
    elseif moon > 10 then
        power = 10
    else
        power = 5
    end	
	
	MobBuffMove(mob, typeEffect, power, 0, 30)
    mob:addStatusEffectEx(tpz.effect.HUMANOID_KILLER, 0, power, 0, 30)	
	skill:setMsg(tpz.msg.basic.NONE)
    return typeEffect
end
