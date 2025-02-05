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
    -- Gotoh Zha the Redolents warm up enables the use of Groundburst
    if mob:getPool() == 1773 then
        return 0
    end
	if mob:hasStatusEffect(tpz.effect.EVASION_BOOST) and mob:hasStatusEffect(tpz.effect.ACCURACY_BOOST) then
		return 1
	end
    if mob:getMainJob() == tpz.job.BLU or mob:getMainJob() == tpz.job.BST or mob:getMainJob() == tpz.job.DRG  or mob:getMainJob() == tpz.job.NIN  or mob:getMainJob() == tpz.job.THF  then
        -- If animationSub is 1, the mob has already lost his weapeon and cant do this TP attack.
		return 0
	end
	
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    -- This is nonsensically overpowering: mob:getMainLvl() + 0.05*mob:getMaxHP()*(skill:getTP()/1000)
    local power1 = (mob:getEVA() * 0.5)
    local power2 = (mob:getACC() * 0.5)
    local EFFECT
    local rand = math.random() -- 0 to 1..
    --[[
        After checking retail this mobskill appeared to grant only
        1 of the 2 effects unlike the blue magic version
    ]]
    if (mob:hasStatusEffect(tpz.effect.ACCURACY_BOOST)) then
        skill:setMsg(MobBuffMove(mob, tpz.effect.EVASION_BOOST, power1, 0, 300))
        EFFECT = tpz.effect.EVASION_BOOST
    elseif (mob:hasStatusEffect(tpz.effect.ACCURACY_BOOST)) then
        skill:setMsg(MobBuffMove(mob, tpz.effect.ACCURACY_BOOST, power2, 0, 300))
        EFFECT = tpz.effect.ACCURACY_BOOST
    else
        if (rand < 0.5) then
            skill:setMsg(MobBuffMove(mob, tpz.effect.EVASION_BOOST, power1, 0, 300))
            EFFECT = tpz.effect.EVASION_BOOST
        else
            skill:setMsg(MobBuffMove(mob, tpz.effect.ACCURACY_BOOST, power2, 0, 300))
            EFFECT = tpz.effect.ACCURACY_BOOST
        end
    end

    return EFFECT
end
