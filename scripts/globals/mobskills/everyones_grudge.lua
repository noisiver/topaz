---------------------------------------------
--  Everyones Grudge
--
--  Notes: Invokes collective hatred to spite a single target.
--   Damage done is 5x the amount of tonberries you have killed! For NM's using this it is 50 x damage.
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    if mob:isNM() then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local realDmg = 0
    local power = 5
    local grudgeVar = target:getCharVar("EVERYONES_GRUDGE_KILLS")

    if target:isPet() then
        local master = target:getMaster()
        if master:isPC() then
            grudgeVar = master:getCharVar("EVERYONES_GRUDGE_KILLS")
        end
    end

    realDmg = power * grudgeVar -- Damage is 5 times the amount you have killed

    if mob:isNM() then
        realDmg = realDmg * 10 -- sets the multiplier to 50 for NM's
    end

    local dmg = MobFinalAdjustments(realDmg, mob, skill, target, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.ELEMENTAL)

    return dmg
end
