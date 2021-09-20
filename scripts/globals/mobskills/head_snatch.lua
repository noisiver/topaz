---------------------------------------------
--  Head Snatch
--  Description: Grabs a single target's head.
--  Type: Physical
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Melee
--  Notes: Only used by Gurfurlur the Menacing. Reduces HP to 10%.
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local targetCurrentHP = target:getHP()
    local targetmaxHP = target:getMaxHP()
    local hpset=targetmaxHP*0.10

    if (targetCurrentHP > hpset) then
        dmg = targetCurrentHP - hpset
    else
        dmg = 0
    end

    local dmg = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.NONE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    mob:resetEnmity(target)
    return dmg
end
