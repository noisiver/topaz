---------------------------------------------------
-- Spikeball
-- Throws a spiky projectile at a single target. Additional effect: Poison
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local power = mob:getMainLvl()/3 + 3
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.PIERCING, info.hitslanded)
    target:takeDamage(dmg, mob, tpz.attackType.RANGED, tpz.damageType.PIERCING)

    if dmg > 0 then
        MobStatusEffectMove(mob, target, tpz.effect.POISON, power, 3, 160)
		target:tryInterruptSpell(mob, 1)
    end

    return dmg
end
