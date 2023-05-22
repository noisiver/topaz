---------------------------------------------
-- Nullsong
--
-- Description: Removes all buffs and deals around 110 damage for each buff removed.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 15' AOE
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dispel =  MobFullDispelMove(mob, target, skill, tpz.effectFlag.DISPELABLE)
    local msg = tpz.msg.basic.SKILL_NO_EFFECT
	local amount = 0
	
    if dispel > 0 then
        msg = tpz.msg.basic.DISAPPEAR_NUM
		amount = dispel * 117
    end
    local dmg = MobFinalAdjustments(amount, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.NONE, MOBPARAM_WIPE_SHADOWS)
	target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.NONE)
    skill:setMsg(msg)

    return dispel
end