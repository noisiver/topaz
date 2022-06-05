-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: ??? (What Friends Are For)
-- !pos -405.888 6.514 -440.237 68
-----------------------------------
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if (player:getCharVar("WhatFriendsAreFor") == 3) and player:hasKeyItem(tpz.ki.POT_OF_TSETSEROONS_STEW) then
        player:startEvent(8)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 8 then
        player:delKeyItem(tpz.ki.POT_OF_TSETSEROONS_STEW)
        player:setCharVar("WhatFriendsAreFor", 4)
        if option == 1 then
            npcUtil.giveKeyItem(player, tpz.ki.MAP_OF_AYDEEWA_SUBTERRANE)
        end
    end
end

