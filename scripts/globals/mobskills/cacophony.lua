---------------------------------------------
-- Cacophony
-- The enemy gains Magic Attack Bonus + Magic Defense Bonus.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.MAGIC_ATK_BOOST) or mob:hasStatusEffect(tpz.effect.MAGIC_DEF_BOOST) then
		return 1
	end
    -- animsub 1= standing, animsub 0 = all fours
    if (mob:AnimationSub() == 0) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.MAGIC_ATK_BOOST
    local typeEffect2 = tpz.effect.MAGIC_DEF_BOOST
    local mabTotal = mob:getStatusEffect(tpz.effect.MAGIC_ATK_BOOST)
    local mdbTotal = mob:getStatusEffect(tpz.effect.MAGIC_DEF_BOOST)
	
    local moon = VanadielMoonPhase()
    local buffvalue = 0
    if moon > 90 then -- Full Moon
        buffvalue = 50
    elseif moon > 75 then
        buffvalue = 45
    elseif moon > 60 then
        buffvalue = 35
    elseif moon > 40 then
        buffvalue = 25
    elseif moon > 25 then
        buffvalue = 15
    elseif moon > 10 then
        buffvalue = 10
    else
        buffvalue = 5
    end

    if (mob:getStatusEffect(tpz.effect.MAGIC_ATK_BOOST) ~= nil) then -- mag atk bonus stacking
        mabTotal = mabTotal:getPower() + buffvalue
    else
        mabTotal = buffvalue
    end
    if (mob:getStatusEffect(tpz.effect.MAGIC_DEF_BOOST) ~= nil) then -- mag def bonus stacking
        mdbTotal = mdbTotal:getPower() + buffvalue
    else
        mdbTotal = buffvalue
    end
    -- print(mabTotal)
    -- print(mdbTotal)

    skill:setMsg(MobBuffMove(mob, typeEffect1, mabTotal, 0, 180))
    MobBuffMove(mob, typeEffect2, mdbTotal, 0, 180)

    return typeEffect1
end
