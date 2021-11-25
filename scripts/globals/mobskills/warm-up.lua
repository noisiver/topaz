---------------------------------------------
-- Warm-Up
--
-- Description: Enhances accuracy and evasion.
-- Type: Magical (Earth)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getMainJob() == tpz.job.BLU or mob:getMainJob() == tpz.job.BST or mob:getMainJob() == tpz.job.DRG  or mob:getMainJob() == tpz.job.NIN  or mob:getMainJob() == tpz.job.THF  then
        -- If animationSub is 1, the mob has already lost his weapeon and cant do this TP attack.
		return 0
	end
	
	if mob:hasStatusEffect(tpz.effect.EVASION_BOOST) then
		return 1
	end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    -- This is nonsensically overpowering: mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/1000)
     local power = 10 + (mob:getMainLvl() / 1) -- Power needs redone with retail MOB VERSION formula not players blue magic changed from 10
    local EFFECT
    local rand = math.random() -- 0 to 1..
    --[[
        After checking retail this mobskill appeared to grant only
        1 of the 2 effects unlike the blue magic version
    ]]
    if (mob:hasStatusEffect(tpz.effect.ACCURACY_BOOST)) then
        skill:setMsg(MobBuffMove(mob, tpz.effect.EVASION_BOOST, power, 0, 180))
        EFFECT = tpz.effect.EVASION_BOOST
    elseif (mob:hasStatusEffect(tpz.effect.ACCURACY_BOOST)) then
        skill:setMsg(MobBuffMove(mob, tpz.effect.ACCURACY_BOOST, power, 0, 180))
        EFFECT = tpz.effect.ACCURACY_BOOST
    else
        if (rand < 0.5) then
            skill:setMsg(MobBuffMove(mob, tpz.effect.EVASION_BOOST, power, 0, 180))
            EFFECT = tpz.effect.EVASION_BOOST
        else
            skill:setMsg(MobBuffMove(mob, tpz.effect.ACCURACY_BOOST, power, 0, 180))
            EFFECT = tpz.effect.ACCURACY_BOOST
        end
    end

    return EFFECT
end
