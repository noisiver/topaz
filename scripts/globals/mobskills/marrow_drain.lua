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
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*1, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_IGNORE_SHADOWS)
    if (target:getMP() < dmg) then
        dmg = target:getMP()
    end
	skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_MP, dmg))
    return dmg
end
