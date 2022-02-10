---------------------------------------------
-- Difusion Ray
-- Description: Deals damage to enemies within a fan-shaped area originating from the caster.
-- Type: Magical Light (Element)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/settings")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if target:isInfront(mob, 128) then
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.10, 1, tpz.magic.ele.LIGHT, 1000)
    dmgmod = utils.conalDamageAdjustment(mob, target, skill, dmgmod, 0.25)

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.LIGHT, MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.LIGHT)
	target:dispelStatusEffect()
    return dmg
end
