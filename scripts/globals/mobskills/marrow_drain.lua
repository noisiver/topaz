---------------------------------------------
-- Marrow Drain
-- Steals an enemy's MP. Ineffective against undead.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local zone = mob:getZoneID()
    if zone > 99 and zone < 214 and mob:isMobType(MOBTYPE_NOTORIOUS) == false then -- Only used by NM's and CoP and onward Giant Bats
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 5 + (mob:getMainLvl() + 2)
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
    if (target:getMP() < dmg) then
        dmg = target:getMP()
    end
	skill:setMsg(MobDrainMove(mob, target, skill, MOBDRAIN_MP, dmg, tpz.attackType.MAGICAL, tpz.damageType.DARK))

    return dmg
end
