-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Ahaadah
-- !pos -70 -6 105 50
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.THE_PRANKSTER) == QUEST_AVAILABLE) then
        player:startEvent(1)
    elseif (player:getCharVar("ThePrankster") == 1) then
        player:startEvent(15)
    elseif (player:getCharVar("ThePrankster") == 2) then
        player:startEvent(16)
    elseif (player:getCharVar("ThePrankster") == 4) then
        player:startEvent(17)
    else
        player:startEvent(870)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 1) then
        player:addQuest(AHT_URHGAN, tpz.quest.id.ahtUrhgan.THE_PRANKSTER)
        player:setCharVar("ThePrankster", 1)
    end
end
