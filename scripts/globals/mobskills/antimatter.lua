---------------------------------------------------
--  Antimatter
--
--  Description:  Single-target ranged Light damage (~700-1500), ignores Utsusemi.
--  Type: Magical
--
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- skillList  54 = Omega
    -- skillList 727 = Proto-Omega
    -- skillList 728 = Ultima
    -- skillList 729 = Proto-Ultima
    if ((skillList == 729 and phase < 4) or (skillList == 728 and mobhp < 20)) then
        if mob:getLocalVar("nuclearWaste") == 0 then
            return 0
        end
    end
	
    local skillList = mob:getMobMod(tpz.mobMod.SKILL_LIST)
    local mobhp = mob:getHPP()
    local phase = mob:getLocalVar("battlePhase")
	if mob:getPool() == 4083 then -- Ultima COP Mission
		if mobhp <= 20 then
			return 0
		else
			return 1
		end
	end


    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.LIGHT, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
    return dmg
end