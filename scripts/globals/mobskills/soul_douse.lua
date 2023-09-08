---------------------------------------------
-- Soul Dose
-- Description: Breat damage.
-- Additional effect: Inflicts Doom upon an enemy. This is not a gaze attack. Turing away will not prevent doom.
-- Range: 30' Frontal Cone
-- Type: Magical (Dark)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if not target:isInfront(mob, 128) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobHPBasedMove(mob, target, 0.10, 1, tpz.magic.ele.DARK, 1000)
    local typeEffect = tpz.effect.DOOM
    dmgmod = utils.conalDamageAdjustment(mob, target, skill, dmgmod, 0.50)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)


    if target:hasStatusEffect(tpz.effect.FEALTY) then
        skill:setMsg(tpz.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 10, 3, 30))
    end
    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.DARK)

    return dmg
end
