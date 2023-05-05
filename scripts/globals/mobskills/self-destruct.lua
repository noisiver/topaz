---------------------------------------------------
-- Self-Destruct
--
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if (mob:getPool() == 498) then -- Bomb Queen
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local damage = MobBreathMove(mob, target, 0.20, 1, tpz.magic.ele.FIRE, 1250)
    local dmg = MobFinalAdjustments(damage, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
    mob:setHP(0)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    return dmg
end
