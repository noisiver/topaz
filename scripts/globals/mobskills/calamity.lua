---------------------------------------------
--  Calamity
--
--  Description: Delivers a single-hit attack. Damage varies with TP.
--  Type: Physical
--  Number of hits
--  Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 3
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    -- Didn't see any numbers, so just giving it something on par with other AAs.
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
