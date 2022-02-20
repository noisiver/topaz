-----------------------------------
-- Area: Ilrusi Atoll
--  NPC: Ancient Lockbox
-- !zone 55
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
-----------------------------------
-- Area: Ilrusi Atoll
-- Ancient Lockbox
-----------------------------------
local ID = require("scripts/zones/Ilrusi_Atoll/IDs")
require("scripts/globals/assault")
require("scripts/globals/appraisal")
-----------------------------------

function onTrigger(player, npc)
    local qItem =
    {
        [GOLDEN_SALVAGE] =
        {
            {
                {itemid = 2192, droprate = 1000}, -- ??? Polearm
            },
            {
                {itemid = 2286, droprate = 1000}, -- ??? box
            },
        },
        [LAMIA_NO_13] =
        {
            {
                {itemid = 2286, droprate = 350}, -- ??? Box
                {itemid = 2194, droprate = 300}, -- ??? Bow
                {itemid = 2196, droprate = 350}, -- ??? Footwear
                {itemid = 0, droprate = 100}, -- Nothing
            },
        },
    }
    local regItem =
    {
        [GOLDEN_SALVAGE] =
        {
            {
                {itemid = 5736, droprate = 1000}, -- Linen Coin Purse
            },
            {
                {itemid = 5736, droprate = 1000}, -- Linen Coin Purse
            },
            {
                {itemid = 5736, droprate = 1000}, -- Linen Coin Purse
            },
            {
                {itemid = 2167, droprate = 1000}, -- Lamian Armlet
            },
            {
                {itemid = 2167, droprate = 1000}, -- Lamian Armlet
            },
            {
                {itemid = 1869, droprate = 1000}, -- Lamia Skin 
            },
        },
        [LAMIA_NO_13] =
        {
            {
                {itemid = 4119, droprate = 1000}, -- Hi Potion 3
            },
            {
                {itemid = 13688, droprate = 290}, -- Hi potion tank
                {itemid = 0, droprate = 710}, -- Nothing
            },
            {
                {itemid = 13689, droprate = 290}, -- Hi ether tank
                {itemid = 0, droprate = 710}, -- Nothing
            },
            {
                {itemid = 4173, droprate = 290}, -- Hi reraiser
                {itemid = 0, droprate = 710}, -- Nothing
            },
        },
    }
    local area = player:getCurrentAssault()
    assaultChestTrigger(player, npc, qItem[area], regItem[area], ID.text)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
