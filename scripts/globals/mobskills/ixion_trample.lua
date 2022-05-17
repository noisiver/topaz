---------------------------------------------
-- Trample(Dark Ixion)
-- Charges forward, dealing high damage to,(400-1000) and lowering the MP (10-30%) of targets hit.
-- Type: Magical
-- Range: Melee
-- Notes: 1 target at > 76%+ HP, 2 at > 26% HP, 3 at < 25% HP.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.7
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded*math.random(1, 4))
	
    local mp = math.floor((target:getMaxMP() * math.random(1, 3)) / 10)


    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    target:delMP(mp)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    if (MobPhysicalHit(skill)) then
        mob:resetEnmity(target)
    end
    return dmg
end
