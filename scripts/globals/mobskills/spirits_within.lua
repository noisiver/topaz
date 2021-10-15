---------------------------------------------
-- Spirits Within
--
-- Description: Delivers an unavoidable attack. Damage varies with HP and TP.
-- Type: Magical/Breath
-- Utsusemi/Blink absorb: Ignores shadows and most damage reduction.
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/msg")

function onMobSkillCheck(target, mob, skill)

    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getPool() == 4249) then -- Volker@Throne_Room only
        target:showText(mob, zones[tpz.zone.THRONE_ROOM].text.RETURN_TO_THE_DARKNESS)
    end

    local tp = skill:getTP()
    local hp = mob:getHP()
    local dmg = 0

    if (tp <= 2000) then -- 1000 - 2000
		dmg = math.floor(hp * (math.floor(0.016 * tp) + 16) / 256)
    else -- 2001 - 3000
		dmg = math.floor(hp * (math.floor(0.016 * tp) + 16) / 256)
    end
	
	dmg = target:breathDmgTaken(dmg)

    -- Handling phalanx
    dmg = dmg - target:getMod(tpz.mod.PHALANX)

    if (dmg < 0) then
        return 0
    end

    dmg = utils.stoneskin(target, dmg)

    if (dmg > 0) then
        target:wakeUp()
        target:updateEnmityFromDamage(mob, dmg)
    end

    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.ELEMENTAL)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
