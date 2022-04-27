---------------------------------------------
--  Dire Straight
--
--  Description: Deals physical damage.
--  Type: Physical
--  Utsusemi/Blink absorb: 2shadows?
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local AnimationSub = mob:AnimationSub()
    if mob:getPool() == 4594 then -- Wulgaru
        if AnimationSub > 0 then
            return 1
        else
            return 0
        end
    end
    local mobhp = mob:getHPP()
	if(mob:getFamily() == 1) then --Acrolith
		if mob:getPool() == 504 then --Boompadu
			if mobhp > 50 and mobhp <= 100 then
				return 0
			else
				return 1
			end
		end
	end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 2.5
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
