---------------------------------------------
--  Seismohammer
--
--  Description: Swings the hammer right at a single target. Additional effect: Petrification
--  Type: Physical (Blunt)
--
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
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
    local dmgmod = 1.7
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end

    local typeEffect = tpz.effect.PETRIFICATION
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 30)

    return dmg
end
