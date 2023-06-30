---------------------------------------------
-- Call of the Grave
--
-- Description: Lowers INT of targets in an area of effect.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Unknown radial
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local rugaroo = mob:getPool() == 3413

    if rugaroo then
        return 0
    end
	if mob:hasStatusEffect(tpz.effect.PROWESS_KILLER) then
		return 1
	end
    -- animsub 1= standing, animsub 0 = all fours
    if (mob:AnimationSub() == 1) then
        return 1
    end

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.INT_DOWN
    local tick = 30
    local power = (target:getStat(tpz.mod.INT) * 0.2) +5

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, power, tick, 300))

    return typeEffect
end
