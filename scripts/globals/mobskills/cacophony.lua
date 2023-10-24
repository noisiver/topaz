---------------------------------------------
-- Cacophony
-- The enemy gains Counter Rate + Haste
-- Notes: Removes slow
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.HASTE) and mob:hasStatusEffect(tpz.effect.COUNTER_BOOST) then
		return 1
	end
    -- animsub 1= standing, animsub 0 = all fours
    if (mob:AnimationSub() == 0) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = tpz.effect.COUNTER_BOOST
    local typeEffect2 = tpz.effect.HASTE
    local moon = utils.getMoonPhase()
    local moonpower = 5

    if (moon == 'Full') then
        moonpower = 40
    elseif (moon == 'Gibbeus') then
        moonpower = 25
    elseif (moon == 'Quarter') then
         moonpower = 15
    elseif (moon == 'Cresecent') then
         moonpower = 10
    elseif (moon == 'New') then
         moonpower = 5
	end

    local haste = moonpower * 10

    mob:delStatusEffectSilent(tpz.effect.SLOW)
    skill:setMsg(MobBuffMove(mob, typeEffect1, moonpower, 0, 300))
    local effect1 = mob:getStatusEffect(typeEffect1)
    effect1:unsetFlag(tpz.effectFlag.DISPELABLE)
    MobBuffMove(mob, typeEffect2, hastePower, 0, 300)

    return typeEffect1
end
