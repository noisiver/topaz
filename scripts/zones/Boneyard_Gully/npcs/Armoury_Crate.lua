-----------------------------------
-- Area: Boneyard Gully
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")

local loot =
{
    -- ENM: Like the Wind
    [673] =
    {
        {
            {itemid =     0, droprate =  800}, -- nothing
            {itemid =  1763, droprate =  50},-- Viridian Urushi
            {itemid =  1769, droprate =  50},-- Square of Galateia
            {itemid =  1764, droprate =  50},-- Kejusu Satin
        },
        {
            {itemid =     0, droprate =  950}, -- nothing
            {itemid =  1842, droprate =  50}, -- Cloud Evoker
        },
        {
            {itemid =     0, droprate =  800}, -- nothing
            {itemid = 17946, droprate =  50}, -- Maneater
            {itemid = 18358, droprate =  50}, -- Wagh Baghnakhs
            {itemid = 16976, droprate =  50}, -- Onimaru
            {itemid =  4990, droprate =  50}, -- Army's Paeon V
        },
    },

    -- ENM: Sheep in Antlion's Clothing
    [674] =
    {
        {
            {itemid =   0, droprate =  800}, -- nothing
            {itemid = 1769, droprate = 50}, -- Square of Galateia (26.8% Drop Rate)
            {itemid = 1764, droprate = 50}, -- Kejusu Satin
            {itemid = 1763, droprate = 50}, -- Viridian Urushi
        },
        {
            {itemid =  0, droprate =  950}, -- nothing
            {itemid = 1842, droprate = 50},   -- Cloud Evoker (5.6% Drop Rate)
        },
        {
            {itemid =   0, droprate =  800}, -- nothing
            {itemid = 17829, droprate = 40}, -- Hagun
            {itemid = 17945, droprate = 40}, -- Martial Axe
            {itemid = 17467, droprate = 40}, -- Martial Wand
            {itemid = 13690, droprate = 40}, -- Forager's Mantle
            {itemid = 13109, droprate = 40}, -- Harmonia's Torque
        },
    },

    -- ENM: Shell We Dance?
    [675] =
    {
        {
            {itemid =   0, droprate =  800}, -- nothing
            {itemid = 1762, droprate = 50}, -- Cassia Lumber
            {itemid = 1767, droprate = 50}, -- Eltoro Leather
            {itemid = 1771, droprate = 50}, -- Dragon Bone
        },
        {
            {itemid =   0, droprate =  950}, -- nothing
            {itemid = 1842, droprate = 50},  -- Cloud Evoker
        },
        {
            {itemid =    0, droprate =  800}, -- nothing
            {itemid = 18099, droprate = 50}, -- Stone-splitter
            {itemid = 17365, droprate = 50}, -- Frenzy Fife
            {itemid = 18015, droprate = 50}, -- Blau Dolch
            {itemid = 4990, droprate =  50},  -- Scroll of Army's Paeon V
        },
    },

    -- ENM: Totentanz
    [676] =
    {
        {
            {itemid =    0, droprate =  800}, -- nothing
            {itemid = 16976, droprate = 50},  -- Onimaru
            {itemid = 18015, droprate = 50}, -- Blau Dolch
            {itemid = 18099, droprate = 50}, -- Stone-splitter
            {itemid = 17469, droprate = 50},  -- Raise II Rod
        },
        {
            {itemid =    0, droprate =  800}, -- nothing
            {itemid = 17946, droprate = 50},  -- Maneater
            {itemid = 18358, droprate = 50},  -- Wagh Baghnakhs
            {itemid = 17365, droprate = 50}, -- Frenzy Fife
            {itemid = 17469, droprate = 50},  -- Raise II Rod
        },
        {
            {itemid =   0, droprate =  800}, -- nothing
            {itemid = 1763, droprate = 40},  -- Viridian Urushi
            {itemid = 1767, droprate = 40},  -- Eltoro Leather
            {itemid = 1841, droprate = 40},  -- Unicorn Horn
            {itemid = 1762, droprate = 40},  -- Cassia Lumber
            {itemid = 1771, droprate = 40},  -- Dragon Bone
        },
        {
            {itemid =  0, droprate =  950}, -- nothing
            {itemid = 1842, droprate = 50},    -- Cloud Evoker
        }
    },

    -- Quest: Requiem of Sin
    [676] =
    {
        {
            {itemid =    0, droprate =  800}, -- nothing
            {itemid = 16976, droprate = 50},  -- Onimaru
            {itemid = 18015, droprate = 50}, -- Blau Dolch
            {itemid = 18099, droprate = 50}, -- Stone-splitter
            {itemid = 17469, droprate = 50},  -- Raise II Rod
        },
        {
            {itemid =    0, droprate =  800}, -- nothing
            {itemid = 17946, droprate = 50},  -- Maneater
            {itemid = 18358, droprate = 50},  -- Wagh Baghnakhs
            {itemid = 17365, droprate = 50}, -- Frenzy Fife
            {itemid = 17469, droprate = 50},  -- Raise II Rod
        },
        {
            {itemid =   0, droprate =  800}, -- nothing
            {itemid = 1763, droprate = 40},  -- Viridian Urushi
            {itemid = 1767, droprate = 40},  -- Eltoro Leather
            {itemid = 1841, droprate = 40},  -- Unicorn Horn
            {itemid = 1762, droprate = 40},  -- Cassia Lumber
            {itemid = 1771, droprate = 40},  -- Dragon Bone
        },
        {
            {itemid =  0, droprate =  950}, -- nothing
            {itemid = 1842, droprate = 50},    -- Cloud Evoker
        }
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
