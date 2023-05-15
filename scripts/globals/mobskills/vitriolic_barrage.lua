---------------------------------------------
--  Vitrolic Barrage
--
--  Description: Bombards nearby targets with acid, dealing fixed Water damage. Additional effect: Poison
--  Type: Magical (Water)
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: AoE 10'
-- 1000 dmg "needles"
--  Notes: Poison is 20/tic
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local needles = 1000 / skill:getTotalTargets()
    local typeEffect = tpz.effect.POISON
    local info = MobNeedlesMagicalMove(mob, target, skill, needles, tpz.magic.ele.WATER, tpeffect)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
    MobStatusEffectMove(mob, target, typeEffect, 25, 3, 90)
    return dmg
end
