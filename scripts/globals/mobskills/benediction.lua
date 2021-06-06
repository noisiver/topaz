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
		target:eraseAllStatusEffect()
        target:delStatusEffect(effect)

    local maxHeal = target:getMaxHP() - target:getHP()

    target:addHP(maxHeal)
    target:wakeUp()

    skill:setMsg(tpz.msg.basic.SELF_HEAL)

    return maxHeal
end
