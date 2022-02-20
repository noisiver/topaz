-----------------------------------
-- Area: Leujaoam Sanctum
-- Ancient Lockbox
-----------------------------------
local ID = require("scripts/zones/Leujaoam_Sanctum/IDs")
require("scripts/globals/assault")
require("scripts/globals/appraisal")
-----------------------------------

function onTrigger(player, npc)
    local qItem =
    {
        [LEUJAOAM_CLEANSING] =
        {
            {
                {itemid = 2278, droprate = 1000}, -- ??? Ring
            },
            {
                {itemid = 2286, droprate = 1000}, -- ??? Box
            },
        },
    }
    local regItem =
    {
        [LEUJAOAM_CLEANSING] =
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
                {itemid = 2338, droprate = 1000}, -- Wamoura Scale
            },
            {
                {itemid = 2338, droprate = 1000}, -- Wamoura Scale
            },
            {
                {itemid = 2337, droprate = 1000}, -- Clump Of Wamoura Hair 
            },
            {
                {itemid = 2337, droprate = 1000}, -- Clump Of Wamoura Hair 
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
