---------------------------------------------
-- Zealous Snort
-- 25% Haste, +25 MDB, and increases the likelihood of both countering and guarding.
-- TODO: Counterstance / dodge effects shouldn't be ued and should just be adding a mod
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.BERSERK) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.HASTE
    local power = 25
    local tick = 0
    local duration = 60


    MobBuffMoveSub(mob, tpz.effect.MAGIC_DEF_BOOST, power, tick, duration)
    MobBuffMoveSub(mob, tpz.effect.COUNTERSTANCE, power, tick, duration)
    MobBuffMoveSub(mob, tpz.effect.DODGE, power, tick, duration)
    skill:setMsg(MobBuffMove(mob, typeEffect, power, tick, duration))
    tpz.pet.handleJugBuffs(target, mob, skill, typeEffect, power, tick, duration)
    tpz.pet.handleJugBuffs(target, mob, skill, tpz.effect.MAGIC_DEF_BOOST, power, tick, duration)
    tpz.pet.handleJugBuffs(target, mob, skill, tpz.effect.COUNTERSTANCE, power, tick, duration)
    tpz.pet.handleJugBuffs(target, mob, skill, tpz.effect.DODGE, power, tick, duration)

    return typeEffect
end
