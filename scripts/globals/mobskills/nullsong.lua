---------------------------------------------
-- Nullsong
--
-- Description: Removes all buffs and deals 117 damage for each buff removed.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: 15' AOE
-- Notes: Only used if there is 3 or more effects to dispel on available targets
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local effects = target:getStatusEffects()
    local numberOfEffects = mob:getLocalVar("amountOfEffects")
    for i, effect in ipairs(effects) do
        -- check mask bit for tpz.effectFlag.DISPELABLE
        if (utils.mask.getBit(effect:getFlag(), tpz.effectFlag.DISPELABLE) and utils.mask.getBit(effect:getFlag(), tpz.effectFlag.FOOD)) then
            mob:setLocalVar("amountOfEffects", numberOfEffects + 1)
        end
    end
    if (numberOfEffects >= 3) then
        mob:setLocalVar("amountOfEffects", 0) -- Reset effect count timer
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dispel =  MobFullDispelMove(mob, target, skill, tpz.effectFlag.DISPELABLE, tpz.effectFlag.FOOD)
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