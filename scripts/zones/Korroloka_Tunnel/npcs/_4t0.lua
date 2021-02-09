-----------------------------------
-- Area: Korroloka Tunnel
--  NPC: Giant Clam
-- !pos 104.6370 -4.8000 15.4051 173
-----------------------------------
local ID = require("scripts/zones/Korroloka_Tunnel/IDs")
require("scripts/globals/quests")
-----------------------------------
function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
     local ChasingDreams = player:getQuestStatus(OUTLANDS, tpz.quest.id.outlands.CHASING_DREAMS)

     if (player:getCharVar("ChasingDreams") == 4) then
         player:messageSpecial(ID.text.CAREFULLY_DRAW_WATER) -- maybe wrong
         player:messageSpecial(ID.text.FLASK_FEELS_LIGHT) 
         player:setCharVar("ChasingDreams", 5)
     else
        player:messageSpecial(ID.text.CLAM_EMPTY) -- maybe wrong
     end
end

function onEventUpdate(player, csid, option)
    -- printf("CSID2: %u", csid)
    -- printf("RESULT2: %u", option)
end

function onEventFinish(player, csid, option)
end
