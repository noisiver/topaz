-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Geltpix
-- !pos 154 -2 103 80
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria_[S]/IDs")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        4116,  4500,   -- Hi-Potion
        4132, 28000,   -- Hi-Ether
        1021,   500,   -- Hatchet
        2554,   1000   -- Asphodel
        4153,  1000,    -- Antacid
    }

    player:showText(npc, 7043) -- Don't hurt poor Geltpix! Geltpix's just a merchant from Boodlix's Emporium in Jeuno. Kingdom vendors don't like gil, but Boodlix knows true value of new money.
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
