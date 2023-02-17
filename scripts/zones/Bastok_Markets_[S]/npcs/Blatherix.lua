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
        21509, 999999999, 3,    -- Premium Mogti
        20571, 999999999, 3,    -- Infiltrator
        20665, 999999999, 3,    -- Kam'lanaut's Sword
        21682, 999999999, 3,    -- Lament
        21745, 999999999, 3,    -- Dullahan Axe
        21759, 999999999, 3,    -- Autarch's Axe
        21820, 999999999, 3,    -- Lost Sickle
        21862, 999999999, 3,    -- Mizukage Naginata
        21923, 999999999, 3,    -- Debahocho
        21977, 999999999, 3,    -- Mutsunokami
        21086, 999999999, 3,    -- Heartstopper
        22070, 999999999, 3,    -- Ranine Staff
        22112, 999999999, 3,    -- Mizukage-no-Yumi
        21272, 999999999, 3,    -- Troll Gun
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
