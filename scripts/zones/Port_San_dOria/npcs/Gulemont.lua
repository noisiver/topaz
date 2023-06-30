-----------------------------------
-- Area: Port San d'Oria
--   NPC: Gulemont
-- Type: Quest Giver
-- !pos -69 -5 -38 232
--
-- Starts and Finishes Quest: The Dismayed Customer
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)

    local theDismayedCustomer = player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.THE_DISMAYED_CUSTOMER)
    if (theDismayedCustomer == QUEST_ACCEPTED) then
        if (player:hasKeyItem(tpz.ki.GULEMONTS_DOCUMENT) == true) then
            player:startEvent(607)
        else
            player:startEvent(606)
        end
    elseif (theDismayedCustomer == QUEST_AVAILABLE and player:getQuestStatus(SANDORIA, tpz.quest.id.sandoria.A_TASTE_FOR_MEAT) == QUEST_COMPLETED) then
        player:startEvent(605)
    else
        player:startEvent(593)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    -- "The Dismayed Customer"
    if (csid == 605 and option == 0) then
        player:addQuest(SANDORIA, tpz.quest.id.sandoria.THE_DISMAYED_CUSTOMER)
        player:setCharVar("theDismayedCustomer", math.random(1, 3))
    elseif (csid == 607) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:delKeyItem(tpz.ki.GULEMONTS_DOCUMENT)
            player:addExp(4500 * EXP_RATE)
            player:addFame(SANDORIA, 300)
            player:addTitle(tpz.title.LOST_CHILD_OFFICER)
            player:completeQuest(SANDORIA, tpz.quest.id.sandoria.THE_DISMAYED_CUSTOMER)
            player:addGil(560*GIL_RATE)
            player:messageSpecial(ID.text.GIL_OBTAINED, 560*GIL_RATE)
            player:addItem(tpz.items.COTTON_GAITERS, 1, 99, 34) -- Pet: DEF+35
            player:messageSpecial(ID.text.ITEM_OBTAINED, tpz.items.COTTON_GAITERS)
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, tpz.items.COTTON_GAITERS)
        end
    end

end
