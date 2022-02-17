---------------------------------------------------
-- Colossal_Blow
-- Deals damage to a single target.
--
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    local currentForm = mob:getLocalVar("form") -- this var is only set for proto-omega

    if (currentForm == 2) and mob:AnimationSub() == 2 then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local currentHP = target:getHP()
    local damage = currentHP * .90
    local dmg = MobFinalAdjustments(damage,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.NONE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.NONE)
	target:addStatusEffect(tpz.effect.STUN, 1, 0, 1)
    mob:resetEnmity(target)

    return dmg
end
