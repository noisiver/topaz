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
    if (trade:hasItemQty(13965, 1) and trade:hasItemQty(3495, 150) and trade:hasItemQty(6255, 1) and trade:getGil() == 1000000 and tradeCount == 4) then
            player:tradeComplete()
            player:addItem(13965, 1, 138, 0)
            player:PrintToPlayer("I have successfully augmented your item and the the magical properties have been revealed!",0,"Taza")
            player:messageSpecial(ID.text.ITEM_OBTAINED, 13965)
    end
end

function onTrigger(player, npc)
	player:PrintToPlayer("Do you have magical items you would like to augment? I can help!",0,"Taza")
end