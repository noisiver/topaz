---------------------------------------------
--  Sinker Drill
--
--  Description: Deals critical damage
--  Type: Physical
--  Utsusemi/Blink absorb: 3 shadows.
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
        if AnimationSub == 1 then
            return 0
        else
            return 1
        end
    end
    local mobhp = mob:getHPP()
	if(mob:getFamily() == 1) then --Acrolith
		if mob:getPool() == 504 then --Boompadu
			if mobhp > 25 and mobhp <= 50 then
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
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_CRIT_VARIES, 1.45, 1.55, 1.75)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, MOBPARAM_3_SHADOW)
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
    return dmg
end
