---------------------------------------------
-- Plasma Charge
-- Covers the user in Shock spikes and absorbs damage. Enemies that hit it take fire damage.
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.SHOCK_SPIKES) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.SHOCK_SPIKES
    local randy = math.random(15, 20)
    skill:setMsg(MobBuffMove(mob, typeEffect, randy, 0, 300))

    return typeEffect
end
