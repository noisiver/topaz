---------------------------------------------
-- Discoid
-- 4,400 damage "needles"
-- Light elemental damage
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local needles = 4400 / skill:getTotalTargets()
    local info = MobNeedlesMagicalMove(mob, target, skill, needles, tpz.magic.ele.LIGHT, tpeffect)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)

    return dmg
end
