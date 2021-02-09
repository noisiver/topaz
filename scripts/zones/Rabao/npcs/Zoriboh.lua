-----------------------------------
-- Area: Rabao
--  NPC: Zoriboh
-- Standard Info NPC
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/settings")
require("scripts/globals/quests")
local ID = require("scripts/zones/Rabao/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local ChasingDreams = player:getQuestStatus(OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS)
    if (player:getCharVar("ChasingDreams") == 1) then
        player:startEvent(119) 
    elseif (player:getCharVar("ChasingDreams") == 14) then
        player:startEvent(121)
    else
        player:startEvent(127)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
   if (csid == 127) then
       player:addQuest(OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS)
       player:setCharVar("ChasingDreams", 2)
   elseif (csid == 121) then
       player:setCharVar("ChasingDreams", 0)
       player:addGil(GIL_RATE*4000) 
       player:messageSpecial(ID.text.GIL_OBTAINED, 4000)
       player:addFame(RABAO, 300)
       player:addFame(NORG, 300)
       player:addItem(14655) -- Venerer Ring
       player:messageSpecial(ID.text.ITEM_OBTAINED, 14655)
       player:completeQuest(OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS)
   end
end
