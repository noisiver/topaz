---------------------------------------------
--  Forceful Blow
--
--  Description: Delivers a powerful strike to a single target.
--  Type: Physical
--  Utsusemi/Blink absorb: 1 shadow
--  Range: Melee
--  Notes: Only used by unarmed Mamool Ja of the warrior class (THF, NIN, BLU, BST, DRG).
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target, mob, skill)
    -- Only used by unarmed(NIN or broken weapon) Mamools
	if mob:getMainJob() == tpz.job.NIN or (mob:getMainJob() ~= tpz.job.NIN and mob:AnimationSub() == 1) then        
		return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2

    if mob:getPool() == 9059 then -- Imperial Agent Rescue(Assault)
        dmgmod = 5
    end

    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
