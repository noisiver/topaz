---------------------------------------------
-- Calamitous Wind
--
-- Description: Deals Wind damage within AoE and fully dispels all buffs.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Dispels shadows
-- Range: 20' AOE
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
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
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    local dispel =  target:dispelAllStatusEffect(bit.bor(tpz.effectFlag.DISPELABLE))
	local msg = tpz.msg.basic.SKILL_NO_EFFECT

    if dispel > 0 then
        msg = tpz.msg.basic.DISAPPEAR_NUM
    end
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    skill:setMsg(msg)

    return dispel
end
