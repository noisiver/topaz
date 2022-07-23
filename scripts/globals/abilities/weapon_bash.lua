-----------------------------------
-- Ability: Weapon Bash
-- Delivers an attack that can stun the target. Requires Two-handed weapon.
-- Obtained: Dark Knight Level 20
-- Cast Time: Instant
-- Recast Time: 3:00 minutes
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/utils")
-----------------------------------

function onAbilityCheck(player, target, ability)
    if not player:isWeaponTwoHanded() then
        return tpz.msg.basic.NEEDS_2H_WEAPON, 0
    else
        return 0, 0
    end
end

function onUseAbility(player, target, ability)

    -- Check for PD
    if target:hasStatusEffect(tpz.effect.PERFECT_DODGE) then
        return ability:setMsg(tpz.msg.basic.JA_MISS)
    end

    -- Applying Weapon Bash stun. Rate is said to be near 100%, so let's say 99%.
    if (math.random()*100 < 99) and not target:hasStatusEffect(tpz.effect.STUN) then
        target:addStatusEffect(tpz.effect.STUN, 1, 0, 4)
    end

    -- Weapon Bash deals damage dependant of Dark Knight level
    local darkKnightLvl = 0
    if player:getMainJob() == tpz.job.DRK then
        darkKnightLvl = player:getMainLvl()    -- Use Mainjob Lvl
    elseif player:getSubJob() == tpz.job.DRK then
        darkKnightLvl = player:getSubLvl()    -- Use Subjob Lvl
    end

    -- Calculating and applying Weapon Bash damage
    local damage = math.floor(((darkKnightLvl + 11) / 4) + player:getMod(tpz.mod.WEAPON_BASH))

    -- Randomize damage
    local ratio = player:getStat(tpz.mod.ATT)/target:getStat(tpz.mod.DEF)

    if ratio > 1.3 then
        ratio = 1.3
    end

    if ratio < 0.2 then
        ratio = 0.2
    end

    local pdif = math.random(ratio * 0.8 * 1000, ratio * 1.2 * 1000)

    -- printf("damge %d, ratio: %f, pdif: %d\n", damage, ratio, pdif)
    damage = damage * (pdif / 1000)

    -- Check for Invincible
    if target:hasStatusEffect(tpz.effect.INVINCIBLE) then
        damage = 0
    end

    damage = utils.stoneskin(target, damage)
    target:takeDamage(damage, player, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    target:updateEnmityFromDamage(player, damage)

    return damage
end
