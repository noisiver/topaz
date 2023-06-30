---------------------------------------------------
-- Hellborn Yawp
-- Deals dark damage to targets in a AOE. Additional effect: Erase all buffs  + Dispel + Darkness 
-- Range: 10' cone
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = tpz.effect.BLINDNESS
    local power = 20
    if (mob:getPool() == 2569) then -- Custom Marquis Amon Castle Baileys
        MobSelfDispelMove(mob, skill)
    end
	if (mob:getPool() == 6742) then -- Prince Orobas
        MobFullDispelMove(mob, target, skill, tpz.effectFlag.DISPELABLE, tpz.effectFlag.FOOD)
	end
	if (mob:getPool() == 6737) then --Count Bifrons 
		mob:addStatusEffectEx(tpz.effect.PHYSICAL_SHIELD, 0, 3, 0, 30)
	end
    local dmgmod = 2.5
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.DARK, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    MobStatusEffectMove(mob, target, typeEffect, power, 0, 300)
    return dmg
end
