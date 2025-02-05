-----------------------------------
-- Ability: Despoil
-- Steal items and debuffs enemy.
-- Obtained: Thief Level 77
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")

local despoilDebuffs =
{
    tpz.effect.EVASION_DOWN,
    tpz.effect.DEFENSE_DOWN,
    tpz.effect.ACCURACY_DOWN,
    tpz.effect.ATTACK_DOWN,
    tpz.effect.MAGIC_ATK_DOWN,
    tpz.effect.MAGIC_DEF_DOWN,
    tpz.effect.SLOW
}

function onAbilityCheck(player, target, ability)
    if player:getFreeSlotsCount() == 0 then
        return tpz.msg.basic.FULL_INVENTORY, 0
    end

    if player:getObjType() == tpz.objType.TRUST then
        if player:getMaster():getFreeSlotsCount() == 0 then
            return 1, 0
        end
    end

    return 0, 0
end

function onUseAbility(player, target, ability, action)
    local level = player:getMainLvl() -- Can only reach THF77 as main job
    local despoilMod = player:getMod(tpz.mod.DESPOIL)
    -- 50% base chance
    local despoilChance = 50 + despoilMod + level - target:getMainLvl() -- Same math as Steal

    despoilChance = utils.clamp(despoilChance, 5, 50) -- Cap at 45% chance

    local stolen = target:getDespoilItem()
    if target:isMob() and math.random(100) < despoilChance and (stolen > 0) then
        if player:getObjType() == tpz.objType.TRUST then
            player:getMaster():addItem(stolen)
        else
            player:addItem(stolen)
        end
        target:itemStolen()

        -- Attempt to grab the debuff from the DB
        -- If there isn't a debuff assigned to the item stolen, select one at random
        local debuff = player:getDespoilDebuff(stolen)
        if not debuff then
            debuff = despoilDebuffs[math.random(#despoilDebuffs)]
        end

        local power = processDebuff(player, target, ability, debuff) -- Also sets ability message
        -- Don't overwrite debuffs already on the target
        if not target:hasStatusEffect(debuff) then
            target:addStatusEffect(debuff, power, 0, 90)
        end
    else
        action:animation(target:getID(), 182)
        ability:setMsg(tpz.msg.basic.STEAL_FAIL) -- Failed
        return 0
    end

    return stolen
end

function processDebuff(player, target, ability, debuff)
    local power = 10
    if debuff == tpz.effect.ATTACK_DOWN then
        ability:setMsg(tpz.msg.basic.DESPOIL_ATT_DOWN)
        power = 10      -- changed from 20
    elseif debuff == tpz.effect.DEFENSE_DOWN then
        ability:setMsg(tpz.msg.basic.DESPOIL_DEF_DOWN)
        power = 10  -- changed from 30
    elseif debuff == tpz.effect.MAGIC_ATK_DOWN then
        ability:setMsg(tpz.msg.basic.DESPOIL_MATT_DOWN)
    elseif debuff == tpz.effect.MAGIC_DEF_DOWN then
        ability:setMsg(tpz.msg.basic.DESPOIL_MDEF_DOWN)
        power = 10  -- changed from 20
    elseif debuff == tpz.effect.EVASION_DOWN then
        ability:setMsg(tpz.msg.basic.DESPOIL_EVA_DOWN)
        power = 10  -- changed from 30
    elseif debuff == tpz.effect.ACCURACY_DOWN then
        ability:setMsg(tpz.msg.basic.DESPOIL_ACC_DOWN)
        power = 10  -- changed from 20
    elseif debuff == tpz.effect.SLOW then
        ability:setMsg(tpz.msg.basic.DESPOIL_SLOW)
        power = 1000 
    end

    return power
end
