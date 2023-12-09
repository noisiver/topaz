---------------------------------------------------
-- Incisive Denouement
--
-- Magical (Wind)
-- Conal
-- Additional effect: Enmity reset and Weakness.
-- Sets target HP to 5%.
-- Only used below 25% HP.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getHPP() < 25) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 9.0
	local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*2, tpz.magic.ele.WIND, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    MobStatusEffectMoveSub(mob, target, tpz.effect.WEAKNESS, 1, 0, 15, 0, 0, 0)
    mob:resetEnmity(target)
    return dmg
end