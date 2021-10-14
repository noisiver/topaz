---------------------------------------------
--  Amon Drive
--
--  Description: Performs an area of effect weaponskill. Additional effect: Paralysis + Petrification + Poison
--  Type: Physical
--  2-3 Shadows?
--  Range: Melee range radial

-- Special weaponskill unique to Ark Angel TT. Deals ~100-400 damage.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
   MobPhysicalStatusEffectMove(mob, target, tpz.effect.PARALYSIS, 25, 0, 60)
   MobPhysicalStatusEffectMove(mob, target, tpz.effect.PETRIFICATION, 1, 0, 10)
   MobPhysicalStatusEffectMove(mob, target, tpz.effect.POISON, 50, 3, 60)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
