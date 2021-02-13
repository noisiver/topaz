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
            {itemid =     0, droprate =  400}, -- nothing
            {itemid = 17215, droprate =  240}, -- Thug's Zamburak
            {itemid = 16708, droprate =  240}, -- Horror Voulge 
            {itemid = 13550, droprate =  200}, -- Crossbowman's Ring
            {itemid = 14675, droprate =  150}, -- Woodsman Ring 
            {itemid = 13549, droprate =  300}, -- Ether Ring
        },
        {
            {itemid =     0, droprate =  400}, -- nothing
            {itemid = 17215, droprate =  240}, -- Thug's Zamburak
            {itemid = 16708, droprate =  240}, -- Horror Voulge 
            {itemid = 13550, droprate =  200}, -- Crossbowman's Ring
            {itemid = 14675, droprate =  150}, -- Woodsman Ring 
            {itemid = 13549, droprate =  300}, -- Ether Ring
        },
    },

    -- ENM: Bad Seed
    [963] =
    {
        {
            {itemid = 1769, droprate = 268},  -- Square of Galateia (26.8% Drop Rate)
            {itemid = 1764, droprate = 266},  -- Kejusu Satin
            {itemid = 1763, droprate = 342},  -- Viridian Urushi
        },
        {
            {itemid = 1842, droprate = 56},   -- Cloud Evoker (5.6% Drop Rate)
        },
        {
            {itemid = 17829, droprate = 82},  -- Hagun
            {itemid = 17945, droprate = 92},  -- Martial Axe
            {itemid = 17467, droprate = 63},  -- Martial Wand
            {itemid = 13690, droprate = 105}, -- Forager's Mantle
            {itemid = 13109, droprate = 121}, -- Harmonia's Torque
        },
    },

    -- ENM: Bugard in the Clouds
    [964] =
    {
        {
            {itemid = 1762, droprate = 375},  -- Cassia Lumber
            {itemid = 1767, droprate = 328},  -- Eltoro Leather
            {itemid = 1771, droprate = 263},  -- Dragon Bone
        },
        {
            {itemid = 1842, droprate = 188},  -- Cloud Evoker
        },
        {
            {itemid = 18099, droprate = 150}, -- Stone-splitter
            {itemid = 17365, droprate = 175}, -- Frenzy Fife
            {itemid = 18015, droprate = 238}, -- Blau Dolch
            {itemid = 4990, droprate = 238},  -- Scroll of Army's Paeon V
        },
        {
            {itemid = 18099, droprate = 150}, -- Stone-splitter
            {itemid = 17365, droprate = 175}, -- Frenzy Fife
            {itemid = 18015, droprate = 238}, -- Blau Dolch
            {itemid = 4990, droprate = 238},  -- Scroll of Army's Paeon V
        },
    },

    -- ENM: Beloved of the Atlante
    [965] =
    {
        {
            {itemid = 16976, droprate = 82},  -- Onimaru
            {itemid = 18015, droprate = 238}, -- Blau Dolch
            {itemid = 18099, droprate = 150}, -- Stone-splitter
            {itemid = 17946, droprate = 92},  -- Maneater
            {itemid = 18358, droprate = 63},  -- Wagh Baghnakhs
            {itemid = 17469, droprate = 65},  -- Raise II Rod
            {itemid = 17365, droprate = 175}, -- Frenzy Fife
            {itemid = 15464, droprate = 83},  -- Corse Cape
            {itemid = 1842, droprate = 188},  -- Cloud Evoker
            {itemid = 1763, droprate = 342},  -- Viridian Urushi
            {itemid = 1767, droprate = 328},  -- Eltoro Leather
            {itemid = 1841, droprate = 238},  -- Unicorn Horn
            {itemid = 1762, droprate = 375},  -- Cassia Lumber
            {itemid = 1771, droprate = 263},  -- Dragon Bone
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
