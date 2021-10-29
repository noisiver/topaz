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
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:isNM() then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, info.hitslanded)
	
    local effect = tpz.effect.PARALYSIS
    local effectTwo = tpz.effect.SILENCE
	local HP = mob:getHP()
	local selfdmg = HP * 0.10
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
	mob:eraseAllStatusEffect()
	mob:delStatusEffect(effect)
	mob:delStatusEffect(effectTwo)
	mob:delHP(selfdmg)
end
