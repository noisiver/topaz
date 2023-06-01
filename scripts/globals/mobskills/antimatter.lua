---------------------------------------------------
--  Antimatter
--
--  Description:  Single-target ranged Light damage ignores Utsusemi.
--  Type: Magical
--  Element: Light 
--  Notes: Deals 750 damage
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local skillList = mob:getMobMod(tpz.mobMod.SKILL_LIST)
    local mobhp = mob:getHPP()
    local phase = mob:getLocalVar("battlePhase")
    local mobhp = mob:getHPP()
	local mobhp = mob:getHPP()
	if mob:getPool() == 4083 then -- Ultima COP Mission
		if mobhp <= 20 then
			return 0
		else
			return 1
		end
	end

    if ((skillList == 729 and phase < 2) or (skillList == 728 and mobhp > 70)) then
        if mob:getLocalVar("nuclearWaste") == 0 then
            return 0
        end
    end


    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 750
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.LIGHT, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
    return dmg
end