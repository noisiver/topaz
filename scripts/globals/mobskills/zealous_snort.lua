---------------------------------------------
-- Zealous Snort
-- 25% Haste, +25 MDB, and increases the likelihood of both countering and guarding.
-- TODO: Shouldn't be dodge and should be +Guard somehow
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


    MobBuffMoveSub(target, tpz.effect.MAGIC_DEF_BOOST, power, tick, duration)
    MobBuffMoveSub(target, tpz.effect.COUNTER_BOOST, power, tick, duration)
    MobBuffMoveSub(target, tpz.effect.DODGE, power, tick, duration)
    skill:setMsg(MobBuffMove(target, typeEffect, power, tick, duration))

    return typeEffect
end
