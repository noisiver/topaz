-----------------------------------
-- Ability: Mug
-- Steal gil from enemy.
-- Obtained: Thief Level 35
-- Recast Time: 5:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player, target, ability)
    return 0, 0
end

function onUseAbility(player, target, ability, action)
    local thfLevel
    local gil = 0
    local fail = false

    if (player:getMainJob() == tpz.job.THF) then
        thfLevel = player:getMainLvl()
    else
        thfLevel = player:getSubLvl()
    end

    local mugChance = 90 + thfLevel - target:getMainLvl()
    local dex = player:getStat(tpz.mod.DEX)
    local agi = player:getStat(tpz.mod.AGI)

    if (target:isMob() and math.random(100) < mugChance and target:getMobMod(tpz.mobMod.MUG_GIL) > 0) then
        local purse = target:getMobMod(tpz.mobMod.MUG_GIL)
        local fatpurse = target:getGil()
        gil = fatpurse / (8 + math.random(0, 8))
        if (gil == 0) then
            gil = fatpurse / 2
        end
        if (gil == 0) then
            gil = fatpurse
        end
        if (gil > purse) then
            gil = purse
        end

        if (gil <= 0) then
            ability:setMsg(tpz.msg.basic.MUG_FAIL)
        else
            gil = gil * (1 + player:getMod(tpz.mod.MUG_EFFECT))
            player:addGil(gil)
            target:setMobMod(tpz.mobMod.MUG_GIL, target:getMobMod(tpz.mobMod.MUG_GIL) - gil)
            ability:setMsg(tpz.msg.basic.MUG_SUCCESS)
        end
    else
        fail = true
        ability:setMsg(tpz.msg.basic.JA_RECOVERS_HP)
    end

    -- Deal damage based on DEX + AGI
    local dmg = dex + agi
    target:takeDamage(dmg, player, tpz.attackType.SPECIAL, tpz.damageType.NONE)

    -- Recover for amount dealt
    if ((player:getMaxHP() - player:getHP()) < dmg) then
        dmg = (player:getMaxHP() - player:getHP())
    end

    -- No healing vs undead
    if target:isUndead() then
        dmg = 0
    end

    player:addHP(dmg)
    player:updateEnmityFromCure(player, dmg)

    if fail then
        action:animation(target:getID(), 184)
        action:additionalEffect(target:getID(),tpz.subEffect.HP_DRAIN)
        return dmg
    else
        return gil
    end
end
