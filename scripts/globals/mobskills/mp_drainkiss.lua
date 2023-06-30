---------------------------------------------
-- MP Drainkiss
-- Deals dark damage to a single target. Additional effect: Aspir
-- Type: Magical
-- Utsusemi/Blink absorb: 1 shadow
-- Range: Melee
-- Notes: If used against undead, it will simply do damage and not drain MP.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local int = mob:getStat(tpz.mod.INT)
    local dmgmod = 2 + math.floor((int * 1.5))
    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, MOBPARAM_1_SHADOW)
    if (target:getMP() < dmg) then
        dmg = target:getMP()
    end
	skill:setMsg(MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_MP, dmg))
    return dmg
end
