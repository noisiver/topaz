---------------------------------------------
-- Plenilune_Embrace
-- New Moon     Crescent moon 	Quarter Moon    Gibbous Moon    Full moon
-- HPmax x 5%   HPmax x 10%	    HPmax x 15%	    HPmax x 25% 	HPmax x 40%
-- 0 Erase	    2 Erase	        2 Erase	        3 Erase	        Full Erase
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- animsub 1= standing, animsub 0 = all fours
    if (mob:AnimationSub() == 1) then
        return 1
    end

    return 0
end


function onMobWeaponSkill(target, mob, skill)
    local moon = utils.getMoonPhase()
    local moonpower = 5

    if (moon == 'Full') then
        utils.FullSelfEraseNa(mob)
        moonpower = 40
    elseif (moon == 'Gibbeus') then
	    mob:eraseStatusEffect()
        mob:eraseStatusEffect()
        mob:eraseStatusEffect()
        moonpower = 25
    elseif (moon == 'Quarter') then
         moonpower = 15
         mob:eraseStatusEffect()
         mob:eraseStatusEffect()
    elseif (moon == 'Cresecent') then
         moonpower = 10
         mob:eraseStatusEffect()
    elseif (moon == 'New') then
         moonpower = 5
	end

    local typeEffect = tpz.effect.ATTACK_BOOST
    local typeEffectTwo = tpz.effect.MAGIC_ATK_BOOST
    local healMultiplier = 1 + (moonpower / 25)
    for i = 54, 61 do -- All res
        mob:setMod(i, moonpower)
    end

    MobBuffMove(mob, typeEffect, moonpower, 0, 60)
    MobBuffMove(mob, typeEffectTwo, moonpower, 0, 60)

    return MobHealMove(target, skill, healMultiplier)
end
