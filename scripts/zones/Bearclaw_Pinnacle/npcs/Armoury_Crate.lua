-----------------------------------
-- Area: Bearclaw Pinnacle
--  NPC: Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
-----------------------------------

local loot =
{
    -- ENM: Follow the White Rabbit
    [641] =
    {
        {
            {itemid =     0, droprate =  250}, -- nothing
            {itemid =  1769, droprate =  250}, -- Square of Galateia
            {itemid =  1764, droprate =  250}, -- Kejusu Satin
            {itemid =  1763, droprate =  250}, -- Viridian Urushi
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1842, droprate =   500}, -- Cloud Evoker
        },
        {
            {itemid =     0, droprate = 600}, -- nothing
            {itemid = 18380, droprate =  80}, -- Martial Sword
            {itemid = 17798, droprate =  80}, -- Shamo
            {itemid = 15301, droprate =  80}, -- Venturer's Belt
            {itemid = 14673, droprate =  80}, -- Serene Ring
            {itemid =  4748, droprate =  80}, -- Scroll of Raise III
        },
    },

    -- ENM: When Hell Freezes Over
    [642] =
    {
        {
            {itemid =     0, droprate =  250}, -- nothing
            {itemid =  1769, droprate =  250}, -- Square of Galateia
            {itemid =  1764, droprate =  250}, -- Kejusu Satin
            {itemid =  1763, droprate =  250}, -- Viridian Urushi
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1842, droprate =   500}, -- Cloud Evoker
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid = 18221, droprate =  66}, -- Martial Bhuj
            {itemid = 17210, droprate =  66}, -- Martial Gun
            {itemid = 17593, droprate =  66}, -- Martial Staff
            {itemid = 13628, droprate =  66}, -- Hexerei Cape
            {itemid = 13647, droprate =  66}, -- Settler's Cape
            {itemid =  4748, droprate =  66}, -- Scroll of Raise III
        },
    },

    -- ENM: Brothers
    [643] =
    {
        {
            {itemid =     0, droprate =  250}, -- nothing
            {itemid =  1767, droprate =  250}, -- Eltoro Leather
            {itemid =  1762, droprate =  250}, -- Cassia Lumber
            {itemid =  1771, droprate =  250}, -- Dragon Bone
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1842, droprate =   500}, -- Cloud Evoker
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid = 15302, droprate =  80}, -- Scouter's Rope
            {itemid = 17277, droprate =  80}, -- Hedgehog Bomb
            {itemid = 17707, droprate =  80}, -- Martial Anelace
            {itemid = 18098, droprate =  80}, -- Martial Lance
            {itemid =  4748, droprate =  80}, -- Scroll of Raise III
        },
    },

    -- ENM: Holy Cow
    [644] =
    {
        {
            {itemid =     0, droprate =  250}, -- nothing
            {itemid =  1771, droprate =  250}, -- Dragon Bone
            {itemid =  1767, droprate =  250}, -- Eltoro Leather
            {itemid =  1762, droprate =  250}, -- Cassia Lumber
        },
        {
            {itemid =     0, droprate =  500}, -- nothing
            {itemid =  1842, droprate =   500}, -- Cloud Evoker
        },
        {
            {itemid =     0, droprate =  600}, -- nothing
            {itemid = 17209, droprate =  80}, -- Martial Bow
            {itemid = 18356, droprate =  80}, -- Martial Knuckles
            {itemid = 13648, droprate =  80}, -- Gigant Mantle
            {itemid = 13694, droprate =  80}, -- Psilos Mantle
            {itemid =  4748, droprate =  80}, -- Scroll of Raise III
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
