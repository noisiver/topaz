---------------------------------------------
-- Cacophony
-- The enemy gains Counterstance + Haste
-- Notes: Removes slow
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.HASTE) and mob:hasStatusEffect(tpz.effect.COUNTERSTANCE) then
		return 1
	end
    -- animsub 1= standing, animsub 0 = all fours
    if (mob:AnimationSub() == 0) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.COUNTERSTANCE
    local typeEffect2 = tpz.effect.HASTE

	local moon = VanadielMoonPhase()
    local cstancePower = 25
    local hastePower = 3550
    if moon > 90 then -- Full Moon
        cstancePower = 50
        hastePower = 5000
    elseif moon > 75 then
        cstancePower = 45
        hastePower = 4550
    elseif moon > 60 then
        cstancePower = 35
        hastePower = 3550
    elseif moon > 40 then
        cstancePower = 25
        hastePower = 2550
    elseif moon > 25 then
        cstancePower = 15
        hastePower = 1550
    elseif moon > 10 then
        cstancePower = 10
        hastePower = 1050
    else
        cstancePower = 10
        hastePower = 1050
    end

    mob:delStatusEffectSilent(tpz.effect.SLOW)
    skill:setMsg(MobBuffMove(mob, typeEffect1, cstancePower, 0, 300))
    MobBuffMove(mob, typeEffect2, hastePower, 0, 300)

    return typeEffect1
end
