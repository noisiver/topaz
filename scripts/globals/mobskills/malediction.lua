---------------------------------------------
-- Malediction
-- Steals an enemy's HP. Ineffective against undead.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = math.floor(mob:getMainLvl() * 4)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    skill:setMsg(MobDrainMove(mob, target, skill, MOBDRAIN_HP, dmg, tpz.attackType.MAGICAL, tpz.damageType.DARK))

    return dmg
end
