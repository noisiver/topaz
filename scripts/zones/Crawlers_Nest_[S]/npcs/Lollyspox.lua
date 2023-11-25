-----------------------------------
-- Area: Crawlers Nest (S)
--  NPC: Lollyspox
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Crawlers_Nest_[S]/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4116,  1000,    -- Hi-Potion
        4132,  1200,    -- Hi-Ether
    }

    player:showText(npc, ID.text.LOLLYSPOX_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
