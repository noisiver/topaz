---------------------------------------------
--  Nocturnal Combustion
--
--  Description: Self-destructs, releasing dark energy at nearby targets.
--  Type: Magical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: 20'  radial
--  Notes: Damage is based on remaining HP and time of day (more damaging near midnight). The djinn will not use this until it has been affected by the current day's element.
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:isNM() then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 30
	local GameTime = VanadielHour()
	if GameTime <= 3 then
		dmgmod = 30
	elseif GameTime <= 6 then
		dmgmod = 28
	elseif GameTime <= 9 then
		dmgmod = 25
	elseif GameTime <= 12 then
		dmgmod = 22
	elseif GameTime > 12 then
		dmgmod = 20
	elseif GameTime >= 15 then
		dmgmod = 18
	elseif GameTime >= 18 then
		dmgmod = 25
	elseif GameTime >= 21 then
		dmgmod = 28
	elseif GameTime == 0 then
		dmgmod = 30
	end
	
    local BOMB_TOSS_HPP = skill:getMobHPP() / 100
    dmgmod = math.floor(dmgmod * BOMB_TOSS_HPP)
    if dmgmod < 1 then dmgmod = 1 end

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*12*BOMB_TOSS_HPP, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
    mob:setHP(0)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    return dmg
end
