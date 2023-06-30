---------------------------------------------
-- Calamitous Wind
--
-- Description: Deals Wind damage within AoE and fully dispels all buffs.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Dispels shadows
-- Range: 20' AOE
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local result = 1
    local mobhp = mob:getHPP()
    if (mob:getPool() == 5869) then -- Only used by certain NM's
		result = 0
    end
    return result
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 4.0
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*3, tpz.magic.ele.WIND, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.WIND, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.WIND)
    MobFullDispelMove(mob, target, skill, tpz.effectFlag.DISPELABLE)
    return dmg
end
