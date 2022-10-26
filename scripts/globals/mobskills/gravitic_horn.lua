---------------------------------------------------
-- Gravitic Horn
-- Family: Antlion (Only used by Formiceros subspecies)
-- Description: Heavy wind, Throat Stab-like damage in a fan-shaped area of effect. Resets enmity.
-- Type: Magical
-- Can be dispelled: N/A
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Conal AoE
-- Notes: If Orcus uses this, it gains an aura which inflicts Weight & Defense Down to targets in range.
-- Shell lowers the damage of this, and items like Jelly Ring can get you killed.
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local hpp = 0.95
    local dmg = MobThroatStabMove(mob, target, skill, hpp, tpz.attackType.MAGICAL,tpz.damageType.WIND,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, dmg) end
    mob:resetEnmity(target)
    return dmg
end
