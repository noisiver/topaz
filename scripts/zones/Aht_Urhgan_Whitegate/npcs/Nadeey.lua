-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Nadeey
-- ToAU Augmenting NPC
-- !pos 79 -0 54 50
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/npc_util")
require("scripts/globals/items")
require("scripts/globals/augments")
-----------------------------------
local randomAugment =
{
    tpz.augments.ACC, tpz.augments.ATTK, tpz.augments.RACC, tpz.augments.RATTK, tpz.augments.EVA,
    tpz.augments.DEF, tpz.augments.MACC, tpz.augments.MATT, tpz.augments.STR, tpz.augments.DEX, tpz.augments.VIT, tpz.augments.AGI,
    tpz.augments.INT, tpz.augments.MND, tpz.augments.CHR, tpz.augments.RESISTSLEEP, tpz.augments.RESISTPOISON, tpz.augments.RESISTPARALYZE,
    tpz.augments.RESISTBLIND, tpz.augments.RESISTSILENCE, tpz.augments.RESISTPETRIFY, tpz.augments.RESISTVIRUS, tpz.augments.RESISTCURSE,
    tpz.augments.RESISTSTUN, tpz.augments.RESISTBIND, tpz.augments.RESISTGRAVITY, tpz.augments.RESISTSLOW, tpz.augments.RECYCLE,
    tpz.augments.NTE, tpz.augments.SUBTLE_BLOW, tpz.augments.ZANSHIN, tpz.augments.SNAP_SHOT, tpz.augments.RAPID_SHOT, tpz.augments.WSACC, 
    tpz.augments.ENH_DRAIN_ASPIR, tpz.augments.SPELLINTERRUPT, tpz.augments.SKILLCHAINDMG, tpz.augments.CONSERVE_TP,
    tpz.augments.CURE_POTENCY, tpz.augments.REGENPOTENCY,tpz.augments.WALTZ_POTENTCY, tpz.augments.ENMITY,
    tpz.augments.ENMITY_MINUS, tpz.augments.HP_MINUS_33, tpz.augments.MP_MINUS_33, tpz.augments.ACC_MINUS, tpz.augments.ATTK_MINUS,
    tpz.augments.RACC_MINUS, tpz.augments.RATTK_MINUS, tpz.augments.EVA_MINUS,
    tpz.augments.DEF_MINUS, tpz.augments.MACC_MINUS, tpz.augments.MDEF, tpz.augments.MDEF_MINUS, tpz.augments.STR_MINUS,
    tpz.augments.DEX_MINUS, tpz.augments.VIT_MINUS, tpz.augments.AGI_MINUS, tpz.augments.INT_MINUS, tpz.augments.MND_MINUS,
    tpz.augments.CHR_MINUS, tpz.augments.FIRERES,tpz.augments.ICERES, tpz.augments.WINDRES, tpz.augments.EARTHRES,
    tpz.augments.LIGHTNINGRES, tpz.augments.WATERRES, tpz.augments.LIGHTRES, tpz.augments.DARKRES, tpz.augments.DEF_10

}
local randomRareAugment =
{
    tpz.augments.REGEN, tpz.augments.MAGIC_BURST_DMG, tpz.augments.BDT, tpz.augments.DT, tpz.augments.RESISTCHARM, tpz.augments.FASTCAST,
    tpz.augments.CRITHITRATE, tpz.augments.CRITHITDAMAGE, tpz.augments.CONSERVE_MP, tpz.augments.ALL_WSDMG_FIRST_HIT, 
    tpz.augments.SONG_SPELLCASTING_TIME_MINUS, tpz.augments.CURE_SPELLCASTING_TIME_MINUS, tpz.augments.DUAL_WIELD, tpz.augments.COUNTER,
    tpz.augments.HP_33, tpz.augments.MP_33, tpz.augments.HHP, tpz.augments.HMP,

}
local randomPetAugment =
{
    tpz.augments.PET_ACC_RACC, tpz.augments.PET_ATTK_RATTK, tpz.augments.PET_EVA, tpz.augments.PET_DEF, tpz.augments.PET_MACC,
    tpz.augments.PET_MATT, tpz.augments.PET_STR_MINUS, tpz.augments.PET_DEX_MINUS, tpz.augments.RESISTPARALYZE,
    tpz.augments.PET_VIT_MINUS, tpz.augments.PET_AGI_MINUS, tpz.augments.PET_INT_MINUS, tpz.augments.PET_MND_MINUS,
    tpz.augments.PET_CHR_MINUS, tpz.augments.PET_ENMITY, tpz.augments.PET_ENMITY_MINUS, tpz.augments.PET_ENEMY_CRITHITRATE_MINUS,
    tpz.augments.BLOODPACT_ABILITY_DELAY_MINUS, tpz.augments.ENHANCES_ELEMENTAL_SIPHON, tpz.augments.BLOOD_BOON,
    tpz.augments.DEF, tpz.augments.EVA, tpz.augments.VIT, tpz.augments.AGI, tpz.augments.RESISTSLEEP, tpz.augments.RESISTPOISON, 
    tpz.augments.RESISTBLIND, tpz.augments.RESISTSILENCE, tpz.augments.RESISTPETRIFY, tpz.augments.RESISTVIRUS, tpz.augments.RESISTCURSE,
    tpz.augments.RESISTSTUN, tpz.augments.RESISTBIND, tpz.augments.RESISTGRAVITY, tpz.augments.RESISTSLOW, tpz.augments.RECYCLE,
    tpz.augments.NTE, tpz.augments.ENH_DRAIN_ASPIR, tpz.augments.SPELLINTERRUPT, tpz.augments.CONSERVE_TP,
    tpz.augments.CURE_POTENCY, tpz.augments.REGENPOTENCY, tpz.augments.WALTZ_POTENTCY, tpz.augments.ENMITY, tpz.augments.EARTHRES,
    tpz.augments.ENMITY_MINUS, tpz.augments.HP_MINUS_33, tpz.augments.MP_MINUS_33, tpz.augments.EVA_MINUS, tpz.augments.WINDRES, 
    tpz.augments.DEF_MINUS, tpz.augments.MDEF, tpz.augments.MDEF_MINUS, tpz.augments.FIRERES,tpz.augments.ICERES, 
    tpz.augments.LIGHTNINGRES, tpz.augments.WATERRES, tpz.augments.LIGHTRES, tpz.augments.DARKRES, tpz.augments.DEF_10
}
local randomPetRareAugment =
{
    tpz.augments.PET_CRIT_HIT_RATE, tpz.augments.PET_REGEN, tpz.augments.PET_HASTE, tpz.augments.PET_DT, tpz.augments.PET_STORE_TP,
    tpz.augments.PET_DOUBLE_ATTACK, tpz.augments.CONSERVE_MP, tpz.augments.HP_33, tpz.augments.MP_33, tpz.augments.HHP, tpz.augments.HMP,
    tpz.augments.REGEN, tpz.augments.BDT, tpz.augments.DT, tpz.augments.RESISTCHARM, tpz.augments.FASTCAST,
    tpz.augments.SONG_SPELLCASTING_TIME_MINUS, tpz.augments.CURE_SPELLCASTING_TIME_MINUS, 
}
local helm = 
{
    tpz.items.JARIDAH_KHUD, tpz.items.SIPAHI_TURBAN, tpz.items.TABIN_BERET, tpz.items.SILKEN_HAT
}
local bodies = 
{
    tpz.items.JARIDAH_PETI, tpz.items.SIPAHI_JAWSHAN, tpz.items.TABIN_JUPON, tpz.items.SILKEN_COAT
}
local legs = 
{
    tpz.items.JARIDAH_SALVARS, tpz.items.SIPAHI_ZEREHS, tpz.items.TABIN_HOSE, tpz.items.SILKEN_SLOPS
}
local accessories  = 
{
    tpz.items.SPELLCASTERS_ECU, tpz.items.MANTRA_COIN, tpz.items.STAR_PENDANT, tpz.items.MOON_EARRING,
    tpz.items.DEMONS_RING, tpz.items.BROCADE_OBI, tpz.items.GREEN_CAPE
}
local baseItem =
{
    tpz.items.JARIDAH_KHUD, tpz.items.SIPAHI_JAWSHAN, tpz.items.SIPAHI_TURBAN, tpz.items.TABIN_BERET, tpz.items.SILKEN_HAT,
    tpz.items.JARIDAH_PETI, tpz.items.SIPAHI_JAWSHAN, tpz.items.TABIN_JUPON, tpz.items.SILKEN_COAT, tpz.items.JARIDAH_SALVARS,
    tpz.items.SIPAHI_ZEREHS, tpz.items.TABIN_HOSE, tpz.items.SILKEN_SLOPS, tpz.items.JARIDAH_BAZUBANDS, tpz.items.JARIDAH_NAILS,
    tpz.items.SIPAHI_DASTANA, tpz.items.SIPAHI_BOOTS, tpz.items.TABIN_BRACERS, tpz.items.TABIN_BOOTS, tpz.items.SILKEN_CUFFS,
    tpz.items.SILKEN_PIGACHES, tpz.items.MARID_MITTENS, tpz.items.MARID_LEGGINGS, tpz.items.MARID_BELT
}

