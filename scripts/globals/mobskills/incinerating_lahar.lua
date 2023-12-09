---------------------------------------------
-- Incinerating Lahar
--
--  Description: Deals Fire damage. Additional Effect: Weakness
--  Type:  Magical
--  Radius: AOE 10'1
-- 
--  Utsusemi/Blink absorb: Wipes shadows
-- Only used below 50%.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() < 50) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 5.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    MobStatusEffectMoveSub(mob, target, tpz.effect.WEAKNESS, 1, 0, 15, 0, 0, 0)
    return dmg
end
