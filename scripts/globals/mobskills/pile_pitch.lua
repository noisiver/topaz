---------------------------------------------------
--  Pile Pitch
--
--  Description:  Reduces target's HP to 5% of its maximum value, ignores Utsusemi  , Bind (30 sec)
--  Type: Magical
--
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    -- skillList  54 = Omega
    -- skillList 727 = Proto-Omega
    -- skillList 728 = Ultima
    -- skillList 729 = Proto-Ultima
    local skillList = mob:getMobMod(tpz.mobMod.SKILL_LIST)
    local mobhp = mob:getHPP()
	if mob:getPool() == 2973 then
		if mobhp < 25 then
			return 0
		else
			return 1
		end
	end

    if ((skillList == 54 and mobhp < 26) or (skillList == 727 and mob:AnimationSub() == 1)) then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local maxHP = target:getMaxHP()
    local currentHP = target:getHP()
    local damage = maxHP * .90
    local typeEffect = tpz.effect.BIND
    local dmg = MobFinalAdjustments(damage,mob,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.NONE,MOBPARAM_IGNORE_SHADOWS)
    if dmg > maxHP then
       dmg = maxHP * 0.90 -- Ensure it won't kill target
    end
    target:takeDamage(dmg, mob, tpz.attackType.PHYSICAL, tpz.damageType.NONE)
    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 0, 45)
    if ((skill:getMsg() ~= tpz.msg.basic.SHADOW_ABSORB) and (dmg > 0)) then   target:tryInterruptSpell(mob, dmg) end
    mob:resetEnmity(target)

    return dmg
end