local basePetItem = 
{
    tpz.items.SILKEN_HAT, tpz.items.SILKEN_COAT, tpz.items.SILKEN_CUFFS, tpz.items.SILKEN_SLOPS, tpz.items.SILKEN_PIGACHES,
    tpz.items.MOONWATCH_WAND, tpz.items.SPELLCASTERS_ECU, tpz.items.MANTRA_COIN, tpz.items.STAR_PENDANT, tpz.items.MOON_EARRING,
    tpz.items.DEMONS_RING, tpz.items.BROCADE_OBI, tpz.items.GREEN_CAPE
}

local augmentMaterials =
{
    tpz.items.QUTRUB_BANDAGE, tpz.items.CHUNK_OF_FLAN_MEAT, tpz.items.SLICE_OF_KARAKUL_MEAT, tpz.items.SLICE_OF_ZIZ_MEAT,
    tpz.items.WIVRE_MAUL, tpz.items.QIQIRN_SANDBAG, tpz.items.SOULFLAYER_TENTACLE, tpz.items.WAMOURA_SCALE, tpz.items.LOCK_OF_MARID_HAIR,
    tpz.items.PUK_WING, tpz.items.APKALLU_FEATHER, tpz.items.PEPHREDO_HIVE_CHIP, tpz.items.IMP_WING, tpz.items.LAMIA_SKIN,
    tpz.items.MERROW_SCALE
}

