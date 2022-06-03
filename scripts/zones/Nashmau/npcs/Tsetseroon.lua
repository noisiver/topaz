-----------------------------------
-- Area: Nashmau
--  NPC: Tsetseroon
-- Standard Info NPC
-- !pos -13.014 -6.000 68.971 53
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/items")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if (player:getCharVar("WhatFriendsAreFor") == 2) and npcUtil.tradeHasExactly(trade, {tpz.items.CHUNK_OF_TIN_ORE, tpz.items.COBALT_JELLYFISH}) then
        player:startEvent(18)
    end
end

function onTrigger(player, npc)
    if (player:getCharVar("WhatFriendsAreFor") == 1) then
        player:startEvent(16)
    elseif (player:getCharVar("WhatFriendsAreFor") == 2) then
        player:startEvent(17)
    elseif (player:getCharVar("WhatFriendsAreFor") == 3) then
        player:startEvent(19)
    elseif (player:getCharVar("WhatFriendsAreFor") == 4) then
        player:startEvent(20)
    elseif (player:getQuestStatus(AHT_URHGAN, tpz.quest.id.ahtUrhgan.WHAT_FRIENDS_ARE_FOR) == QUEST_COMPLETED) then
        player:startEvent(21)
    else
        player:startEvent(4)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if (csid == 16) then
        player:addQuest(AHT_URHGAN, tpz.quest.id.ahtUrhgan.WHAT_FRIENDS_ARE_FOR)
        player:setCharVar("WhatFriendsAreFor", 2)
    elseif (csid == 18) then
        player:confirmTrade()
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.POT_OF_TSETSEROONS_STEW)
        player:addKeyItem(tpz.ki.POT_OF_TSETSEROONS_STEW)
        player:setCharVar("WhatFriendsAreFor", 3)
    elseif (csid == 20) then
        if player:hasKeyItem(tpz.ki.MAP_OF_AYDEEWA_SUBTERRANE) then
            if npcUtil.giveItem(player, tpz.items.IMPERIAL_BRONZE_PIECE) then
            npcUtil.completeQuest(player, AHT_URHGAN, tpz.quest.id.ahtUrhgan.WHAT_FRIENDS_ARE_FOR, {
            var = "WhatFriendsAreFor", 
            })
            end
        else
            npcUtil.completeQuest(player, AHT_URHGAN, tpz.quest.id.ahtUrhgan.WHAT_FRIENDS_ARE_FOR, {
                ki = tpz.ki.MAP_OF_AYDEEWA_SUBTERRANE,  
                var = "WhatFriendsAreFor", 
            })
        end
    end
end
