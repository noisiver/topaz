-----------------------------------
-- Area: Korroloka Tunnel
--  NPC: Giant Clam
-- !pos 104.6370 -4.8000 15.4051 173
-----------------------------------
local ID = require("scripts/zones/Korroloka_Tunnel/IDs")
require("scripts/globals/quests")
require("scripts/globals/keyitems")
-----------------------------------
function onTrade(player, npc, trade)
end

function onTrigger(player, npc)


     if (player:getCharVar("ChasingDreams") == 6) then
         player:messageSpecial(ID.text.CAREFULLY_DRAW_WATER, tpz.ki.FLASK_OF_CLAM_WATER) 
         player:messageSpecial(ID.text.FLASK_FEELS_LIGHT) 
         player:setCharVar("ChasingDreams", 7)
     else
        player:messageSpecial(ID.text.CLAM_EMPTY) 
     end
end

function onEventUpdate(player, csid, option)
    -- printf("CSID2: %u", csid)
    -- printf("RESULT2: %u", option)
end

function onEventFinish(player, csid, option)
end
