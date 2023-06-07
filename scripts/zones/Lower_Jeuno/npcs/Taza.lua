-----------------------------------
-- Area: Lower Jeuno
--  NPC: Taza
-- Augmenting NPC
-- !pos -29 5 -89 245
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/items")
require("scripts/globals/augments")
-----------------------------------
-- Tiger / Darksteel Cuirass / Shade Harness / Silk Coat
-----------------------------------
-- Sets
local sets =
{
    -- Slot || ID
    helm =
    {
        tpz.items.DARKSTEEL_ARMET, tpz.items.DARKSTEEL_ARMET_HQ, tpz.items.TIGER_HELM, tpz.items.FERAL_HELM,
        tpz.items.COEURL_MASK, tpz.items.TORAMA_MASK,
    },
    body =
    {
        tpz.items.DARKSTEEL_CUIRASS, tpz.items.DARKSTEEL_CUIRASS_HQ, tpz.items.TIGER_JERKIN, tpz.items.FERAL_JERKIN,
        tpz.items.COEURL_JERKIN, tpz.items.TORAMA_JERKIN,
    },
    hands =
    {
        tpz.items.DARKSTEEL_GAUNTLETS, tpz.items.DARKSTEEL_GAUNTLETS_HQ, tpz.items.TIGER_GLOVES, tpz.items.FERAL_GLOVES,
        tpz.items.COEURL_GLOVES, tpz.items.TORAMA_GLOVES,
    },
    legs =
    {
        tpz.items.DARKSTEEL_CUISSES, tpz.items.DARKSTEEL_CUISSES_HQ, tpz.items.TIGER_TROUSERS, tpz.items.FERAL_TROUSERS,
        tpz.items.COEURL_TROUSERS, tpz.items.TORAMA_TROUSERS,
    },
    feet =
    {
        tpz.items.DARKSTEEL_SABATONS, tpz.items.DARKSTEEL_SABATONS_HQ, tpz.items.TIGER_LEDELSENS, tpz.items.FERAL_LEDELSENS,
        tpz.items.COEURL_LEDELSENS, tpz.items.TORAMA_LEDELSENS,
    }
}

-----------------------------------

-----------------------------------
-- Forgotten items
local forgotten =
{
    -- Slow || ID || Mod Multiplier
    head = { tpz.items.FORGOTTEN_THOUGHT, 1.25, Used = false },
    body = { tpz.items.FORGOTTEN_HOPE, 2, Used = false },
    hands = { tpz.items.FORGOTTEN_TOUCH, 1, Used = false },
    legs = { tpz.items.FORGOTTEN_JOURNEY, 1.5, Used = false },
    feet = { tpz.items.FORGOTTEN_STEP, 1, Used = false },
}
-----------------------------------

