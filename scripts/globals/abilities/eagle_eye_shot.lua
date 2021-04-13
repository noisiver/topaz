-----------------------------------
-- Ability: Eagle Eye Shot
-- Delivers a powerful and accurate ranged attack.
-- Obtained: Ranger Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/weaponskills")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    local ranged = player:getStorageItem(0, 0, tpz.slot.RANGED)
    local ammo = player:getStorageItem(0, 0, tpz.slot.AMMO)

    if ranged and ranged:isType(tpz.itemType.WEAPON) then
        local skilltype = ranged:getSkillType()
        if skilltype == tpz.skill.ARCHERY or skilltype == tpz.skill.MARKSMANSHIP or skilltype == tpz.skill.THROWING then
            if ammo and (ammo:isType(tpz.itemType.WEAPON) or skilltype == tpz.skill.THROWING) then
                return 0, 0
            end
        end
    end

    return tpz.msg.basic.NO_RANGED_WEAPON, 0
end

function onUseAbility(player, target, ability, action)
    if (player:getWeaponSkillType(tpz.slot.RANGED) == tpz.skill.MARKSMANSHIP) then
        action:animation(target:getID(), action:animation(target:getID()) + 1)
    end

    local hit = 4
    --get fstr
    local  fstr = fSTR2(attacker:getStat(tpz.mod.STR), target:getStat(tpz.mod.VIT), attacker:getRangedDmgRank())

    local params = {}
    params.atk100 = 1 params.atk200 = 1 params.atk300 = 1

    --apply WSC
    local  weaponDamage = player:getRangedDmg()

    local base = weaponDamage + fstr
    local cratio, ccritratio = cRangedRatio(player, target, params, 0, 0)
    local pdif = generatePdif (cratio[1], cratio[2], true)
    local hitrate = getRangedHitRate(player, target, true, +100)

    if (math.random() <= hitrate) then
        hit = 5
        damage = (base * pdif) * 5

    -- Set the message id ourselves
    target:takeDamage(damage, player, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
    target:updateEnmityFromDamage(player, damage)
        action:messageID(target:getID(), tpz.msg.basic.JA_DAMAGE)
		action:speceffect(target:getID(), hit)
    else
        action:messageID(target:getID(), tpz.msg.basic.JA_MISS_2)
        action:speceffect(target:getID(), 0)
    end

    return damage
end
