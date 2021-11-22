---------------------------------------------
-- Hungry Crunch
-- Steals an enemy's HP, TP and food.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	if mob:getPool() == 484 then
		return 0
	else
		return 1
	end
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, info.hitslanded)

    local msg = MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_HP, dmg)
    MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_TP, dmg)
    skill:setMsg(msg)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    if target:hasStatusEffect(tpz.effect.FOOD) then
        target:delStatusEffect(tpz.effect.FOOD)
    end

    return dmg
end
