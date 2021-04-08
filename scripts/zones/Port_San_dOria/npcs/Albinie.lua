-----------------------------------
-- Area: Port San d'Oria
--  NPC: Albinie
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        699, 5688, 3,    -- Oak Log
        644, 1800, 3,    -- Mythril Ore
        835,  225, 3,    -- Flax Flower
        694, 2543, 3,    -- Chestnut Log
        640,   10, 3,    -- Copper Ore
        643,  810, 3,    -- Iron Ore
        833,   18, 3,    -- Moko Grass
        4570,  50, 3,    -- Bird Egg
        698,   86, 3,    -- Ash Log
        1,   1800, 3,    -- Chocobo Bedding
    }

    player:showText(npc, ID.text.ALBINIE_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.SANDORIA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
