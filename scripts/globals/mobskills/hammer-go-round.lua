---------------------------------------------
-- Hammer-Go-Round
--
-- Description: Damages nearby targets with a hammer carousel. Additional effect: Knockback
-- Type: Physical
-- Utsusemi/Blink absorb: 2-3 shadow
-- Range: Melee
-- Notes: Only used by "destroyers" (carrying massive warhammers).
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:getPool() == 9058 then -- Troll Destroyer(Assault - Lebros Cavern)
        return 0
    end
    if (mob:AnimationSub() == 4 and mob:getFamily() == 246) then -- Troll
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded*math.random(2, 3))
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
