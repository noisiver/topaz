---------------------------------------------
--  Wind Breath
--
--  Description: Deals Wind breath damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Wind)
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = MobHPBasedMove(mob, target, 0.10, 1, tpz.magic.ele.WIND, 900)
    if mob:getPool() == 9056 then -- Vishap(Assault - Lebros Cavern)
        dmgmod = MobHPBasedMove(mob, target, 0.10, 1, tpz.magic.ele.WIND, 500)
    end

    local dmg = MobFinalAdjustments(dmgmod, mob, skill, target, tpz.attackType.BREATH, tpz.damageType.WIND, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.BREATH, tpz.damageType.WIND)
    return dmg
end
