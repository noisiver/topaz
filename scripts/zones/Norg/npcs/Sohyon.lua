-----------------------------------
-- Area: Norg
--   NPC: Sohyon
-- Type: Standard NPC
-- !pos 47.286 -7.282 13.873 252
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
   local ChasingDreams = player:getQuestStatus(OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS)

   if (player:getCharVar("ChasingDreams") == 3) then
       player:startEvent(213)
   elseif (player:getCharVar("ChasingDreams") == 2) then
       player:startEvent(209)
       elseif (player:getCharVar("ChasingDreams") == 8) then
       player:startEvent(210)
   elseif (player:getCharVar("ChasingDreams") == 9) then
       player:startEvent(214)
       else
       player:startEvent(212)
   end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
     if (csid == 209) then
        player:setCharVar("ChasingDreams", 3)
     elseif (csid == 210) then
        player:setCharVar("ChasingDreams", 9)
        npcUtil.giveKeyItem(player, tpz.ki.STOREROOM_KEY)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, STOREROOM_KEY) -- maybe wrong
     end
end
