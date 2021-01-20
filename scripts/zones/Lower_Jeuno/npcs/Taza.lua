-----------------------------------
-- Area: Lower Jeuno
--  NPC: Taza
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")

--function onTrade(player, npc, trade)

     --if (trade:hasItemQty(13120, 1) and trade:getItemCount() == 1) then
        --    player:tradeComplete()
      --      player:addItem(13120,1,514,4)
    --        player:messageSpecial(ID.text.ITEM_OBTAINED, 13120)
  --   end
--end

function onTrade(player, npc, trade)
    local tradeCount = trade:getItemCount()
    if (trade:hasItemQty(13781, 1) and trade:hasItemQty(12587, 1) and tradeCount == 2) then
            player:tradeComplete()
            player:addItem(13781,1,23,9,1152,0)
            player:PrintToPlayer("I have successfully augmented your item and the the magical properties have been revealed!",0,"Taza")
            player:messageSpecial(ID.text.ITEM_OBTAINED, 13781)
    end
end