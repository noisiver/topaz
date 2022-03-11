-----------------------------------
-- Area: Mamool Ja Training Grounds
-- Ancient Lockbox
-----------------------------------
local ID = require("scripts/zones/Mamool_Ja_Training_Grounds/IDs")
require("scripts/globals/appraisal")
require("scripts/globals/missions")
-----------------------------------

function onTrigger(player, npc)
    local qItem =
    {
        [IMPERIAL_AGENT_RESCUE] =
        {
            {
                {itemid = 2286, droprate = 1000}, -- ??? box
            },
            {
                {itemid = 2278, droprate = 1000}, -- ??? ring
            },
        },
        [PREEMPTIVE_STRIKE] =
        {
            {
                {itemid = 2286, droprate = 600}, -- ??? Box
                {itemid = 2282, droprate = 300}, -- ??? Necklace
                {itemid =    0, droprate = 100}, -- Nothing
            },
        },
    }
    local regItem =
    {
        [IMPERIAL_AGENT_RESCUE] =
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
                {itemid = 2227, droprate = 1000}, -- Mamool Ja Collar
            },
            {
                {itemid = 2162, droprate = 1000}, -- Mamool Ja Helmet
            },
        },
        [PREEMPTIVE_STRIKE] =
        {
            {
                {itemid = 13688, droprate = 100}, -- Hi-Potion Tank
                {itemid =     0, droprate = 900}, -- Nothing
            },
            {
                {itemid = 4172, droprate = 300}, -- Reraiser
                {itemid =    0, droprate = 700}, -- Nothing
            },
            {
                {itemid = 4173, droprate = 500}, -- Hi-Reraiser
                {itemid =    0, droprate = 500}, -- Nothing
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