-----------------------------------
-- Augments
local possibleAugments =
{
    -- Mod || Base Mod Power
    { Stat = tpz.augments.ACC, Power = 10, Used = false },
    { Stat = tpz.augments.ATTK, Power = 10, Used = false },
    { Stat = tpz.augments.RACC, Power = 10, Used = false },
    { Stat = tpz.augments.RATTK, Power = 10, Used = false },
    { Stat = tpz.augments.EVA, Power = 10, Used = false },
    { Stat = tpz.augments.DEF, Power = 10, Used = false },
    { Stat = tpz.augments.MACC, Power = 5, Used = false },
    { Stat = tpz.augments.MATT, Power = 5, Used = false },
    { Stat = tpz.augments.STR, Power = 5, Used = false },
    { Stat = tpz.augments.DEX, Power = 5, Used = false },
    { Stat = tpz.augments.VIT, Power = 5, Used = false },
    { Stat = tpz.augments.AGI, Power = 5, Used = false },
    { Stat = tpz.augments.INT, Power = 5, Used = false },
    { Stat = tpz.augments.MND, Power = 5, Used = false },
    { Stat = tpz.augments.CHR, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTSLEEP, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTPOISON, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTPARALYZE, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTBLIND, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTSILENCE, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTPETRIFY, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTVIRUS, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTCURSE, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTSTUN, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTBIND, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTGRAVITY, Power = 5, Used = false },
    { Stat = tpz.augments.RESISTSLOW, Power = 5, Used = false },
    { Stat = tpz.augments.RECYCLE, Power = 5, Used = false },
    { Stat = tpz.augments.NTE, Power = 5, Used = false },
    { Stat = tpz.augments.SUBTLE_BLOW, Power = 5, Used = false },
    { Stat = tpz.augments.ZANSHIN, Power = 5, Used = false },
    { Stat = tpz.augments.SNAP_SHOT, Power = 5, Used = false },
    { Stat = tpz.augments.RAPID_SHOT, Power = 5, Used = false },
    { Stat = tpz.augments.WSACC, Power = 10, Used = false },
    { Stat = tpz.augments.ENH_DRAIN_ASPIR, Power = 5, Used = false },
    { Stat = tpz.augments.SPELLINTERRUPT, Power = 5, Used = false },
    { Stat = tpz.augments.SKILLCHAINDMG, Power = 5, Used = false },
    { Stat = tpz.augments.CONSERVE_TP, Power = 5, Used = false },
    { Stat = tpz.augments.CURE_POTENCY, Power = 5, Used = false },
    { Stat = tpz.augments.REGENPOTENCY, Power = 5, Used = false },
    { Stat = tpz.augments.WALTZ_POTENTCY, Power = 5, Used = false },
    { Stat = tpz.augments.ENMITY, Power = 5, Used = false },
    { Stat = tpz.augments.ENMITY_MINUS, Power = 5, Used = false },
    { Stat = tpz.augments.HP_MINUS_33, Power = 1, Used = false },
    { Stat = tpz.augments.MP_MINUS_33, Power = 1, Used = false },
    { Stat = tpz.augments.ACC_MINUS, Power = 10, Used = false },
    { Stat = tpz.augments.ATTK_MINUS, Power = 10, Used = false },
    { Stat = tpz.augments.RACC_MINUS, Power = 10, Used = false },
    { Stat = tpz.augments.RATTK_MINUS, Power = 10, Used = false },
    { Stat = tpz.augments.EVA_MINUS, Power = 10, Used = false },
    { Stat = tpz.augments.DEF_MINUS, Power = 10, Used = false },
    { Stat = tpz.augments.MACC_MINUS, Power = 5, Used = false },
    { Stat = tpz.augments.MDEF, Power = 5, Used = false },
    { Stat = tpz.augments.MDEF_MINUS, Power = 5, Used = false },
    { Stat = tpz.augments.STR_MINUS, Power = 5, Used = false },
    { Stat = tpz.augments.DEX_MINUS, Power = 5, Used = false },
    { Stat = tpz.augments.VIT_MINUS, Power = 5, Used = false },
    { Stat = tpz.augments.AGI_MINUS, Power = 5, Used = false },
    { Stat = tpz.augments.INT_MINUS, Power = 5, Used = false },
    { Stat = tpz.augments.MND_MINUS, Power = 5, Used = false },
    { Stat = tpz.augments.CHR_MINUS, Power = 5, Used = false },
    { Stat = tpz.augments.FIRERES, Power = 10, Used = false },
    { Stat = tpz.augments.ICERES, Power = 10, Used = false },
    { Stat = tpz.augments.WINDRES, Power = 10, Used = false },
    { Stat = tpz.augments.EARTHRES, Power = 10, Used = false },
    { Stat = tpz.augments.LIGHTNINGRES, Power = 10, Used = false },
    { Stat = tpz.augments.WATERRES, Power = 10, Used = false },
    { Stat = tpz.augments.LIGHTRES, Power = 10, Used = false },
    { Stat = tpz.augments.DARKRES, Power = 10, Used = false },
    { Stat = tpz.augments.DEF_10, Power = 1, Used = false },
}

