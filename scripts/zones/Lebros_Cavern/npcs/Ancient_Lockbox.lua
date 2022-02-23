-----------------------------------
-- Area: Lebros Cavern
-- Ancient Lockbox
-----------------------------------
local ID = require("scripts/zones/Lebros_Cavern/IDs")
require("scripts/globals/assault")
require("scripts/globals/appraisal")
-----------------------------------

function onTrigger(player, npc)
    local qItem =
    {
        [EXCAVATION_DUTY] =
        {
            {
                {itemid = 2286, droprate = 1000}, -- ??? Box
            },
            {
                {itemid = 2277, droprate = 1000}, -- ??? Earring
            },
        },
        [LEBROS_SUPPLIES] =
        {
            {
                {itemid = 2286, droprate = 600}, -- ??? Box
                {itemid = 2279, droprate = 300}, -- ??? Cape
                {itemid = 0,    droprate = 100}, -- Nothing
            },
        },
    }
    local regItem =
    {
        [EXCAVATION_DUTY] =
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
                {itemid = 2160, droprate = 1000}, -- Troll Pauldron
            },
            {
                {itemid = 2161, droprate = 1000}, -- Troll Vambrace
            },
        },
        [LEBROS_SUPPLIES] =
        {
            {
                {itemid = 4155, droprate = 800}, -- Remedy
                {itemid = 0,    droprate = 200}, -- Nothing
            },
            {
                {itemid = 4172, droprate = 200}, -- Reraiser
                {itemid = 0,    droprate = 800}, -- Nothing
            },
            {
                {itemid = 13688, droprate = 200}, -- Hi-Potion Tank
                {itemid = 0,     droprate = 800}, -- Nothing
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
