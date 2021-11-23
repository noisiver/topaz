---------------------------------------------------
-- Eagle Eye Shot
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 4
    local dmgmod = 4.0

    local info = MobRangedMove(mob, target, skill, numhits, accmod, dmgmod, TP_ATK_VARIES, 2, 2, 2)

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, tpz.attackType.RANGED, tpz.damageType.PIERCING, info.hitslanded)

    if dmg > 0 then
       target:addTP(20)
       mob:addTP(80)
    end

    target:takeDamage(dmg, mob, tpz.attackType.RANGED, tpz.damageType.PIERCING)

    return dmg
end