function onTrade(player, npc, trade)
    local tradedBase = getTradedBaseToAUItem(trade)
    local tradedAugment = getTradedAugmentMaterial(trade)
    local currentItem = tradedBase.id
    local currentAugment = augmentMaterials[tradedAugment]

    -- Check if a valid combination of items is being traded
    if tradedBase.id > 0 and ToAUCorrectTradeCombination(trade, tradedBase.id, currentAugment) then
        AddToAUAugmentedItem(player, trade, currentItem, tradedAugment)
    else
        player:PrintToPlayer("I can't do anything with this combination of items!",0,"Nadeey")
    end
end

function onTrigger(player, npc)
    --player:startEvent(251)
    player:PrintToPlayer("Greetings, " .. player:getName() .. ". With the power of the Astral Cadence I can add power magical properties to your weapons and armor.",0,"Nadeey")
    player:timer(3000, function(player)
        player:PrintToPlayer("Please consult my associates for what items I can imbue and what else is required for this task.",0,"Nadeey")
    end)
    player:timer(6000, function(player)
        player:PrintToPlayer("Additionally, the item may be imbued with one of these rare properties at random:",0,"Nadeey")
    end)
    player:timer(11000, function(player)
        player:PrintToPlayer("Regen, Magic Burst Damage, Breath Damage Taken, Damage Taken, Resist Charm, Fast Cast, Critical Hit Rate, Critical Hit Damage, Conserve MP...",0x1F,"Nadeey")
    end)
    player:timer(16000, function(player)
        player:PrintToPlayer("Weapon Skill Damage, Song Casting Time, Cure Casting Time, Dual Wield, Counter, HP, MP, HMP, HHP.",0x1F,"Nadeey")
    end)
    player:timer(19000, function(player)
        player:PrintToPlayer("Pet rare properties include:",0,"Nadeey")
    end)
    player:timer(24000, function(player)
        player:PrintToPlayer("Crit Hit Rate, Regen, Haste, Damage Taken, Store TP, Double Attack",0x1C,"Nadeey")
    end)
    player:timer(29000, function(player)
        player:PrintToPlayer("The process is unstable, and there may be unknown negative properties imbued as well.",0,"Nadeey")
    end)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end

function getTradedBaseToAUItem(trade)
    -- Check for what base item is being traded
    local item = {}
    item.id = 0
    for k, v in pairs(baseItem) do
        if npcUtil.tradeHas(trade, v, false) then
            item.id = baseItem[k]
        end
    end
    for k, v in pairs(basePetItem) do
        if npcUtil.tradeHas(trade, v, false) then
            item.id = basePetItem[k]
        end
    end
    return item
