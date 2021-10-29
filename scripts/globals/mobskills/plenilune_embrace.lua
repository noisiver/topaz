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
    if moon > 90 then -- Full Moon
        moonphase = math.random(1900, 2300)
		mob:eraseStatusEffect()
		mob:eraseStatusEffect()
		mob:eraseStatusEffect()
    elseif moon > 75 then
        moonphase = math.random(1200, 1300)
		mob:eraseStatusEffect()
		mob:eraseStatusEffect()
    elseif moon > 60 then
        moonphase = math.random(810, 860)
		mob:eraseStatusEffect()
    elseif moon > 40 then
        moonphase = math.random(710, 750)
    elseif moon > 25 then
        moonphase = math.random(460, 490)
    elseif moon > 10 then
        moonphase = math.random(250, 290)
    else
        moonphase = math.random(250, 290)
    end
	
	local heal = moonphase
	
    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return MobHealMove(mob, heal)
end
