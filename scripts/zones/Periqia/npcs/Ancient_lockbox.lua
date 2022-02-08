-----------------------------------
-- Area: Periqia
-- Ancient Lockbox
-----------------------------------
local ID = require("scripts/zones/Periqia/IDs")
require("scripts/globals/missions")
require("scripts/globals/appraisal")
-----------------------------------

function onTrigger(player, npc)
    local qItem =
    {
        [SEAGULL_GROUNDED] =
        {
            {
                {itemid = 2286, droprate = 1000}, -- ??? box
            },
            {
                {itemid = 2190, droprate = 1000}, -- ??? sword
            },
            {
                {itemid = 2195, droprate = 1000}, -- ??? gloves
            },
        },
        [REQUIEM] =
        {
            {
                {itemid = 2286, droprate = 400}, -- ??? box
                {itemid = 2195, droprate = 70},  -- ??? Gloves
                {itemid = 2192, droprate = 330}, -- ??? Polearm
                {itemid = 2193, droprate = 100}, -- ??? Axe
                {itemid = 0,    droprate = 100}, -- Nothing
            },
        },
    }
    local regItem =
    {
        [SEAGULL_GROUNDED] =
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
                {itemid = 2336, droprate = 1000}, -- Souolflayer Staff
            },
            {
                {itemid = 1724, droprate = 1000}, -- Soulflayer Robe
            },
            {
                {itemid = 2335, droprate = 1000}, -- Soulflayer Tentancle
            },
        },
        [REQUIEM] =
        {
            {
                {itemid = 4119, droprate = 500}, -- Hi Potion 3
                {itemid = 0,    droprate = 500}, -- Nothing
            },
            {
                {itemid = 13689, droprate = 100}, -- Hi-Ether Tank
                {itemid = 0,     droprate = 900}, -- Nothing
            },
            {
                {itemid = 4173, droprate = 500}, -- Hi-Reraiser
                {itemod = 0,    droprate = 500}, -- Nothing
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
