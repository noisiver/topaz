---------------------------------------------
-- Plenilune_Embrace
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    --[[
    The only calculations available on the net are for the players blue magic version,
    which does not seem to fit with retail in game observations on the mobskill version..
    So math.random() for now!
    ]]
   
   local moon = VanadielMoonPhase()
   local moonphase = 0
   local moonpower = 0
    if moon > 90 then -- Full Moon
        moonphase = math.random(1900, 2300)
		moonpower = 30
		mob:eraseStatusEffect()
		mob:eraseStatusEffect()
		mob:eraseStatusEffect()
    elseif moon > 75 then
        moonphase = math.random(1200, 1300)
		moonpower = 25
		mob:eraseStatusEffect()
		mob:eraseStatusEffect()
    elseif moon > 60 then
        moonphase = math.random(810, 860)
		moonpower = 20
		mob:eraseStatusEffect()
    elseif moon > 40 then
        moonphase = math.random(710, 750)
		moonpower = 10
    elseif moon > 25 then
        moonphase = math.random(460, 490)
		moonpower = 7
    elseif moon > 10 then
        moonphase = math.random(250, 290)
		moonpower = 5
    else
        moonphase = math.random(250, 290)
		moonpower = 5
    end
	
	local heal = moonphase
	local typeEffect = tpz.effect.ATTACK_BOOST
    local typeEffectTwo = tpz.effect.MAGIC_ATK_BOOST

	MobBuffMove(mob, typeEffect, moonpower, 0, 120)
	MobBuffMove(mob, typeEffectTwo, moonpower, 0, 120)
    skill:setMsg(tpz.msg.basic.SELF_HEAL)

	return MobHealMove(mob, heal)
end
