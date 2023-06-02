-----------------------------------
-- Area: Spire of Vahzl
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")

local loot =
{
    -- ENM: Pulling the Plug
    [865] =
    {
        {
            {itemid = 5286, droprate =  125}, -- cluster_of_burning_memories
            {itemid = 5287, droprate =  125}, --  
            {itemid = 5288, droprate =  125}, -- 
            {itemid = 5289, droprate =  125}, -- 
            {itemid = 5290, droprate =  125}, -- 
            {itemid = 5291, droprate =  125}, -- 
            {itemid = 5292, droprate =  125}, -- 
            {itemid = 5293, droprate =  125}, -- cluster_of_malevolent_memories
        },
        {
            {itemid = 1793, droprate =  333}, -- 
            {itemid = 1794, droprate =  333}, -- 
            {itemid = 1795, droprate =  334}, -- 
        },
        {
            {itemid = 1796, droprate =  500}, -- 
            {itemid = 1797, droprate =  500}, --  
        },
        {
            {itemid =    0, droprate =  600}, -- nothing
            {itemid = 1790, droprate =  133}, -- 
            {itemid = 1791, droprate =  133}, -- 
            {itemid = 1792, droprate =  133}, -- 
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
