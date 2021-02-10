-----------------------------------
-- Area: Norg
--   NPC: Vishwas
-- Type: Standard NPC
-- !pos 44.028 -7.282 13.663 252
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
   if (player:getCharVar("ChasingDreams") == 3) then
       player:startEvent(219)
   elseif (player:getCharVar("ChasingDreams") == 9) then
       player:startEvent(220)
   else
        player:startEvent(218)
   end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
