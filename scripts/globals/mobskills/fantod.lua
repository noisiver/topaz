---------------------------------------------
-- Fantod
-- Doubles the damage of the monsters next physical attack.
-- Notes: Grants +25% attack to the player when used by a jug pet
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.BOOST) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BOOST

    skill:setMsg(MobBuffMove(mob, typeEffect, 100, 0, 300))
    tpz.pet.handleJugBuffs(target, mob, skill, tpz.effect.ATTACK_BOOST, 25, 0, 60)

    return typeEffect
end
