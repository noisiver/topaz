---------------------------------------------
--  Somersault Kick
--
--  Description: Somersaults a single target. Additional effect: Knockback
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes:
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)

  if(mob:getFamily() == 91) then
    local mobSkin = mob:getModelId()

    if (mobSkin == 1639) then
        return 0
    else
        return 1
    end
  end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)

    if (mob:getPool() == 4377) then -- Worr the Clawfisted
       local typeEffect = tpz.effect.HASTE
       MobBuffMove(mob, typeEffect, 2500, 0, 30)
    end

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if dmg > 0 then target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
