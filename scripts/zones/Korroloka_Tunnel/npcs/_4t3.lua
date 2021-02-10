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


     if (player:getCharVar("ChasingDreams") == 7) then
         player:messageSpecial(ID.text.CAREFULLY_DRAW_WATER)
         player:messageSpecial(ID.text.FLASK_FULL) 
         player:delKeyItem(tpz.ki.WASHUS_FLASK)
         npcUtil.giveKeyItem(player, tpz.ki.FLASK_OF_CLAM_WATER)
         player:messageSpecial(ID.text.KEYITEM_OBTAINED, FLASK_OF_CLAM_WATER) 
         player:setCharVar("ChasingDreams", 8)
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
