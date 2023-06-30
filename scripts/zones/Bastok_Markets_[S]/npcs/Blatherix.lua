-----------------------------------
-- Area: Bastok Markets (S) (F-8)
--  NPC: Blatherix
--  Involved in Zilartian weapons
-- !gotoid 17134141
-----------------------------------
require("scripts/globals/items")
require("scripts/globals/npc_util")
require("scripts/globals/shop")

local ID = require("scripts/zones/Bastok_Markets_[S]/IDs")
-----------------------------------

local trades =
{
    { tpz.items.ZILARTIAN_ORB, tpz.items.L_ZILARTIAN_ORB},
    { tpz.items.KULUU_SPHERE, tpz.items.L_KULUU_SPHERE},
    { tpz.items.CONDENSED_EMPTYNESS, tpz.items.L_CONDENSED_EMPTYNESS},
}

function onTrade(player, npc, trade)
    for _, currency in pairs(trades) do
        if npcUtil.tradeHasExactly(trade, { {currency[1], 100} }, true) then
            player:addItem(currency[2], 1)
            player:confirmTrade()
            player:PrintToPlayer("You give me 100, I give ya 1. Here ya go!" ,0,"Blatherix")
            player:messageSpecial(ID.text.ITEM_OBTAINED, currency[2])
        end
    end
end

function onTrigger(player, npc)
    local stock =
    {
        tpz.items.MAMMOMS_ARM,  999999999, 3,
        tpz.items.SCHALAS_DAGGER, 999999999, 3,
        tpz.items.ZEALS_SWORD, 999999999, 3,
        tpz.items.SLASHS_SABER, 999999999, 3,
        tpz.items.NUS_AXE, 999999999, 3,
        tpz.items.CYRUS_BHUJ, 999999999, 3,
        tpz.items.JANUS_SICKLE, 999999999, 3,
        tpz.items.LAVOS_NEEDLE, 999999999, 3,
        tpz.items.AZALAS_KUNAI, 999999999, 3,
        tpz.items.GLENNS_TACHI, 999999999, 3,
        tpz.items.FLEAS_WAND, 999999999, 3,
        tpz.items.MELCHIOS_WAND, 999999999, 3,
        tpz.items.LEENES_BOW, 999999999, 3,
        tpz.items.DALTONS_GUN, 999999999, 3,
        -- 22070, 999999999, 3,    -- Shield NYI?
        -- 22070, 999999999, 3,    -- Instrument NYI?
    }

    player:PrintToPlayer("Not much business in weapons anymore. But I like it that way.",0,"Blatherix")
    tpz.shop.nation(player, stock, tpz.nation.BASTOK)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
