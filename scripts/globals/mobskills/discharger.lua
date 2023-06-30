---------------------------------------------
-- Discharger
--
-- Description: Places a magic barrier and shock spikes.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: Used only by Omega
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local mobhp = mob:getHPP()
	if mob:hasStatusEffect(tpz.effect.MAGIC_SHIELD) then
		return 1
	end

	if mob:getPool() == 2973 then
		if mobhp < 25 then
			return 0
		else
			return 1
		end
	end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffectOne = tpz.effect.MAGIC_SHIELD
    local typeEffectTwo = tpz.effect.SHOCK_SPIKES

    skill:setMsg(MobBuffMove(mob, typeEffectOne, 1, 0, 60))
    MobBuffMove(mob, typeEffectTwo, 25, 0, 60)
    return typeEffectOne
end
