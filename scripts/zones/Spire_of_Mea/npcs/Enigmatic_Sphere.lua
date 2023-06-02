-----------------------------------
-- Area: Spire of Mea
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")

local loot =
{
    -- ENM: Playing Host
    [833] =
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
            {itemid =    0, droprate =  600}, -- nothing
            {itemid = 1801, droprate =  80}, -- Solemn
            {itemid = 1804, droprate =  80}, -- Valiant
            {itemid = 1806, droprate =  80}, -- Pretentious
            {itemid = 1809, droprate =  80}, -- Malicious
            {itemid = 1812, droprate =  80}, -- Pristine
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
