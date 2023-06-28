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
    -- ENM: Uninvited Guests
    [966] =
    {
        {
            {itemid = 4247, droprate = 1000},  -- Miratete's Memoirs
        },
        {
            {itemid = 5264, droprate = 1000},  -- Yellow Liquid
        },
        {
            {itemid = 5264, droprate = 1000},  -- Yellow Liquid
        },
        {
            {itemid = 5264, droprate = 1000},  -- Yellow Liquid
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1842, droprate =  500}, -- Cloud Evoker
        },
        {
            {itemid =     0, droprate =  900}, -- nothing
            {itemid = 14470, droprate =  100}, -- Assault Breastplate
        },
        {
            {itemid =     0, droprate =  950}, -- nothing
            {itemid = 65535, droprate = 50, amount = 10000},  -- gil
        },
        {
            {itemid =  0, droprate =  800}, -- nothing
            {itemid =  860, droprate = 50}, -- Behemoth's Hide 
            {itemid = 4486, droprate = 50}, -- Dragon Heart
            {itemid = 1313, droprate = 50}, -- Siren's Hair
            {itemid = 1312, droprate = 50}, -- Angel's Skin
        },
        {
            {itemid =  0, droprate =  800}, -- nothing
            {itemid = 1601, droprate = 50}, -- Mannequin Head
            {itemid = 1602, droprate = 50}, -- Mannequin Body
            {itemid = 1603, droprate = 50}, -- Mannequin Hands
            {itemid = 1604, droprate = 50}, -- Mannequin Legs
            {itemid = 1605, droprate = 50}, -- Mannequin Feet
        },
        {
            {itemid =   0, droprate =  400}, -- nothing
            {itemid = 1766, droprate = 50}, -- Tiger Eye 
            {itemid = 1765, droprate = 50}, -- Habu Skin
            {itemid = 1770, droprate = 50}, -- Oversized Fang
            {itemid =  646, droprate = 50},  -- Adaman Ore
            {itemid =  739, droprate = 50},  -- Orichalcum Ore
            {itemid =  678, droprate = 50}, -- Aluminum Ore
            {itemid =   61, droprate = 50},   -- Armoire
            {itemid = 1132, droprate = 50}, -- Raxa
            {itemid = 1841, droprate = 50}, -- Unicorn Horn
            {itemid =  908, droprate = 50},  -- Adamantoise Shell
            {itemid = 1771, droprate = 50},  -- Dragon Bone
            {itemid =  690, droprate = 50},  -- Elm Log
        },
        {
            {itemid =   0, droprate =  400}, -- nothing
            {itemid = 5144, droprate = 50},  -- Crimson Jelly
            {itemid = 5158, droprate = 50},  -- Vermillion Jelly
            {itemid = 4279, droprate = 50},  -- Tavnazian Salad
            {itemid = 5185, droprate = 50},  -- Leremieu Salad
            {itemid = 5142, droprate = 50},  -- Bison Steak
            {itemid = 5157, droprate = 50},  -- Marbled steak
            {itemid = 4544, droprate = 50},  -- Mushroom stew
            {itemid = 4344, droprate = 50},  -- Witch Stew
            {itemid = 4434, droprate = 50},  -- Mushroom Risotto
            {itemid = 4330, droprate = 50},  -- Witch Risotto
            {itemid = 4550, droprate = 50},  -- Bream Risotto
            {itemid = 4268, droprate = 50},  -- Sea Spray Risotto
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
