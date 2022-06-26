-----------------------------------
-- Area: Lower Jeuno
--  NPC: Taza
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/items")
-----------------------------------

local trades =
{
    -- Base item, augment item, amount, gil, augmentID, amount
    { tpz.items.TITANS_CUDGEL, tpz.items.TITATEAR, 1, 250000, 45, 14 },
}




function onTrade(player, npc, trade)
    for i,IDs in pairs(trades) do
        print(trades[2])
        if npcUtil.tradeHas(trade, {{IDs[1], 1}, {IDs[2], IDs[3]}, {"gil", IDs[4]}}) then
            player:confirmTrade()
			player:delGil(IDs[4])
            player:addItem(IDs[1], 1, IDs[5], IDs[6])
            player:PrintToPlayer("I have successfully augmented your item and the the magical properties have been revealed!",0,"Taza")
            player:messageSpecial(ID.text.ITEM_OBTAINED, IDs[1])
        end
    end
end


function onTrigger(player, npc)
	player:PrintToPlayer("Do you have magical items you would like to augment? I can help!",0,"Taza")
end