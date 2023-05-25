---------------------------------------------
-- Blood Drain
-- Steals an enemy's HP. Ineffective against undead.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    if (mob:getPool() == 9004) then -- The Big One
        dmgmod = 3
        skill:setMsg(MobDrainMove(mob, target, MOBDRAIN_TP, dmg, tpz.attackType.MAGICAL, tpz.damageType.DARK))
        return dmg
    end

    skill:setMsg(MobDrainMove(mob, target, MOBDRAIN_HP, dmg, tpz.attackType.MAGICAL, tpz.damageType.DARK))
    return dmg
end
