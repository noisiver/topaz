---------------------------------------------
--  Ochre Blast
--
--  Description: Deals earth damage to enemies in area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: 18' radial.
--  Notes: Used only by Ouryu and Cuelebre while flying.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    if (mob:AnimationSub() ~= 1) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 3.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
    return dmg
end
