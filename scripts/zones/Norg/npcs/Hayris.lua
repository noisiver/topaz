-----------------------------------
-- Area: Norg
--   NPC: Hayris
-- Type: Standard NPC
-- !pos 45.296 -7.282 12.267 252
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
   if (player:getCharVar("ChasingDreams") == 3) or (player:getCharVar("ChasingDreams") == 4 then
       player:startEvent(216)
   elseif (player:getCharVar("ChasingDreams") == 9) then
       player:startEvent(217)
   else    
       player:startEvent(215)
   end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
