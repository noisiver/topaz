---------------------------------------------
--  Feral Peck
--
--  Description: Reduces targets' HP within a frontal cone by 90% and resets enmity of those hit.
--  Type: Physical
--  Utsusemi/Blink absorb: No
--  Range: Frontal Cone
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()
    if mob:isMobType(MOBTYPE_NOTORIOUS) then
		if (mobhp <= 50) then
			result = 0
		end
    end
    return result
end


function onMobWeaponSkill(target, mob, skill)
    local currentHP = target:getHP()
    local damage = currentHP * 0.90
    local dmg = MobFinalAdjustments(damage,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.NONE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.NONE)
    if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, dmg) end
    mob:resetEnmity(target)

    return dmg
end

