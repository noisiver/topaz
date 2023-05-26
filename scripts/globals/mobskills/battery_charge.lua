---------------------------------------------
-- Battery Charge
-- Description: Restores MP equal to the amount of TP consumed
-- Type: Magical (Light)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:getMPP() == 100 then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 128) then -- Ancient Vessel
        local typeEffectTwo = tpz.effect.SHOCK_SPIKES
		skill:setMsg(MobBuffMove(mob, typeEffectTwo, 15, 0, 30))
        typeEffectTwo:unsetFlag(tpz.effectFlag.DISPELABLE)
        return typeEffect
    end
    local tp = mob:getLocalVar("tp")
    mob:addMP(tp)

    skill:setMsg(tpz.msg.basic.SKILL_RECOVERS_MP)

    return tp
end
