-----------------------------------
-- Area:Spire of Dem
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")

local loot =
{
    -- ENM: You Are What You Eat
    [801] =
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
            {itemid =    0, droprate =  700}, -- nothing
            {itemid = 1800, droprate =  60}, -- Violent
            {itemid = 1803, droprate =  60}, -- Painful
            {itemid = 1805, droprate =  60}, -- Timorous
            {itemid = 1808, droprate =  60}, -- Brilliant
            {itemid = 1811, droprate =  60}, -- Venerable
        },
    }
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
