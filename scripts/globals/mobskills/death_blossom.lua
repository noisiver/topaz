---------------------------------------------
-- Death Blossom
-- Description: Damage varies with TP.
-- Type: Physical
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 3
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT, 1)
   -- local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.SLASHING,info.hitslanded)
   local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.SLASHING, MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    return dmg
end
