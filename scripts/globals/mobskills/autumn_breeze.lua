---------------------------------------------
-- Autumn Breeze
--
-- Description: Recovers HP and gains regen.
-- Regen cannot be dispelled.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
	if mob:hasStatusEffect(tpz.effect.REGEN) then
		return 1
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    --[[
    https://youtu.be/r7ogGoabgH0?t=1m58s
    https://youtu.be/a0Tqdl8_SY4?t=2m29s
    https://youtu.be/a0Tqdl8_SY4?t=5m22s
    https://youtu.be/m0XpjG6E1oc?t=58s
    https://youtu.be/m0XpjG6E1oc?t=5m52s
    belphoebe : 300 ish (310, 312, 294..)
    skuld     : 250 ish
    carabosse : 100-250 ish (lowest lv mob of the 3)
    ]]
    local typeEffect = tpz.effect.REGEN
    local power = 10

    MobBuffMove(mob, typeEffect, power, 3, 300)
    local effect1 = mob:getStatusEffect(typeEffect)
    effect1:unsetFlag(tpz.effectFlag.DISPELABLE)
    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return MobHealMove(mob, target, skill, 1)
end
