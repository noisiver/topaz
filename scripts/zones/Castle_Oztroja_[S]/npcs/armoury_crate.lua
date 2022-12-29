-----------------------------------
-- Area: Monarch Linn
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")

local loot =
{
    -- ENM: Fire in the Sky
    [962] =
    {
        {
            {itemid =     0, droprate =  950}, -- nothing
            {itemid =  1842, droprate =  050}, -- Cloud Evoker
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid = 17215, droprate =  80}, -- Thug's Zamburak
            {itemid = 16708, droprate =  80}, -- Horror Voulge 
            {itemid = 13550, droprate =  80}, -- Crossbowman's Ring
            {itemid = 14675, droprate =  80}, -- Woodsman Ring 
            {itemid = 13549, droprate =  80}, -- Ether Ring
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid = 17215, droprate =  80}, -- Thug's Zamburak
            {itemid = 16708, droprate =  80}, -- Horror Voulge 
            {itemid = 13550, droprate =  80}, -- Crossbowman's Ring
            {itemid = 14675, droprate =  80}, -- Woodsman Ring 
            {itemid = 13549, droprate =  80}, -- Ether Ring
        },
    },
}

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        tpz.battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
