-----------------------------------
-- Area: Port Jeuno
--  NPC: Gekko
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4150,  2698,    -- Eye Drops
        4148,   328,    -- Antidote
        4151,   832,    -- Echo Drops
        4112,   946,    -- Potion
        4128,  5025,    -- Ether
        4365,   120,    -- Rolanberry
        189,  36000,    -- Autumn's End
        188,  31224,    -- Acolyte's Grief
        --5085, 50400,    -- Scroll of Regen IV
        4153,  1000,    -- Antacid
    }

    player:showText(npc, ID.text.GEKKO_SHOP_DIALOG)
    tpz.shop.general(player, stock, JEUNO)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
