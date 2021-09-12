---------------------------------------------------
-- BrainJack
--
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BURN
    local power = 15

    MobStatusEffectMove(mob, target, typeEffect, power, 3, 60)
   	if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    else
		skill:setMsg(MobStatusEffectMove(mob, target, tpz.effect.CHARM, 1, 0, 60))
    end

	return tpz.effect.CHARM
end
