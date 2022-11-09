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
require("scripts/globals/utils")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getPool() ~= 9076) then -- Coccinellidae
        return 0
    end
    if VanadielHour() >= 6 and VanadielHour() <= 18 then
		if mob:isNM() then
			return 0
		end
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local params_phys = {}
    params_phys.multiplier = dmgmod
    params_phys.tp150 = 1
    params_phys.tp300 = 1
    params_phys.str_wsc = 0.0
    params_phys.dex_wsc = 0.0
    params_phys.vit_wsc = 0.3
    params_phys.agi_wsc = 0.0
    params_phys.int_wsc = 0.0
    params_phys.mnd_wsc = 0.0
    params_phys.chr_wsc = 0.0
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT, params_phys)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, MOBPARAM_IGNORE_SHADOWS)
	
	local HP = mob:getHP()
	local selfdmg = HP * 0.10
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
	if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, info.hitslanded) end
	utils.FullSelfEraseNa(mob)
    if (mob:getPool() ~= 9076) and (mob:getPool() ~= 3280) then -- Coccinellidae doesn't deal self damage
	    mob:delHP(selfdmg)
    end
    return dmg
end
