-----------------------------------
-- Area: Pso'xja
--  NPC: Avatar Gate
-- !pos -282.742 -3.600 -210.000 9
-- Involved in quest "A Reputation in Ruins"
-----------------------------------
local ID = require("scripts/zones/PsoXja/IDs")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (player:getCharVar("AReputationInRuins") == 5) then
        player:startEvent(7, 0, tpz.ki.PHOENIX_PEARL, tpz.ki.PHOENIX_PEARL, tpz.ki.PHOENIX_PEARL, tpz.ki.PHOENIX_PEARL, 0, 0, 0)
    else
        player:messageSpecial(ID.text.SHUT_TIGHTLY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 7 then
        player:delKeyItem(tpz.ki.PHOENIX_PEARL)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED + 1, tpz.ki.PHOENIX_PEARL)
        player:setCharVar("AReputationInRuins", 6)
    end
end
