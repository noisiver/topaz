-----------------------------------
-- Area: Ru'Lude Gardens
--  NPC: Harith
-- Type: Standard NPC
-- !pos -4.349 1 134.014 243
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
local ID = require("scripts/zones/RuLude_Gardens/IDs")
-----------------------------------

function onTrade(player, npc, trade)

    if (player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.EMPTY_MEMORIES) >= QUEST_ACCEPTED) then
        local count = trade:getItemCount()
        local reward = 0
        local anima = 0

        if (trade:hasItemQty(1759, 1) and count == 1) then -- Recollection of Suffering --> Hamayumi
            reward = 17208
        elseif (trade:hasItemQty(1760, 1) and count == 1) then -- Recollection of Animosity --> Dia Wand
            reward = 17466
        elseif (trade:hasItemQty(1761, 1) and count == 1) then -- Recollection of Anxiety --> Stone Gorget
            reward = 13177
        elseif npcUtil.tradeHas(trade, { 1688,  {'gil', 2000} }, true) then -- Recollection of Pain --> Hysteroanima (Amnesia)
            anima = 5262
        elseif npcUtil.tradeHas(trade, { 1689,  {'gil', 2000} }, true) then -- Recollection of Guilt --> Terroanima (Run in Terror)
            anima = 5263
        elseif npcUtil.tradeHas(trade, { 1687,  {'gil', 2000} }, true) then -- Recollection of Fear --> Psychoanima (Intimidation)
            anima = 5261
        end

        if (reward > 7000) then
            if (player:getFreeSlotsCount() >= 1) then
                player:setCharVar("harithreward", reward)
                player:startEvent(110)
            else
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, reward)
            end
        elseif (anima > 5000) then
            if (player:getFreeSlotsCount() == 0) then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, anima)
            elseif (trade:getGil() ~= 2000) then
                player:startEvent(108, 2000)
            else
                player:setCharVar("harithreward", anima)
                player:startEvent(109)
            end
        end
    end

end

function onTrigger(player, npc)

    if (player:getCurrentMission(COP) == tpz.mission.id.cop.BELOW_THE_ARKS and player:getCharVar("PromathiaStatus") == 1 and player:getCharVar("HarithIntro") == 0) then
        player:startEvent(113)
    elseif (player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.EMPTY_MEMORIES) == QUEST_AVAILABLE) then
        player:addQuest(JEUNO, tpz.quest.id.jeuno.EMPTY_MEMORIES)
        player:startEvent(114)
    elseif (player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.EMPTY_MEMORIES) >= QUEST_ACCEPTED) then
        player:startEvent(114)
    else
        player:startEvent(111)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if (csid == 110 or csid == 109) then
        local objecttrade = player:getCharVar("harithreward")

        player:tradeComplete()
        player:addItem(objecttrade)
        player:messageSpecial(ID.text.ITEM_OBTAINED, objecttrade)
        player:setCharVar("harithreward", 0)
        if (player:getQuestStatus(JEUNO, tpz.quest.id.jeuno.EMPTY_MEMORIES) == QUEST_ACCEPTED) then
            player:addFame(JEUNO, 30)
            player:completeQuest(JEUNO, tpz.quest.id.jeuno.EMPTY_MEMORIES)
        else
            player:addFame(JEUNO, 5)
        end
    elseif (csid == 113 and option == 1) then
       player:setCharVar("HarithIntro", 1)
    end
end