end

function getTradedAugmentMaterial(trade)
    -- Check for what augment material is being traded
    for items, v in pairs(augmentMaterials) do
        if npcUtil.tradeHas(trade, v, false) then
            return items
        end
    end
    return 0
end

function ToAUCorrectTradeCombination(trade, baseitem, augmentmaterial)
    -- Make sure only two items max are being trading to not "eat" additional items
    if npcUtil.tradeHasExactly(trade, {baseitem, augmentmaterial}) then
        return true
    end
    return false
end

function AddToAUAugmentedItem(player, trade, currentItem, currentAugment)
    local ID = zones[player:getZoneID()]
    local augmentInfo = 0
    local firstAugment = 0
    local secondAugment = 0
    local thirdAugment = 0
    local fourthAugment = 0
    local rareAugment = 0

    -- Check if being traded a pet base item
    if getToAUAugmentPetItem(trade) then
        augmentInfo = getToAUPetAugmentType(player, currentAugment)
        firstAugment = augmentInfo.id
        secondAugment = randomPetAugment[math.random(#randomPetAugment)]
        thirdAugment = randomPetAugment[math.random(#randomPetAugment)]
        fourthAugment = randomPetAugment[math.random(#randomPetAugment)]
        rareAugment = randomPetRareAugment[math.random(#randomPetRareAugment)]
    else
        augmentInfo = getToAUAugmentType(player, currentAugment)
        firstAugment = augmentInfo.id
        secondAugment = randomAugment[math.random(#randomAugment)]
        thirdAugment = randomAugment[math.random(#randomAugment)]
        fourthAugment = randomAugment[math.random(#randomAugment)]
        rareAugment = randomRareAugment[math.random(#randomRareAugment)]
    end
    local firstAugmentPower = augmentInfo.power
    local augmentMultiplier = getToAUAugmentGearSlotMultiplier(trade)
    firstAugmentPower = math.floor(firstAugmentPower * augmentMultiplier)
    local numberOfAugments = getToAUAugmentAmount()

    -- Make sure a valid augment / pet augment has been selected
    if (firstAugment == 0) then
        return player:PrintToArea("Invalid augment ID " .. currentAugment .. " is not a valid ID." , tpz.msg.channel.SHOUT, tpz.msg.area.SYSTEM, "Nadeey");
    end

    player:tradeComplete()
    if (numberOfAugments == 1) then
        player:addItem(currentItem,1,firstAugment,firstAugmentPower)
        ToAUAugmentSuccessMessage(player, "A magnificent item!")
    elseif (numberOfAugments == 2) then
        player:addItem(currentItem,1,firstAugment,firstAugmentPower, secondAugment, math.random(0, 4))
        ToAUAugmentSuccessMessage(player, "A magnificent item!!")
    elseif (numberOfAugments == 3) then
        player:addItem(currentItem,1,firstAugment,firstAugmentPower, secondAugment, math.random(0, 4), thirdAugment, math.random(0, 4))
        ToAUAugmentSuccessMessage(player, "A magnificent item!!!")
    elseif (numberOfAugments == 4) then
        player:addItem(currentItem,1,firstAugment,firstAugmentPower, secondAugment, math.random(0, 4), thirdAugment, math.random(0, 4), fourthAugment, math.random(0, 4))
        ToAUAugmentSuccessMessage(player, "A magnificent item!!!!")
    elseif (numberOfAugments == 5) then
        player:addItem(currentItem,1,firstAugment,firstAugmentPower, secondAugment, math.random(0, 4), thirdAugment, math.random(0, 4), fourthAugment, math.random(0, 4), rareAugment, math.random(0, 1))
        ToAUAugmentSuccessMessage(player, "A magnificent item!!!!!")
    end
    ToAUAugmentImbueProcess(player, currentItem)
end

function getToAUAugmentType(player, augment)
    augmentInfo = {}

    if (augment == 1) then
        augmentInfo.id = tpz.augments.HP_33
        augmentInfo.power = math.random(0, 6)
    elseif (augment == 2) then
        augmentInfo.id = tpz.augments.MP_33
        augmentInfo.power = math.random(0, 6)
    elseif (augment == 3) then
        augmentInfo.id = tpz.augments.ATTK
        augmentInfo.power = math.random(4, 9)
    elseif (augment == 4) then
        augmentInfo.id = tpz.augments.RATTK
        augmentInfo.power = math.random(4, 9)
    elseif (augment == 5) then
        augmentInfo.id = tpz.augments.ACC
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 6) then
        augmentInfo.id = tpz.augments.RACC
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 7) then
        augmentInfo.id = tpz.augments.MATT
        augmentInfo.power = math.random(0, 3)
    elseif (augment == 8) then
        augmentInfo.id = tpz.augments.MACC
        augmentInfo.power = math.random(0, 3)
    elseif (augment == 9) then
        augmentInfo.id = tpz.augments.STR
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 10) then
        augmentInfo.id = tpz.augments.DEX
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 11) then
        augmentInfo.id = tpz.augments.VIT
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 12) then
        augmentInfo.id = tpz.augments.AGI
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 13) then
        augmentInfo.id = tpz.augments.INT
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 14) then
        augmentInfo.id = tpz.augments.MND
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 15) then
        augmentInfo.id = tpz.augments.CHR
        augmentInfo.power = math.random(0, 4)
    end
    return augmentInfo
end

function getToAUPetAugmentType(player, augment)
    augmentInfo = {}

    if (augment == 1) then
        augmentInfo.id = tpz.augments.HP_33
        augmentInfo.power = math.random(0, 6)
    elseif (augment == 2) then
        augmentInfo.id = tpz.augments.MP_33
        augmentInfo.power = math.random(0, 6)
    elseif (augment == 3) then
        augmentInfo.id = tpz.augments.PET_ATTK_RATTK
        augmentInfo.power = math.random(4, 9)
    elseif (augment == 4) then
        augmentInfo.id = tpz.augments.PET_DEF
        augmentInfo.power = math.random(7, 14)
    elseif (augment == 5) then
        augmentInfo.id = tpz.augments.PET_ACC_RACC
        augmentInfo.power = math.random(1, 4)
    elseif (augment == 6) then
        augmentInfo.id = tpz.augments.PET_EVA
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 7) then
        augmentInfo.id = tpz.augments.PET_MATT
        augmentInfo.power = math.random(0, 3)
    elseif (augment == 8) then
        augmentInfo.id = tpz.augments.PET_MACC
        augmentInfo.power = math.random(0, 3)
    elseif (augment == 9) then
        augmentInfo.id = tpz.augments.PET_STR
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 10) then
        augmentInfo.id = tpz.augments.PET_DEX
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 11) then
        augmentInfo.id = tpz.augments.PET_VIT
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 12) then
        augmentInfo.id = tpz.augments.PET_AGI
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 13) then
        augmentInfo.id = tpz.augments.PET_INT
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 14) then
        augmentInfo.id = tpz.augments.PET_MND
        augmentInfo.power = math.random(0, 4)
    elseif (augment == 15) then
        augmentInfo.id = tpz.augments.PET_CHR
        augmentInfo.power = math.random(0, 4)
    end
    return augmentInfo
end

function getToAUAugmentGearSlotMultiplier(trade)
    -- Stat weights based on armor type
    -- Bodies get 2x, legs get 1.5x, helm gets 1.25x, , accessories(neck/belt/ring/earring/ammo/shield) gets 0.5x rest get 1x
    for _,v in pairs(bodies) do
        if npcUtil.tradeHas(trade, v) then
            return 2.0
        end
    end
    for _,v in pairs(legs) do
        if npcUtil.tradeHas(trade, v) then
            return 1.5
        end
    end
    for _,v in pairs(helm) do
        if npcUtil.tradeHas(trade, v) then
            return 1.25
        end
    end
    for _,v in pairs(accessories ) do
        if npcUtil.tradeHas(trade, v) then
            return 0.5
        end
    end
    return 1
end

function getToAUAugmentPetItem(trade)
    for _,v in pairs(basePetItem) do
        if npcUtil.tradeHas(trade, v) then
            return true
        end
    end
    return false
end

function getToAUAugmentAmount()
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

function ToAUAugmentSuccessMessage(player, msg)
    player:timer(3000, function(player)
        player:PrintToPlayer("What have we here?! " .. msg ,0,"Nadeey")
    end)
end

function ToAUAugmentImbueProcess(player, currentItem)
    local ID = zones[player:getZoneID()]
    player:PrintToPlayer("I will start the imbuing process on this item right away. Do not go anywhere!" ,0,"Nadeey")
    player:timer(3000, function(player)
        player:messageSpecial( ID.text.ITEM_OBTAINED, currentItem)
    end)
end