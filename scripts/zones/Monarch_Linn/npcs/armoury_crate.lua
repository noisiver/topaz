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
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1842, droprate =  500}, -- Cloud Evoker
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

    -- ENM: Bad Seed
    [963] =
    {
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1842, droprate =  500}, -- Cloud Evoker
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid = 15433, droprate =  100}, -- Reverend Sash 
            {itemid = 15434, droprate =  100}, -- Vanguard Belt  
            {itemid = 14675, droprate =  100}, -- Woodsman Ring 
        },
    },

    -- ENM: Bugard in the Clouds
    [964] =
    {
        {
            {itemid = 678, droprate = 1000},  -- Aluminum Ore 
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1842, droprate =  500}, -- Cloud Evoker
        },
        {
            {itemid = 678,   droprate = 600}, -- Aluminum Ore 
            {itemid = 14682, droprate = 100}, -- Kshama Ring No. 2
            {itemid = 14683, droprate = 100}, -- Kshama Ring No. 4
            {itemid = 14685, droprate = 100},  -- Kshama Ring No. 5
            {itemid = 14686, droprate = 100},  -- Kshama Ring No. 9
        },
        {
            {itemid =     0, droprate = 600}, -- nothing
            {itemid = 17133, droprate = 133}, -- Chanter's Staff 
            {itemid = 16965, droprate = 133}, -- Koryukagemitsu 
            {itemid = 18411, droprate = 133}, -- Buboso 
        },
    },

    -- ENM: Beloved of the Atlante
    [965] =
    {
        {
            {itemid = 678, droprate = 1000},  -- Aluminum Ore
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1842, droprate =  500}, -- Cloud Evoker
        },
        {
            {itemid = 678, droprate = 600}, -- Aluminum Ore 
            {itemid = 14682, droprate = 100}, -- Kshama Ring No. 2
            {itemid = 14683, droprate = 100}, -- Kshama Ring No. 4
            {itemid = 14685, droprate = 100},  -- Kshama Ring No. 5
            {itemid = 14686, droprate = 100},  -- Kshama Ring No. 9
        },
        {
            {itemid = 678, droprate = 600}, -- Aluminum Ore 
            {itemid = 14684, droprate = 133}, -- Kshama Ring No. 3
            {itemid = 14687, droprate = 133}, -- Kshama Ring No. 6
            {itemid = 13551, droprate = 133},  -- Kshama Ring No. 8
        },
        {
            {itemid = 678, droprate = 600}, -- Aluminum Ore 
            {itemid = 17133, droprate = 100}, -- Chanter's Staff 
            {itemid = 16965, droprate = 100}, -- Koryukagemitsu 
            {itemid = 18411, droprate = 100}, -- Buboso
            {itemid = 17468, droprate = 100}, -- Raise Rod  
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
