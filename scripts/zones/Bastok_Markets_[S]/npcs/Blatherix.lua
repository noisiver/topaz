-----------------------------------
-- Area: Bastok Markets (S) (F-8)
--  NPC: Blatherix
--  involved in Zilartian weapons
-----------------------------------
require("scripts/globals/items")
require("scripts/globals/npc_util")
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
    player:startEvent(29)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end
