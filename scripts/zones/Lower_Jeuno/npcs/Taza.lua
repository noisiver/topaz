-----------------------------------
-- Area: Lower Jeuno
--  NPC: Taza
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")

function onTrade(player, npc, trade)

   
    if (trade:hasItemQty(13120, 1) and trade:getItemCount() == 1) then
            player:tradeComplete()
            player:addItem(13120,1,514,4)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 13120)
     end
end