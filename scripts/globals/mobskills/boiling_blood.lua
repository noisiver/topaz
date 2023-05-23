---------------------------------------------
-- Boiling Blood
-- Decreases defense and grants a potent (25%) haste effect.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.BERSERK) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BERSERK
    local typeEffectTwo = tpz.effect.HASTE
    local power = 55
    local powerTwo = 2500
    if mob:getPool() == 930 then -- Dea
        power = 100
        powerTwo = 2500
    end
    MobBuffMove(mob, typeEffect, power, 0, 300)
    skill:setMsg(MobBuffMove(mob, typeEffectTwo, powerTwo, 0, 300)) 
    return typeEffectTwo
end
