-----------------------------------
-- Area: Port Windurst
--  NPC: Uli Pehkowa
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        644, 1840, 3,    -- Mythril Ore
        835,  230, 3,    -- Flax Flower
        699, 5814, 3,    -- Oak Log
        698,   87, 3,    -- Ash Log
        694, 2599, 3,    -- Chestnut Log
        640,   11, 3,    -- Copper Ore
        643,  828, 3,    -- Iron Ore
        4570,  51, 3,    -- Bird Egg
        833,   18, 3,    -- Moko Grass
        114, 1840, 3,    -- My First Magic Kit
    }

    player:showText(npc, ID.text.ULIPEHKOWA_SHOP_DIALOG)
    tpz.shop.nation(player, stock, tpz.nation.WINDURST)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
