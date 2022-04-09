---------------------------------------------
--  Deathgnash
--
--  Description: Inflicts damage equal to 90% of target's HP. Additional Effect: Removes Enmity. Ignores shadows.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Single Target
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")
require("scripts/globals/utils")
---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    local AIMode = mob:getLocalVar("AIMode")
    if AIMode == 2 then
        return 1
    end
    if mob:getPool() == 2920 and AIMode == 1 then -- Nuhn
        if mob:getHPP() > 50 then
            return 1
        end
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local currentHP = target:getHP()
    local damage = math.floor(currentHP * .90)

    local dmg = MobFinalAdjustments(damage,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.NONE,MOBPARAM_IGNORE_SHADOWS)
    -- Deals reduced damage at range
    local distance = mob:checkDistance(target)
    distance = utils.clamp(distance, 0, 50)
    dmg = dmg * ((50 - distance) / 50)

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.NONE)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 45)
	target:addStatusEffect(tpz.effect.STUN, 1, 0, 1)
    mob:resetEnmity(target)

    return dmg
end

