-----------------------------------
-- Area: The Shrouded Maw
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/titles")
require("scripts/globals/quests")

local loot =
{
    -- ENM: Test Your Mite
    [705] =
    {
        {
            {itemid =     0, droprate =  950}, -- nothing
            {itemid =  1842, droprate =  050}, -- Cloud Evoker
        },
        {
            {itemid = 14675, droprate =  100}, -- Woodsman Ring
            {itemid = 15432, droprate =  100}, -- Quick Belt 
            {itemid = 14766, droprate =  100}, -- Geist Earring
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
