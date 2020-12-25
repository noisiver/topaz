-----------------------------------
-- Area: Selbina
--  NPC: Quelpia
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
        4610,   676,    -- Scroll of Cure II
        4611,  3768,    -- Scroll of Cure III
        4616, 11648,    -- Scroll of Curaga II
        4620,  5984,    -- Scroll of Raise
        4629, 36400,    -- Scroll of Holy
        4632, 11648,    -- Scroll of Dia II
        4637,  9360,    -- Scroll of Banish II
        4652,  7356,    -- Scroll of Protect II
        4657, 18304,    -- Scroll of Shell II
        4665, 20800,    -- Scroll of Haste
        4708,  5366,    -- Scroll of Enfire
        4709,  4261,    -- Scroll of Enblizzard
        4710,  2600,    -- Scroll of Enaero
        4711,  2111,    -- Scroll of Enstone
        4712,  1575,    -- Scroll of Enthunder
        4713,  7356,    -- Scroll of Enwater
    }

    player:showText(npc, ID.text.QUELPIA_SHOP_DIALOG)
    tpz.shop.general(player, stock, SELBINA)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
