---------------------------------------------
-- Battery Charge
-- Description: Gradually restores MP.
-- Type: Magical (Light)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.REFRESH) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 128) then -- Ancient Vessel
        local typeEffectTwo = tpz.effect.SHOCK_SPIKES
		skill:setMsg(MobBuffMove(mob, typeEffectTwo, 15, 0, 30))
        typeEffectTwo:unsetFlag(tpz.effectFlag.DISPELABLE)
    end
    local typeEffect = tpz.effect.REFRESH

    skill:setMsg(MobBuffMove(mob, typeEffect, 3, 3, 300))

    return typeEffect
end
