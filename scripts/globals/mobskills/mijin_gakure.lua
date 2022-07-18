---------------------------------------------------
-- Mijin Gakure
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end


function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 30
    local BOMB_TOSS_HPP = skill:getMobHPP() / 100
    dmgmod = math.floor(dmgmod * BOMB_TOSS_HPP)
    if dmgmod < 1 then dmgmod = 1 end

    local job = mob:getMainJob()
    local power = 12

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*power*BOMB_TOSS_HPP, tpz.magic.ele.NONE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.NONE, MOBPARAM_IGNORE_SHADOWS)

    if target:hasStatusEffect(tpz.effect.FEALTY) then
        dmg = math.floor(dmg / 16)
    end

    if dmg > 1250 then dmg = 1250 end -- Don't do silly damage if the mob has high HP

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.NONE)
    return dmg
end
