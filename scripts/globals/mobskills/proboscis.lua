---------------------------------------------
-- Proboscis
-- Cone Attack MP Drain, deals damage equal to MP drained and removes one random buff.
-- Type: Magical
-- Range: Melee
-- Notes: If used against undead, it will simply do damage and not drain HP.
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
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2.0, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
	mob:addMP(dmg)
    target:delMP(dmg)
    MobDispelMove(mob, target, skill, tpz.magic.ele.DARK, tpz.effectFlag.DISPELABLE)

    return dmg
end