local possibleRareAugments =
{
    { Stat = tpz.augments.REGEN, Power = 1, Used = false },
    { Stat = tpz.augments.MAGIC_BURST_DMG, Power = 3, Used = false },
    { Stat = tpz.augments.BDT, Power = 1, Used = false },
    { Stat = tpz.augments.DT, Power = 1, Used = false },
    { Stat = tpz.augments.RESISTCHARM, Power = 5, Used = false },
    { Stat = tpz.augments.FASTCAST, Power = 1, Used = false },
    { Stat = tpz.augments.CRITHITRATE, Power = 1, Used = false },
    { Stat = tpz.augments.CRITHITDAMAGE, Power = 1, Used = false },
    { Stat = tpz.augments.CONSERVE_MP, Power = 1, Used = false },
    { Stat = tpz.augments.ALL_WSDMG_FIRST_HIT, Power = 1, Used = false },
    { Stat = tpz.augments.SONG_SPELLCASTING_TIME_MINUS, Power = 1, Used = false },
    { Stat = tpz.augments.CURE_SPELLCASTING_TIME_MINUS, Power = 1, Used = false },
    { Stat = tpz.augments.DUAL_WIELD, Power = 1, Used = false },
    { Stat = tpz.augments.COUNTER, Power = 1, Used = false },
    { Stat = tpz.augments.HP_33, Power = 1, Used = false },
    { Stat = tpz.augments.MP_33, Power = 1, Used = false },
    { Stat = tpz.augments.HHP, Power = 1, Used = false },
    { Stat = tpz.augments.HMP, Power = 1, Used = false },
}
-----------------------------------


function onTrade(player, npc, trade)
    local tradedBase = getTradedBaseTazaItem(trade)
    local tradedAugment = getTradedAugmentMaterial(trade)
    local currentItem = tradedBase.id

    -- Check if a valid combination of items is being traded
    if tradedBase.id > 0 and TazaCorrectTradeCombination(trade, tradedBase.id, tradedAugment) then
        AddTazaAugmentedItem(player, trade, currentItem, tradedAugment)
    else
        player:PrintToPlayer("I can't do anything with those items",0,"Taza")
    end
end

function onTrade(player, npc, trade)
    for _,option in pairs(trades) do
        if npcUtil.tradeHas(trade, option.items) then
            player:confirmTrade()
            option.GiveAugment(player);
            player:PrintToPlayer("I have successfully augmented your item and the the magical properties have been revealed!",0,"Taza")
            return
        end
    end
    player:PrintToPlayer("I can't do anything with those items",0,"Taza")
end

function onTrade(player, npc, trade)
    local tradedBase = getTradedBaseTazaItem(trade)
    local tradedAugment = getTradedAugmentMaterial(trade)
    local currentItem = tradedBase.id

    -- Check if a valid combination of items is being traded
    if (tradedBase.id > 0) and TazaCorrectTradeCombination(trade, tradedBase.id) then
        AddTazaAugmentedItem(player, trade, currentItem, tradedAugment)
    else
        player:PrintToPlayer("I can't do anything with this combination of items!",0,"Nadeey")
    end
end


function onTrigger(player, npc)
	player:PrintToPlayer("Do you have magical items you would like to augment? I can help!",0,"Taza")
end

function getTradedBaseTazaItem(trade)
    -- Check for what base item is being traded
    local item = {}
    item.id = 0
    for slot,items in pairs(sets) do
        for _,item in ipairs(items) do
            if npcUtil.tradeHas(trade, item, false) then
                item.id = item
            end
        end
    end
    return item
end

function getTradedForgottenItem(trade)
    -- Check for what forgotten item is being traded
    for slot, items in pairs(forgotten) do
        for _,item in ipairs(items) do
            return item[1]
        end
    end
    return 0
end

