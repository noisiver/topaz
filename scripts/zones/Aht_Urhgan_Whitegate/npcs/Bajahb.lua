-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Bajahb
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/shop")

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local stock =
    {
        tpz.items.SIPAHI_TURBAN,    40260,
        tpz.items.JARIDAH_KHUD,     42840,
        tpz.items.TABIN_BERET,      40460,
        tpz.items.SIPAHI_JAWSHAN,   60921,
        tpz.items.JARIDAH_PETI,     60843,
        tpz.items.TABIN_JUPON,      60572,
        tpz.items.SIPAHI_DASTANA,   25986,
        tpz.items.JARIDAH_BAZUBANDS,25178,
        tpz.items.TABIN_BRACERS,    25590,
        tpz.items.SIPAHI_ZEREHS,    50329,
        tpz.items.JARIDAH_SALVARS,  50662,
        tpz.items.TABIN_HOSE,       50801,
        tpz.items.SIPAHI_BOOTS,     25336,
        tpz.items.JARIDAH_NAILS,    23899,
        tpz.items.TABIN_BOOTS,      23906
    }

    player:showText(npc, ID.text.BAJAHB_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
