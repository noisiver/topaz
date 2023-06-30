-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Parvipon
-- Starts and Finishes Quest: The Merchant's Bidding (R)
-- !pos -169 -1 13 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/settings")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    if (player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.THE_MERCHANT_S_BIDDING) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(856, 3) and trade:getItemCount() == 3) then
            player:startEvent(89)
        end
    end
end

function onTrigger(player, npc)

TheMerchantsBidding = player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.THE_MERCHANT_S_BIDDING)

    if (TheMerchantsBidding == QUEST_AVAILABLE) then
        player:startEvent(90)
    else
        player:startEvent(88)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if (csid == 90 and option == 1) then
        player:addQuest(SANDORIA, tpz.quest.id.sandoria.THE_MERCHANT_S_BIDDING)
    elseif (csid == 89) then
        player:tradeComplete()
        player:addGil(GIL_RATE*120)
        player:messageSpecial(ID.text.GIL_OBTAINED, GIL_RATE*120)
        if (player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.THE_MERCHANT_S_BIDDING) == QUEST_ACCEPTED) then
            if (player:getFreeSlotsCount(0) >= 1) then
                player:addExp(2500 * EXP_RATE)
                player:addFame(SANDORIA, 300)
                player:addItem(13192, 1, 512, 0) -- STR+1
                player:messageSpecial(ID.text.ITEM_OBTAINED, 13192) -- Leather Belt
                player:completeQuest(SANDORIA, tpz.quest.id.sandoria.THE_MERCHANT_S_BIDDING)
            else
                player:addFame(SANDORIA, 10)
            end
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 13192) -- Leather Belt
        end
    end

end