function AddTazaAugmentedItem(player, trade, currentItem)
    local ID = zones[player:getZoneID()]
    local augmentMultiplier = getTazaAugmentGearSlotMultiplier(trade)
    local numberOfAugments = getTazaAugmentAmount()

    local augmentResult = {}
    for i = 1,4 do
        local randomAugment
        while (randomAugment == nil) or (randomAugment.Used) do
            randomAugment = possibleAugments[math.random(#possibleAugments)]
        end
        augmentResult[i] = randomAugment
        augmentResult[i].Power = math.random(1, augmentResult[i].Power)
        augmentResult[i].Power = augmentResult[i].Power * augmentMultiplier
        randomAugment.Used = true
    end

    local augmentRareResult = {}
    for i = 1,1 do
        local randomRareAugment
        while (randomRareAugment == nil) or (randomRareAugment.Used) do
            randomRareAugment = possibleRareAugments[math.random(#possibleRareAugments)]
        end
        augmentRareResult[i] = randomRareAugment
        augmentRareResult[i].Power = math.random(1, augmentRareResult[i].Power)
        augmentRareResult[i].Power = augmentRareResult[i].Power * augmentMultiplier
        randomRareAugment.Used = true
    end

    -- Make sure a valid augment / pet augment has been selected
    if (augmentResult[1].Stat == 0) then
        return player:PrintToArea("Invalid augment ID " .. augmentResult[1].Stat .. " is not a valid ID." , tpz.msg.channel.SHOUT, tpz.msg.area.SYSTEM, "Taza")
    elseif (augmentResult[1].Power < 0) then
        return player:PrintToArea("Invalid augment power range " .. augmentResult[1].Power .. " is not a valid power range." , tpz.msg.channel.SHOUT, tpz.msg.area.SYSTEM, "Taza")
    end

    player:tradeComplete()
    if (numberOfAugments == 1) then
        player:addItem(currentItem,1,augmentResult[1].Stat,augmentResult[1].Power)
        TazaAugmentSuccessMessage(player, "The magical properties of this item are not very powerful.")
    elseif (numberOfAugments == 2) then
        player:addItem(currentItem,1,augmentResult[1].Stat,augmentResult[1].Power, augmentResult[2].Stat, augmentResult[2].Power)
        TazaAugmentSuccessMessage(player, "The magical properties of this item are mild.")
    elseif (numberOfAugments == 3) then
        player:addItem(currentItem,1,augmentResult[1].Stat,augmentResult[1].Power, augmentResult[2].Stat, augmentResult[2].Power, augmentResult[3].Stat, augmentResult[3].Power)
        TazaAugmentSuccessMessage(player, "The magical properties of this item are good.")
    elseif (numberOfAugments == 4) then
        player:addItem(currentItem,1,augmentResult[1].Stat,augmentResult[1].Power, augmentResult[2].Stat, augmentResult[2].Power, augmentResult[3].Stat, augmentResult[3].Power, augmentResult[4].Stat, augmentResult[4].Power)
        TazaAugmentSuccessMessage(player, "The magical properties of this item are powerful!")
    elseif (numberOfAugments == 5) then
        player:addItem(currentItem,1,augmentResult[1].Stat,augmentResult[1].Power, augmentResult[2].Stat, augmentResult[2].Power, augmentResult[3].Stat, augmentResult[3].Power, augmentResult[4].Stat, augmentResult[4].Power, augmentRareResult[1].Power, augmentRareResult[1].Stat)
        TazaAugmentSuccessMessage(player, "The magical properties of this item are very powerful!")
    end
    TazaAugmentImbueProcess(player, currentItem)
end

function getTazaAugmentAmount()
    rnd = math.random()

    if rnd < 0.2 then
        return 1
    elseif rnd < 0.4 then
        return 2
    elseif rnd < 0.6 then
        return 3
    elseif rnd < 0.9 then
        return 4
    else
        return 5
    end
end

function TazaAugmentSuccessMessage(player, msg)
    player:timer(3000, function(player)
        player:PrintToPlayer(msg ,0,"Taza")
    end)
end