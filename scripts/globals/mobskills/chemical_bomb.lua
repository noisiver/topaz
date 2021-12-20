---------------------------------------------
-- Chemical_Bomb
--
-- Description: slow + elegy
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
		if mobhp > 70  or mobhp <= 40 and mobhp > 20 then
			return 0
		else
			return 1
		end
	end

    if (skillList == 729 and phase < 2) or (skillList == 728 and (mobhp >= 70 or mobhp < 40)) then
        if mob:getLocalVar("nuclearWaste") == 0 then
            return 0
        end
    end

    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local accmod = 1
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.EARTH, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.EARTH, MOBPARAM_IGNORE_SHADOWS)
  
	local typeEffectOne = tpz.effect.ELEGY
    local typeEffectTwo = tpz.effect.SLOW

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.EARTH)
    MobStatusEffectMove(mob, target, typeEffectOne, 5000, 0, 120)
    MobStatusEffectMove(mob, target, typeEffectTwo, 5000, 0, 120)
    return dmg
end