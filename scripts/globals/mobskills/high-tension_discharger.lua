---------------------------------------------------
-- High-Tension_Discharger
-- Description: Discharges a powerful current that deals Lightning damage to players in a fan-shaped area.
-- Additional effect: Stun
-- Type: Magical
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- skillList  54 = Omega
    -- skillList 727 = Proto-Omega
    -- skillList 728 = Ultima
    -- skillList 729 = Proto-Ultima
    local skillList = mob:getMobMod(tpz.mobMod.SKILL_LIST)
    local mobhp = mob:getHPP()
    local phase = mob:getLocalVar("battlePhase")
	if mob:getPool() == 4083 then -- Ultima COP Mission
		if mobhp <= 70 and mobhp > 40 then
			return 0
		else
			return 1
		end

    if mob:getLocalVar("nuclearWaste") == 1 then
        return 0
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.STUN

    local dmgmod = 1.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.THUNDER, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING, MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING)
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 8)
    if target:hasStatusEffect(tpz.effect.ELEMENTALRES_DOWN) then
        target:delStatusEffectSilent(tpz.effect.ELEMENTALRES_DOWN)
    end
    mob:setLocalVar("nuclearWaste", 0)
    return dmg
end