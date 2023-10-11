-----------------------------------
-- Area: Lower Jeuno
--  NPC: Taza
-- Zilart Augmenting NPC
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
    helm =
    {
        items = {
            tpz.items.DARKSTEEL_ARMET,
            tpz.items.DARKSTEEL_ARMET_HQ,
            tpz.items.TIGER_HELM,
            tpz.items.FERAL_HELM,
            tpz.items.COEURL_MASK,
            tpz.items.TORAMA_MASK,
            tpz.items.SILK_HAT,
            tpz.items.SILK_HAT_HQ,
            tpz.items.SHADE_TIARA,
            tpz.items.SHADE_TIARA_HQ,
        },
        augmentMat  =  tpz.items.FORGOTTEN_THOUGHT,
        augmentMultiplier  = 1.25,
    },
    body =
    {
        items = {
            tpz.items.DARKSTEEL_CUIRASS,
            tpz.items.DARKSTEEL_CUIRASS_HQ,
            tpz.items.TIGER_JERKIN,
            tpz.items.FERAL_JERKIN,
            tpz.items.COEURL_JERKIN,
            tpz.items.TORAMA_JERKIN,
            tpz.items.SILK_COAT,
            tpz.items.SILK_COAT_HQ,
            tpz.items.SHADE_HARNESS,
            tpz.items.SHADE_HARNESS_HQ,
        },
        augmentMat  =  tpz.items.FORGOTTEN_HOPE,
        augmentMultiplier  = 2.0,
    },
    hands =
    {
        items = {
            tpz.items.DARKSTEEL_GAUNTLETS,
            tpz.items.DARKSTEEL_GAUNTLETS_HQ,
            tpz.items.TIGER_GLOVES,
            tpz.items.FERAL_GLOVES,
            tpz.items.COEURL_GLOVES,
            tpz.items.TORAMA_GLOVES,
            tpz.items.SILK_CUFFS,
            tpz.items.SILK_CUFFS_HQ,
            tpz.items.SHADE_MITTENS,
            tpz.items.SHADE_MITTENS_HQ,
        },
        augmentMat  =  tpz.items.FORGOTTEN_TOUCH,
        augmentMultiplier  = 1.0,
    },
    legs =
    {
        items = {
            tpz.items.DARKSTEEL_CUISSES,
            tpz.items.DARKSTEEL_CUISSES_HQ,
            tpz.items.TIGER_TROUSERS,
            tpz.items.FERAL_TROUSERS,
            tpz.items.COEURL_TROUSERS,
            tpz.items.TORAMA_TROUSERS,
            tpz.items.SILK_SLOPS,
            tpz.items.SILK_SLOPS_HQ,
            tpz.items.SHADE_TIGHTS,
            tpz.items.SHADE_TIGHTS_HQ,
        },
        augmentMat  =  tpz.items.FORGOTTEN_JOURNEY,
        augmentMultiplier  = 1.5,
    },
    feet =
    {
        items = {
            tpz.items.DARKSTEEL_SABATONS,
            tpz.items.DARKSTEEL_SABATONS_HQ,
            tpz.items.TIGER_LEDELSENS,
            tpz.items.FERAL_LEDELSENS,
            tpz.items.COEURL_LEDELSENS,
            tpz.items.TORAMA_LEDELSENS,
            tpz.items.PIGACHES,
            tpz.items.PIGACHES_HQ,
            tpz.items.SHADE_LEGGINGS,
            tpz.items.SHADE_LEGGINGS_HQ,
        },
        augmentMat  =  tpz.items.FORGOTTEN_STEP,
        augmentMultiplier  = 1.0 
    },
};

local outputMessages = {
    [1] = 'The magical properties of this item are not very powerful.',
    [2] = 'The magical properties of this item are mild.',
    [3] = 'The magical properties of this item are good.',
    [4] = 'The magical properties of this item are powerful!',
    [5] = 'The magical properties of this item are very powerful!'
};

local function CalculateAugmentQuantity()
    local rnd = math.random()

    if rnd < 0.2 then
        return 1
    elseif rnd < 0.4 then
        return 2
    elseif rnd < 0.8 then
        return 3
    elseif rnd < 0.9 then
        return 4
    else
        return 5
    end
end

local function CalculateAugments(multiplier)
    -----------------------------------
    -- Augments go inside function so the table is made fresh each time.
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
        { Stat = tpz.augments.CONSERVE_MP, Power = 3, Used = false },
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

    local augmentQuantity = CalculateAugmentQuantity();    
    local augmentResult = {}
    for i = 1,augmentQuantity do
        local randomAugment;
        while (randomAugment == nil) or (randomAugment.Used) do
            if i < 5 then
                randomAugment = possibleAugments[math.random(#possibleAugments)]
            else
                randomAugment = possibleRareAugments[math.random(#possibleRareAugments)]
            end
        end

        local power = math.random(0, randomAugment.Power) * multiplier;
        augmentResult[#augmentResult + 1] = randomAugment.Stat;
        augmentResult[#augmentResult + 1] = power;
        randomAugment.Used = true
    end
    
    return augmentResult;
end

local function CheckAugment(trade)
    for slot,details in pairs(sets) do
        for _,item in ipairs(details.items) do
            if npcUtil.tradeHasExactly(trade, { item, details.augmentMat }) then
                local augments = CalculateAugments(details.augmentMultiplier);
                return {
                    Augments=augments,
                    Item=item,
                };
            end
        end
    end
end

local function DistributeAugment(player, augment)
    player:tradeComplete();
    player:addItem(augment.Item, 1, table.unpack(augment.Augments));
    local ID = zones[player:getZoneID()]
    player:PrintToPlayer("I will start the imbuing process on this item right away. Do not go anywhere!" ,0,"Taza")
    player:timer(3000, function(player)
        player:PrintToPlayer(outputMessages[#augment.Augments / 2],0,"Taza")
        player:messageSpecial(ID.text.ITEM_OBTAINED, augment.Item)
    end)
end


function onTrade(player, npc, trade)    
    local augment = CheckAugment(trade);
    if (type(augment) == 'table') and (augment.Item ~= nil) and (#augment.Augments > 1) then
        DistributeAugment(player, augment);
        return
    end
    player:PrintToPlayer("I can't do anything with those items.",0,"Taza");
end

function onTrigger(player, npc)
	player:PrintToPlayer("I can unlock the magical properties of the following items:",0,"Taza")
    player:PrintToPlayer("Dark Cuirass Set, Shade Harness Set, Tiger Jerkin Set, Silk Robe Set",0xF,"Taza")
end