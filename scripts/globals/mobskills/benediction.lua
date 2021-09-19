---------------------------------------------
-- Benediction
---------------------------------------------
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local effect = tpz.effect.PARALYSIS
    local effectTwo = tpz.effect.SILENCE
		target:eraseAllStatusEffect()
        target:delStatusEffect(effect)
        target:delStatusEffect(effectTwo)

    local maxHeal = target:getMaxHP() - target:getHP()

    target:addHP(maxHeal)
    target:wakeUp()

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return maxHeal
end
