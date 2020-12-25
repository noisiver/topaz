-----------------------------------
-- Area: Selbina
--  NPC: Chutarmire
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Selbina/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4768,  6645,    -- Scroll of Stone II
        4778,  9360,    -- Scroll of Water II
        4763, 13832,    -- Scroll of Aero II
        4753, 19136,    -- Scroll of Fire II
        4758, 25272,    -- Scroll of Blizzard II
        4773, 32240,    -- Scroll of Thunder II
        4797,  1346,    -- Scroll of Stonega
        4807,  2423,    -- Scroll of Waterga
        4792,  4792,    -- Scroll of Aeroga
        4782,  8118,    -- Scroll of Firaga
        4787, 12376,    -- Scroll of Blizzaga
        4802, 17472,    -- Scroll of Thundaga
        4829, 26208,    -- Scroll of Poison II
        4839, 14560,    -- Scroll of Bio II
        4833,  5366,    -- Scroll of Poisonga
        4859,  9360,    -- Scroll of Shock Spikes
    }

    player:showText(npc, ID.text.CHUTARMIRE_SHOP_DIALOG)
    tpz.shop.general(player, stock, SELBINA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
