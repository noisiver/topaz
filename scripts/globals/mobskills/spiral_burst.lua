---------------------------------------------
-- Spiral Burst
-- Family: Ladybug
-- Type:  Damage + Full Erase
-- Range: Self
-- Notes: Sacrifices HP to deal damage and Erase all negative effects.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getPool() ~= 9076) then -- Coccinellidae
        return 0
    end
    if VanadielHour() >= 6 and VanadielHour() <= 18 then
		if mob:isNM() then
			return 0
		end
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 2.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGIC, tpz.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    utils.FullSelfEraseNa(mob)
    return dmg
end

