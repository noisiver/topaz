---------------------------------------------
-- Hydro Blast
--
-- Description: Inflicts damage. Additional effect: Grants the user Magic Shield.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: AOE
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if os.time() < mob:getLocalVar("ruszorWaterAbsorbTimer") then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WATER, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WATER, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WATER)
    MobEncumberMove(mob, target, 5, 30)
    mob:setLocalVar("ruszorWaterAbsorbTimer", os.time() + 30)
    return dmg
end
